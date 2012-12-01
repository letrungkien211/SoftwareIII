/*****************************************
  画像データをjpeg圧縮を行ってデータ送信するようにしたもの
  これに対応したvision-viewerである必要がある

 *****************************************/
#include <cv.h>       //for opencv
#include <highgui.h>  //for opencv
#include <sys/sem.h>  //for semaphore
#include "multi_socket_functions.h"  //for socket
#include "interpreter.h"             //for socket
#include "robot.h"                   //for socket

/**** ソケット通信周り宣言 ***********/
int server_sock;
client sockets[MAX_SOCKET]; 
/**** ソケット通信周り宣言(ここまで) ***/

/**** セマフォ周り宣言 ***********/
int raw_semaphore;              //元画像データをロックするためのsemaphore
int process_semaphore;          //処理画像データをロックするためのsemaphore
union semun {
  int val;
  struct semid_ds *buf;
  unsigned short *array;
  struct seminfo *__buf;
};
void sema_lock(int sem);
void sema_unlock(int sem);
void sema_wait(int sem);
/**** セマフォ周り宣言(ここまで) ***********/

/**** 画像処理周り宣言         ***********/
unsigned char *rawdata; //画像データを格納する
unsigned char *processdata; //画像データを格納する
int height, width;      //画像データのサイズ
//#define PROCESS_WIDTH  80    //処理画像データの横
//#define PROCESS_HEIGHT 60    //処理画像データの縦
#define PROCESS_WIDTH  160    //処理画像データの横
#define PROCESS_HEIGHT 120    //処理画像データの縦
int process_width = PROCESS_WIDTH;
int process_height = PROCESS_HEIGHT;

//jpg変換用
CvMat *jpg_buf;
CvMat *jpg_buf2;
//int jpeg_params[] = {CV_IMWRITE_JPEG_QUALITY, 10, 0}; //jpeg 第２引数は品質
int jpeg_params[] = {CV_IMWRITE_JPEG_QUALITY, 50, 0}; //jpeg 第２引数は品質

//赤色抽出の閾値定義(すごく適当なので調整してください )
// ※Lawsonのからあげ君のとさかの色がよく写るっぽい
#define R_MIN_THRE 150
#define R_MAX_THRE 255
#define G_MIN_THRE 0
#define G_MAX_THRE 120
#define B_MIN_THRE 0
#define B_MAX_THRE 100
void maskRGB(IplImage* src_img, IplImage *dst_img, int rgb_thre[]);
void drawCross(IplImage* image, CvPoint* center, CvScalar color);
void myBinarize(IplImage* image, IplImage* g_image, IplImage* b_image);
int rgb_thre[6];
//Labeling情報
#define MAX_LABEL_NUM 255
#define DISPLAY_LABEL_NUM 4 //表示するラベル最大数
#define MINIMUM_AREA 10     //表示する最小面積
int minimum_area = MINIMUM_AREA;
int display_label_num = DISPLAY_LABEL_NUM;

struct label_info{
  float xpos; //各labelの重心x座標を格納
  float ypos; //各labelの重心y座標を格納
  int area;   //各labelの面積を格納
} linfo[MAX_LABEL_NUM];
int* label_buf; //labeling情報を格納する:sizeはh*w
int label_num=0;  //Labelingされた個数
void labeling(unsigned char* pPixel, int height, int width, int* const labelled_buffer, int step);
int labeling_result(struct label_info* li, int* const labelled_buffer, int height, int width);
/**** 画像処理周り宣言(ここまで) ***********/

/******************************************************
 interpreter関数
   ソケット通信でclientからコマンドがきたら、コマンドに応じて返信する
 *****************************************************/
int interpreter(char *line){
  char com[128];
  char *ptr;
  int command_flag=FALSE;
  int fd = get_socket_fd();
  char result[8024];   //結果の文字列領域
  int size;
  int i;

  //コマンドを切り出す
  while (*line && whitespace (*line)) line++;
  ptr = read_token(line, "%s", com);
  //fprintf(stderr, "recv command: %s\n", com);

  /******** コマンドに応じて返すデータを変更(ここから)  *********/
  //生画像データが欲しい
  if(strcmp(com, "write-rawdata") == 0){
    //rawdataを送っている間に画像データが書き変わらないようにロックをかける
    sema_lock(raw_semaphore);
    write(fd, rawdata, (process_width*process_height*3));
    sema_unlock(raw_semaphore);
    command_flag = TRUE;
  }
  //処理語画像データが欲しい
  else if(strcmp(com, "write-processdata") == 0){
    sema_lock(process_semaphore);
    write(fd, processdata, (process_width*process_height*3));
    sema_unlock(process_semaphore);
    command_flag = TRUE;
  }
  //get jpg conversion
  else if(strcmp(com, "write-jpgrawdata") == 0){
    fprintf(stderr, "*");
    sema_lock(raw_semaphore);
    write(fd, &(jpg_buf->step), sizeof(int));
    for(i=0; i<jpg_buf->step; i++){
      write(fd, &(jpg_buf->data.ptr[i]), sizeof(unsigned char));
    }
    sema_unlock(raw_semaphore);
    command_flag = TRUE;
  }
  //処理語画像データが欲しい
  else if(strcmp(com, "write-jpgprocessdata") == 0){
    fprintf(stderr, "-");
    sema_lock(process_semaphore);
    write(fd, &(jpg_buf2->step), sizeof(int));
    for(i=0; i<jpg_buf2->step; i++){
      write(fd, &(jpg_buf2->data.ptr[i]), sizeof(unsigned char));
    }
    sema_unlock(process_semaphore);
    command_flag = TRUE;
  }
  //処理結果(座標等)が欲しい  
  //  euslispで解釈しやすいように、()のリスト情報で情報付しておいてやるのがよい
  //  仕様は自分で決めて、後でclientのeuslisp側のソフトが動くものを作ればいい
  //  ここでは重心位置を返すようにしている
  else if(strcmp(com, "result") == 0){
    size = sprintf(result, "((:centroid");
    for(i=0; i<label_num; i++){
      size += sprintf(result+size, " #f(%d %d)", (int)linfo[i].xpos,(int)linfo[i].ypos);
    }
    size += sprintf(result+size, ")");
    size += sprintf(result+size, " (:area");
    for(i=0; i<label_num; i++){
      size += sprintf(result+size, " %d", linfo[i].area);
    }
    size += sprintf(result+size, "))\n");
    write(fd, result, size);
    command_flag = TRUE;
  }
  //縦横を返す for vision-viewer
  else if(strcmp(com, "vision-size")==0){
    size = sprintf(result, "(%d %d)\n", process_height, process_width);
    write(fd, result, size);
    command_flag = TRUE;
  }
  //閾値を変更したい
  else if(strcmp(com, "color-threshold") == 0){
    for(i=0; i<6; i++){
      ptr = read_token(ptr, "%d", &rgb_thre[i]);
    }
    fprintf(stderr, "change rgb_threshold ");
    for(i=0; i<6; i++){
      fprintf(stderr, "%d ", rgb_thre[i]);
    }
    fprintf(stderr, "\n");
    command_flag = TRUE;
  }
  //閾値を取得したい
  else if(strcmp(com, "get-color-threshold") == 0){
    size = sprintf(result, "#f(");
    for(i=0; i<6; i++){
      size += sprintf(result+size, "%d ", rgb_thre[i]);
    }
    size += sprintf(result+size, ")\n");
    write(fd, result, size);
    command_flag = TRUE;
  }
  //Labeling個数をセット 引数一つ
  else if(strcmp(com, "set-displaylabel-num") == 0){
    ptr = read_token(ptr, "%d", &display_label_num);
    fprintf(stderr, "change displaylabelnum %d\n", display_label_num);
    command_flag = TRUE;
  }
  //Labeling個数を取得
  else if(strcmp(com, "get-displaylabel-num") == 0){
    size = sprintf(result, "%d\n", display_label_num);
    write(fd, result, size);
    command_flag = TRUE;
  }
  //表示最小面積をセット 引数ひとつ
  else if(strcmp(com, "set-minarea") == 0){
    ptr = read_token(ptr, "%d", &minimum_area);
    fprintf(stderr, "change minimu area size %d\n", minimum_area);
    command_flag = TRUE;
  }
  //表示最小面積を取得
  else if(strcmp(com, "get-minarea") == 0){
    size = sprintf(result, "%d\n", minimum_area);
    write(fd, result, size);
    command_flag = TRUE;
  }
  /******** コマンドに応じて返すデータを変更(ここまで)  *********/
  //該当しないコマンドがきた場合はその旨を表示
  if(command_flag == FALSE){
    fprintf(stderr, "No such command %s\n", com);
  }
  return 0;
}

/*************************************************
  vision-serverの本体
    Cameraデータの取得、画像処理、ソケット通信待ち受けを行う
************************************************/
int main (int argc, char **argv){
  CvSize size;
  int step;
  CvCapture *cap;
  IplImage *capture_image;
  IplImage *frame_image;
  IplImage *processed_image;
  IplImage *grayImage; 
  IplImage *binaryImage;
  unsigned char* binarydata;

  CvFont font;
  char text[50];
  char hostname[30];
  int s, i, port = 9000;
  pthread_t tid;

  /*** socket通信のための処理(ここから) ***/
  for (i=1;i<argc;i++){
    if (strcmp("-port", argv[i]) == 0) {
      port=atoi(argv[++i]);
    }}
  gethostname(hostname, sizeof(hostname));
  s = init_socket_server(hostname, &port);
  fprintf(stderr, "hostname %s\n", hostname);
  for (i=0; i< MAX_SOCKET ; i++) sockets[i].type=0;
  //threadで待ちうけ
  fprintf(stderr, "Waiting connection...\n");
  pthread_create(&tid, NULL, acceptor, (void *)s);
  /*** socket通信のための処理(ここまで) ***/

  /** semaphoreの準備 ***/
  raw_semaphore = semget((key_t)1111, 1, 0666|IPC_CREAT);
  if(raw_semaphore == -1){
    perror("semget failure");
    exit(EXIT_FAILURE);
  }
  process_semaphore = semget((key_t)1111, 1, 0666|IPC_CREAT);
  if(process_semaphore == -1){
    perror("semget failure");
    exit(EXIT_FAILURE);
  }
  union semun semunion;
  semunion.val = 0;  //semaphoreの初期値
  if(semctl(raw_semaphore, 0, SETVAL, semunion) == -1){
    perror("semctl(init) failure");
    exit(EXIT_FAILURE);
  }
  if(semctl(process_semaphore, 0, SETVAL, semunion) == -1){
    perror("semctl(init) failure");
    exit(EXIT_FAILURE);
  }
  /** semaphoreの準備(ここまで) ***/

  /** cameraや画像取得の用意(ここから) ***/
  //camera initialization 
  if((cap = cvCreateCameraCapture(-1))==NULL){
    printf("Couldn't find any camera.\n");
    return -1;
  }
  capture_image = cvQueryFrame(cap);
  width = capture_image->width;
  height = capture_image->height;
  fprintf(stderr, "height %d, width %d\n", height, width);
  fprintf(stderr, "process height %d, process width %d\n", process_height, process_width);
  //
  //これをすると早くなる？？
  //cvSetCaptureProperty(cap, CV_CAP_PROP_FRAME_WIDTH, width);
  //cvSetCaptureProperty(cap, CV_CAP_PROP_FRAME_HEIGHT, height);
  //cvSetCaptureProperty(cap, CV_CAP_PROP_PALETTE, VIDEO_PALETTE_RGB24_JPG);

  /** cameraや画像取得の用意(ここまで) ***/

  /** 画像処理(赤色抽出)の準備 ***/
  //fontの設定(しないとSegfaultで落ちる)
  float hscale = 1.0f;
  float vscale = 1.0f;
  float italicscale = 0.0f;
  int thickness = 3;
  cvInitFont(&font, CV_FONT_HERSHEY_COMPLEX, hscale, vscale, italicscale, thickness, CV_AA);
  //font設定ここまで
  // Set threshold
  rgb_thre[0] = R_MIN_THRE;
  rgb_thre[1] = R_MAX_THRE;
  rgb_thre[2] = G_MIN_THRE;
  rgb_thre[3] = G_MAX_THRE;
  rgb_thre[4] = B_MIN_THRE;
  rgb_thre[5] = B_MAX_THRE;


  //画像処理するイメージ領域を確保
  frame_image = cvCreateImage(cvSize(process_width, process_height), IPL_DEPTH_8U, 3);
  processed_image = cvCreateImage(cvSize(process_width, process_height), IPL_DEPTH_8U, 3);
  /** 画像処理(赤色抽出)の準備(ここまで) ***/

  
  /**** 面積を出すための２値化 ***/
  grayImage = cvCreateImage(cvGetSize(frame_image), IPL_DEPTH_8U, 1);
  binaryImage = cvCreateImage(cvGetSize(frame_image), IPL_DEPTH_8U, 1);
  
  //Labeling init
  label_buf = (int*)malloc(sizeof(int)*frame_image->width*frame_image->height);

  /**** main loop(本体) ****/
  while(1){
    CvPoint centroid;
    //カメラ画像をcaptureする
    capture_image = cvQueryFrame(cap);
    if (capture_image==NULL) {
      fprintf(stderr, "capture_image is %p\n", capture_image);
      continue;
    }
    // tiisaku suru
    cvResize(capture_image, frame_image, CV_INTER_LINEAR);
    //カメラ画像を処理する
    maskRGB(frame_image, processed_image, rgb_thre);          //赤色抽出

#if 1
    //too heavy
    // Binarize
    myBinarize(processed_image, grayImage, binaryImage);
    cvDilate(binaryImage, grayImage, NULL, 10); //ぼうちょう
    cvErode(grayImage, binaryImage, NULL, 15);  //収縮
    // Labeling
    cvGetRawData(binaryImage, &binarydata, &step, &size);
    labeling(binarydata, frame_image->height, frame_image->width, label_buf, step);
    label_num = labeling_result(&linfo, label_buf, frame_image->height, frame_image->width);
    //処理結果を書き込む
    {
      int i,n;
      n=25;
      //fprintf(stderr, "num is %d\n", label_num);
      for(i=0; i<label_num; i++){
        //fprintf(stderr, "area %d, x %d y %d\n", linfo[i].area, (int)linfo[i].xpos, (int)linfo[i].ypos);
        centroid.x = (int) linfo[i].xpos;
        centroid.y = (int) linfo[i].ypos;
        drawCross(processed_image, &centroid, CV_RGB(0, 255, 0));                                 //×印をいれる
        sprintf(text, "X: %d Y: %d AREA: %d", centroid.x, centroid.y, linfo[i].area);             //値をかく
        cvPutText(processed_image, text, cvPoint(n, (height-n*(i+1))), &font, CV_RGB(0, 255, 0)); //
      }
    }
#endif
    // image -> rawdata
    sema_wait(raw_semaphore); //not needed?
    //cvGetRawData(capture_image, &rawdata, &step, &size);
    jpg_buf = cvEncodeImage(".jpg", frame_image,  jpeg_params);
    //
    // process image -> process data
    sema_wait(process_semaphore);
    //cvGetRawData(processed_image, &processdata, &step, &size);
    //jpg_buf2 = cvEncodeImage(".jpg", frame_image,  jpeg_params);
    jpg_buf2 = cvEncodeImage(".jpg", processed_image,  jpeg_params);
    fprintf(stderr, ".");

    //sleep
    //usleep(30000);
    //usleep(1000);
  }
  //release the capture object
  cvReleaseCapture(&cap);
  return 0;
}

/********************************************************
 画像処理関数  赤色抽出とか重心計算とか
    image-process-sampleの例とかで書いてあるのと同じ
    まずはimage-process-sampleでstandaloneで動くのを確認してから
    その処理をこのサーバプログラムに写すのがステップとして正解かも
 ********************************************************/
//指定した色にマスクをかける
void maskRGB(IplImage* src_img, IplImage *dst_img, int rgb_thre[]) {
  int x = 0, y = 0;
  uchar R, G, B;
  uchar *p_src, *p_dst;
  CvPixelPosition8u pos_src, pos_dst;

  IplImage* tmp = cvCreateImage(cvGetSize(src_img), IPL_DEPTH_8U , 3);
  cvCopy(src_img, tmp, NULL);

  CV_INIT_PIXEL_POS(pos_src, (unsigned char *)tmp->imageData,
  		    tmp->widthStep, cvGetSize(tmp), x, y, tmp->origin);
  CV_INIT_PIXEL_POS(pos_dst, (unsigned char *)dst_img->imageData,
		    dst_img->widthStep, cvGetSize(dst_img), x, y, dst_img->origin);

  for( y=0; y < src_img->height; y++) {
    for ( x=0; x < src_img->width; x++) {
      p_src = CV_MOVE_TO(pos_src, x, y, 3);
      p_dst = CV_MOVE_TO(pos_dst, x, y, 3);

      R = p_src[2];
      G = p_src[1];
      B = p_src[0];

      if(rgb_thre[0] <= R && R <= rgb_thre[1] &&
	 rgb_thre[2] <= G && G <= rgb_thre[3] &&
	 rgb_thre[4] <= B && B <= rgb_thre[5]) {
	p_dst[0] = p_src[0];
	p_dst[1] = p_src[1];
	p_dst[2] = p_src[2];
	}
      else {
	p_dst[0] = 0;
	p_dst[1] = 0;
	p_dst[2] = 0;
      }
    }
  }
  cvReleaseImage(&tmp);
}

//画像を２値化
void myBinarize(IplImage* image, IplImage* g_image, IplImage* b_image) {
  //画像をgreyscaleに変換
  cvCvtColor(image, g_image, CV_BGR2GRAY);
  cvThreshold(g_image, b_image, 0, 255, CV_THRESH_BINARY);
}

//指定した場所に×印を書く
void drawCross(IplImage* image, CvPoint* center, CvScalar color) {
  //colorの後が線の太さとなる,その後ろが線の種類
    cvLine(image,
	   cvPoint(center->x - 20, center->y),
	   cvPoint(center->x + 20, center->y),
	   color, 3, 8, 0);
    cvLine(image,
	   cvPoint(center->x, center->y - 20),
	   cvPoint(center->x, center->y + 20),
	   color, 3, 8, 0);
}

//Labeling
// 汎用
void _labeling(int * const label, int labeling_num , int w, int h)
{
  *label = labeling_num;
  int* pPixel = label;
  pPixel++;
  if( *pPixel == 0) _labeling(pPixel, labeling_num, w, h);
  pPixel+=w;
  if( *pPixel == 0) _labeling(pPixel, labeling_num, w, h);
  pPixel--;
  if( *pPixel == 0) _labeling(pPixel, labeling_num, w, h);
  pPixel--;
  if( *pPixel == 0) _labeling(pPixel, labeling_num, w, h);
  pPixel-=w;
  if( *pPixel == 0) _labeling(pPixel, labeling_num, w, h);
  pPixel-=w;
  if( *pPixel == 0) _labeling(pPixel, labeling_num, w,h);			
  pPixel++;
  if( *pPixel == 0) _labeling(pPixel, labeling_num, w,h);
  pPixel++;
  if( *pPixel == 0) _labeling(pPixel, labeling_num, w,h);
}
/**
 * ラベリング
 */
void labeling(unsigned char* src, int height, int width, int* const labelled_buffer, int step)
{
  {
    int* pLabel = labelled_buffer;
    unsigned char* pPixel = src;
    int x, y;
    for(y = 0; y < height; y++ ){
      for(x = 0; x < width; x++ ){
        if(x == 0 || y==0 || x==width-1 ||  y==height-1){
        //if(x == 0 || y==0 || x==width-1 ||  y==2){
          *pLabel = MAX_LABEL_NUM;
        }else{
          if ( *pPixel > 0 )
            *pLabel = 0;
          else 
            *pLabel = MAX_LABEL_NUM;
        }
	pPixel++;
	pLabel++;
      }
      pPixel += step-width;
    }
  }
  {
    int label_num = 1;
    int* pLabel = labelled_buffer;
    int x, y;
    for(y = 0; y < height; y++ )
      {
	for(x = 0; x < width; x++ )
	  {
	    if(*pLabel == 0 && label_num<MAX_LABEL_NUM)
	      {
		_labeling(pLabel, label_num, width, height);
		label_num++;
	      }
	    pLabel++;
	  }
      }
  }
  {
    int* pLabel = labelled_buffer;
    unsigned char* pPixel = src;
    int x,y;
    for(y = 0; y < height; y++ ){
      for(x = 0; x < width; x++ ){
        *pPixel = *pLabel;
        pPixel++;
        pLabel++;
      }
      pPixel += step-width;
    }
  }
}

int compare_labelinfo(const void* a, const void* b){
  return (((struct label_info*)b)->area - ((struct label_info*)a)->area);
}

//labelingの結果を集計する
int labeling_result(struct label_info* li, int* const labelled_buffer, int height, int width){
  //このh*wの配列のなかにLabelされたタグ情報が入っている
  int pLabel_max=0;
  int* pLabel = labelled_buffer;
  int x,y,i;
  for(i=0; i<MAX_LABEL_NUM; i++){
    li[i].xpos = 0;    
    li[i].ypos = 0;
    li[i].area = 0;
  }
  //label_infoの情報を更新する
  for(y = 0; y < height; y++ ){
    for(x = 0; x < width; x++ ){
      if(*pLabel != MAX_LABEL_NUM && *pLabel != 0 ){
        struct label_info* pli = &li[*pLabel-1];
        pli->xpos += x;
        pli->ypos += y;
        pli->area++;
        if(*pLabel > pLabel_max) pLabel_max = *pLabel;
      }
      pLabel++;
    }}
  //
  if(pLabel_max > display_label_num) pLabel_max = display_label_num;
  qsort(li, pLabel_max, sizeof(struct label_info), compare_labelinfo);
  //
  for(i=0; i<pLabel_max; i++){
    //もし面積が小さかったら脱出する
    if(li[i].area < minimum_area){
      pLabel_max = i;
      break;
    }
    li[i].xpos = li[i].xpos/(float)li[i].area;
    li[i].ypos = li[i].ypos/(float)li[i].area;
  }
  return pLabel_max;
}


/********************************************************
   semaphoreの排他制御のための関数(ロックしたり、外したり、待ったり)
*********************************************************/
void sema_lock(int sem){
  struct sembuf semb;
  semb.sem_num = 0;
  semb.sem_op = 1;  //lock
  semb.sem_flg = SEM_UNDO;
  if(semop(sem, &semb, 1) == -1){
    perror("semop(lock) failure");
  }}

void sema_unlock(int sem){
  struct sembuf semb;
  semb.sem_num = 0;
  semb.sem_op = -1;  //unlock
  semb.sem_flg = SEM_UNDO;
  if(semop(sem, &semb, 1) == -1){
    perror("semop(unlock) failure");
  }}

void sema_wait(int sem){
  struct sembuf semb;
  semb.sem_num = 0;
  semb.sem_op = 0;  //unlock
  semb.sem_flg = SEM_UNDO;
  if(semop(sem, &semb, 1) == -1){
    perror("semop(wait) failure");
  }}

