/*****************************************
  mallocかけないと、データ送信中にデータを書き換えられてしまうな
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
CvPoint centroid;       //重心位置

//赤色抽出の閾値定義(すごく適当なので調整してください )
// ※Lawsonのからあげ君のとさかの色がよく写るっぽい
#define R_MIN_THRE 150
#define R_MAX_THRE 255
#define G_MIN_THRE 0
#define G_MAX_THRE 120
#define B_MIN_THRE 0
#define B_MAX_THRE 100
void maskRGB(IplImage* src_img, IplImage *dst_img, int rgb_thre[]);
CvPoint calcCentroid(IplImage* image);
void drawCross(IplImage* image, CvPoint* center, CvScalar color);
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

  //コマンドを切り出す
  while (*line && whitespace (*line)) line++;
  ptr = read_token(line, "%s", com);
  //fprintf(stderr, "recv command: %s\n", com);

  /******** コマンドに応じて返すデータを変更(ここから)  *********/
  //生画像データが欲しい
  if(strcmp(com, "write-rawdata") == 0){
    //rawdataを送っている間に画像データが書き変わらないようにロックをかける
    sema_lock(raw_semaphore);
    write(fd, rawdata, (width*height*3));
    sema_unlock(raw_semaphore);
    command_flag = TRUE;
  }
  //処理語画像データが欲しい
  else if(strcmp(com, "write-processdata") == 0){
    sema_lock(process_semaphore);
    write(fd, processdata, (width*height*3));
    sema_unlock(process_semaphore);
    command_flag = TRUE;
  }
  //処理結果(座標等)が欲しい  
  //  euslispで解釈しやすいように、()のリスト情報で情報付しておいてやるのがよい
  //  仕様は自分で決めて、後でclientのeuslisp側のソフトが動くものを作ればいい
  //  ここでは重心位置を返すようにしている
  else if(strcmp(com, "result") == 0){
    size = sprintf(result, "((:centroid #f(%d %d)))\n", 
                   centroid.x, centroid.y);
    write(fd, result, size);
    command_flag = TRUE;
  }
  //縦横を返す for vision-viewer
  else if(strcmp(com, "vision-size")==0){
    size = sprintf(result, "(%d %d)\n", height, width);
    write(fd, result, size);
    command_flag = TRUE;
  }
  /******** コマンドに応じて返すデータを変更(ここまで)  *********/

  //
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
  IplImage *frame_image;
  IplImage *processed_image;
  int rgb_thre[6];  
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
  frame_image = cvQueryFrame(cap);
  width = frame_image->width;
  height = frame_image->height;
  fprintf(stderr, "height %d, width %d\n", height, width);
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
  processed_image = cvCreateImage(cvSize(width, height), IPL_DEPTH_8U, 3);
  /** 画像処理(赤色抽出)の準備(ここまで) ***/

  /**** main loop(本体) ****/
  while(1){
    //カメラ画像をcaptureする
    frame_image = cvQueryFrame(cap);

    if (frame_image==NULL) {
      fprintf(stderr, "frame_image is %p\n", frame_image);
      continue;
    }
    //カメラ画像を処理する
    maskRGB(frame_image, processed_image, rgb_thre);          //赤色抽出
    centroid = calcCentroid(processed_image);                 //重心計算
    drawCross(processed_image, &centroid, CV_RGB(0, 255, 0)); //重心位置に×
    sprintf(text, "X: %d Y: %d", centroid.x, centroid.y);     //文字書き込み
    cvPutText(processed_image, text, cvPoint(25, (height-25)), &font, CV_RGB(0, 255, 0));
    
    // image -> rawdata
    sema_wait(raw_semaphore);
    cvGetRawData(frame_image, &rawdata, &step, &size);
    // process image -> process data
    sema_wait(process_semaphore);
    cvGetRawData(processed_image, &processdata, &step, &size);

    fprintf(stderr, ".");
    //sleep
    usleep(30000);
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
//画像の重心を出す
CvPoint calcCentroid(IplImage* image) {
  CvMoments moments;
  double m_00, m_10, m_01;

  cvSetImageCOI(image, 3);
  cvMoments(image, &moments, 0);
  cvSetImageCOI(image, 0);

  m_00 = cvGetSpatialMoment(&moments, 0, 0);
  m_10 = cvGetSpatialMoment(&moments, 1, 0);
  m_01 = cvGetSpatialMoment(&moments, 0, 1);
  
  return cvPoint(m_10 / m_00, m_01 / m_00);
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

