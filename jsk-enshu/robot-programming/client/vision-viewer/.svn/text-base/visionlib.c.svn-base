#include "visionlib.h"
#include "interpreter.h"


static char *disp_buff;
static int step;
static CvSize size;
static unsigned char *rawdata;
static unsigned char *processdata;
static IplImage *process_image;
static int width, height;
//
static IplImage *jpg_image;
static CvMat* jpg_buf;
static CvMat* jpg_buf2;
static int step_num;
static unsigned char *jpg_disp_buff;

IplImage *raw_image;

client sockets[MAX_SOCKET];              //ここでは使わないけど実体なくてエラーになるので定義しておく
int interpreter(char *line){return 0;};  //ここでは使わないけど実体なくてエラーになるので定義しておく

int init_vision (char *host, int port) {
  char *ptr;
  char buf[8192];
  int ret;
  startup_client(host, port, &client_sock);
  cvNamedWindow("Original", 0);         //元画像の表示画面
  //cvResizeWindow("Original", width, height);
  cvNamedWindow("Processed", 0);       //処理後の表示画面
  cvMoveWindow("Processed", 300, 0);  //画面を移動
  //
  //vision-serverでの画像サイズを取得する
  write(client_sock, "vision-size\n", 64); 
  // height width がかえって来る
  ret = read(client_sock, buf, sizeof(buf));
  ptr = buf;
  ptr = read_token(ptr, "(%d", &height);
  ptr = read_token(ptr, "%d)", &width);
  fprintf(stderr, "height: %d, width: %d\n", height, width);

  raw_image = cvCreateImage(cvSize(width,height), 8, 3);  
  process_image = cvCreateImage(cvSize(width, height), 8, 3);

  cvGetRawData(raw_image, &rawdata, &step, &size);         //raw_imageはrawdataの中身を写す
  cvGetRawData(process_image, &processdata, &step, &size); //process_imageはprocessdataの中身を写す

  //一時格納領域はraw,process共通のものを使う
  disp_buff = (char*)malloc(sizeof(char)* (width*height*3+1));
  jpg_disp_buff = (unsigned char*)malloc(sizeof(unsigned char)* (width*height));

  return 0;
}

int proc_vision () {
  int jusin_size=0;
  int remaining=0;
  int totalsize=0;
  int i=0;
  //元画像データと処理画像データ両方を取得、表示する
  /**** 元画像データ表示の処理(ここから) *****/
  //1)生画像をくれというコマンドをsocket通信でvisionサーバに対して送信
  write(client_sock, "write-rawdata\n", 64); 
  //2) 画像データをdataに読み込み
  memset(disp_buff, '\0', step*size.height+1);
  remaining = step*size.height;
  totalsize = 0;
  while(remaining>0){
    jusin_size = recv(client_sock, disp_buff+totalsize, remaining, 0);
    totalsize += jusin_size;
    remaining -= jusin_size;
  }
  memcpy(rawdata, disp_buff, totalsize);   //一度格納したdisp_bufから実際写すrawdataへコピーする
  //3) 画像を表示
  cvShowImage("Original", raw_image);
  /**** 元画像データ表示の処理(ここまで) *****/

  /**** 処理結果画像データ表示の処理(上と同じことを繰り返すだけ) *****/
  write(client_sock, "write-processdata\n", 64);
  memset(disp_buff, '\0', step*size.height+1);
  remaining = step*size.height;
  totalsize = 0;
  while(remaining>0){
    jusin_size = recv(client_sock, disp_buff+totalsize, remaining, 0);
    totalsize += jusin_size;
    remaining -= jusin_size;
  }
  memcpy(processdata, disp_buff, totalsize);
  cvShowImage("Processed", process_image);
  /**** 処理結果画像データ表示の処理(ここまで) *****/

  cvWaitKey(30);
  return 0;
}

int proc_jpg_vision () {
  int jusin_size=0;
  int remaining=0;
  int totalsize=0;
  int i=0;

  //1)rawdata
  write(client_sock, "write-jpgrawdata\n", 64); 
  recv(client_sock, &step_num, sizeof(int), 0);
  fprintf(stderr, "step_num %d\n", step_num);
  memset(jpg_disp_buff, '\0', step_num+1);
  remaining = step_num;
  totalsize = 0;
  while(remaining>0){
    jusin_size = recv(client_sock, jpg_disp_buff+totalsize, remaining, 0);
    totalsize += jusin_size;
    remaining -= jusin_size;
  }
  jpg_buf = cvCreateMat(1, step_num, CV_8UC1);
  for(i=0; i<step_num; i++){
    jpg_buf->data.ptr[i] = jpg_disp_buff[i];
  }
  //jpg_image = cvDecodeImage(jpg_buf,1); //1: color 0:gray
  //cvShowImage("Original", jpg_image);
  raw_image = cvDecodeImage(jpg_buf,1); //1: color 0:gray
  cvShowImage("Original", raw_image);
  cvReleaseMat(&jpg_buf);
  //
  //2)processdata
  write(client_sock, "write-jpgprocessdata\n", 64); 
  recv(client_sock, &step_num, sizeof(int), 0);
  fprintf(stderr, "step_num %d\n", step_num);
  memset(jpg_disp_buff, '\0', step_num+1);
  remaining = step_num;
  totalsize = 0;
  while(remaining>0){
    jusin_size = recv(client_sock, jpg_disp_buff+totalsize, remaining, 0);
    totalsize += jusin_size;
    remaining -= jusin_size;
  }
  jpg_buf = cvCreateMat(1, step_num, CV_8UC1);
  for(i=0; i<step_num; i++){
    jpg_buf->data.ptr[i] = jpg_disp_buff[i];
  }
  //jpg_image = cvDecodeImage(jpg_buf,1); //1: color 0:gray
  //cvShowImage("Processed", jpg_image);
  process_image = cvDecodeImage(jpg_buf,1); //1: color 0:gray
  cvShowImage("Processed", process_image);
  cvReleaseMat(&jpg_buf);
  /**** 元画像データ表示の処理(ここまで) *****/

  cvWaitKey(30);
  return 0;
}

void get_vision (float *ret) {
  IplImage *src_img_gray = cvCreateImage(cvGetSize(process_image), IPL_DEPTH_8U, 1);
  IplImage *dst_img_gray = cvCreateImage(cvGetSize(process_image), IPL_DEPTH_8U, 1);


  // (b)グレイ画像を作成                                              
  cvCvtColor(process_image, src_img_gray, CV_BGR2GRAY);

  // (c)二値画像化                                                    
  cvThreshold(src_img_gray, dst_img_gray, 90, 255, CV_THRESH_BINARY | CV_THRESH_OTSU);
  
  //
  ret[0] = 0; ret[1] = 0; ret[2] = 0;
  unsigned char *gray_data;
  int step, i, j;
  cvGetRawData(dst_img_gray, &gray_data, &step, &size);
  for (i = 0; i< size.width; i++ ) {
    for (j = 0; j< size.height; j++ ) {
      if (gray_data[i*size.height+j] > 128) {
        ret[0]++;
      }else{
        ret[1]++;
      }
      ret[2]++;
    }
  }
  fprintf(stderr, "ret->%f %f %f\n", ret[0], ret[1], ret[2]);

  cvReleaseImage (&src_img_gray);
  cvReleaseImage (&dst_img_gray);

  return 0;
}


int quit_vision () {
  cvReleaseImage(&raw_image);
  cvReleaseImage(&process_image);
  cvDestroyWindow("Original");
  cvDestroyWindow("Processed");
  close(client_sock);
  free(disp_buff);
  return 0;
}


