/*****************************************
  Labelingを行う
    using urata labeling library
 *****************************************/
#include <cv.h>
#include <highgui.h>
#include <stdio.h>
#include <unistd.h>

#define R_MIN_THRE 150
#define R_MAX_THRE 255
#define G_MIN_THRE 0
#define G_MAX_THRE 120
#define B_MIN_THRE 0
#define B_MAX_THRE 100

//Labeling情報
#define MAX_LABEL_NUM 255
struct label_info{
  float xpos; //各labelの重心x座標を格納
  float ypos; //各labelの重心y座標を格納
  int area;   //各labelの面積を格納
} linfo[MAX_LABEL_NUM];
int* label_buf; //labeling情報を格納する:sizeはh*w

void maskRGB(IplImage* src_img, IplImage *dst_img, int rgb_thre[]);
void myBinarize(IplImage* image, IplImage* g_image, IplImage* b_image);
void drawCross(IplImage* image, CvPoint* center, CvScalar color);
void labeling(unsigned char* pPixel, int height, int width, int* const labelled_buffer, int step);
int labeling_result(struct label_info* li, int* const labelled_buffer, int height, int width);

/************************************
  Mainループ
    画像の取得、処理結果の表示を周期実行
 ***********************************/
int main (int argc, char **argv){
  int width, height;
  int input;

  IplImage *frame_image;
  IplImage *processed_image;
  IplImage *grayImage; 
  IplImage *binaryImage;
  unsigned char* binarydata;
  int step;
  CvSize size;

  int rgb_thre[6];
  CvPoint centroid;
  CvFont font;
  char text[50];
  int i;  
  
  //fontの設定(しないとSegfaultで落ちる)
  float hscale = 0.6f;
  float vscale = 0.6f;
  float italicscale = 0.0f;
  int thickness = 1;
  cvInitFont(&font, CV_FONT_HERSHEY_COMPLEX, hscale, vscale, italicscale, thickness, CV_AA);
  //font設定ここまで
             
  // Set threshold
  if(argc >= 7) {
    for(i = 0; i < 6; i++) {
      rgb_thre[i] = atoi(argv[i+1]);
    }
  } else {
    rgb_thre[0] = R_MIN_THRE;
    rgb_thre[1] = R_MAX_THRE;
    rgb_thre[2] = G_MIN_THRE;
    rgb_thre[3] = G_MAX_THRE;
    rgb_thre[4] = B_MIN_THRE;
    rgb_thre[5] = B_MAX_THRE;
  }
  
  //bmp画像を指定する
  // cameraの場合は、ここでcaptureの結果をとってくればいいわけだ
  frame_image = cvLoadImage("./bmp/sample2.bmp",1);
  //縦横をとってくる
  height = frame_image->height;
  width = frame_image->width;
  fprintf(stderr, "height %d, width %d\n", height, width);
  
  //画像処理するイメージ領域を確保
  processed_image = cvCreateImage(cvSize(width, height), IPL_DEPTH_8U, 3);
  
  //表示画面の用意
  cvNamedWindow("Display", 0);    //元データ表示画面
  cvNamedWindow("Processed", 0);  //処理後の表示画面
  //cvResizeWindow("Display", width, height);  //表示サイズの変更(したければどうぞ)
  cvMoveWindow("Processed", 300, 50);  //画面を移動
  
  //画面にImageを表示
  cvShowImage("Display", frame_image);
  grayImage = cvCreateImage(cvGetSize(frame_image), IPL_DEPTH_8U, 1);
  binaryImage = cvCreateImage(cvGetSize(frame_image), IPL_DEPTH_8U, 1);

  //Labeling init
  label_buf = (int*)malloc(sizeof(int)*width*height);

  //loop画面(bmpからとってくる場合はループを回す必要ないけどね)
  while(input != 113){
    int label_num;

    // Masking by RGB threshold
    maskRGB(frame_image, processed_image, rgb_thre);

    // Binarize
    myBinarize(processed_image, grayImage, binaryImage);

    // Labeling
    //rawdataに格納
    cvGetRawData(binaryImage, &binarydata, &step, &size);
    //fprintf(stderr, "%d %d\n", step, size);
    labeling(binarydata, height, width, label_buf, step);
    label_num = labeling_result(&linfo, label_buf, height, width);
    
    {
      int i,n;
      n=25;
      for(i=0; i<label_num; i++){
        fprintf(stderr, "area %d, x %d y %d\n", linfo[i].area, (int)linfo[i].xpos, (int)linfo[i].ypos);
        centroid.x = (int) linfo[i].xpos;
        centroid.y = (int) linfo[i].ypos;
        drawCross(processed_image, &centroid, CV_RGB(0, 255, 0));                                 //×印をいれる
        sprintf(text, "X: %d Y: %d AREA: %d", centroid.x, centroid.y, linfo[i].area);             //値をかく
        cvPutText(processed_image, text, cvPoint(n, (height-n*(i+1))), &font, CV_RGB(0, 255, 0)); //
      }
    }
    //Imageに画面を更新
    cvShowImage("Display", frame_image);
    cvShowImage("Processed", processed_image);
    //cvShowImage("Processed", binaryImage);

    //33mここでkey入力を待つらしい 引数が小さいと描画されないorz
    // おそらく小さい待ち時間だと描画更新よりもkey待ち受けが優先されてしまうとのこと
    input = cvWaitKey(33);
  }

  //各種memory、deviceの解放
  cvReleaseImage(&frame_image);
  cvReleaseImage(&processed_image);
  cvReleaseImage(&grayImage);
  cvReleaseImage(&binaryImage);
  cvDestroyWindow("Display");
  cvDestroyWindow("Processed");
  free(label_buf);
  return 0;
}


/****************************************

   各種処理を行う関数の定義

 ***************************************/
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
  qsort(li, pLabel_max, sizeof(struct label_info), compare_labelinfo);
  //
  for(i=0; i<pLabel_max; i++){
    li[i].xpos = li[i].xpos/(float)li[i].area;
    li[i].ypos = li[i].ypos/(float)li[i].area;
  }
  return pLabel_max;
  //return 10;
}
