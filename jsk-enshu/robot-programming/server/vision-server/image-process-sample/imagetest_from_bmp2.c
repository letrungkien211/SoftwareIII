/*****************************************
  色抽出後に面積も計算するように変更 areaに面積が入る 

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
void maskRGB(IplImage* src_img, IplImage *dst_img, int rgb_thre[]);
CvPoint calcCentroid(IplImage* image, IplImage* g_image, IplImage* b_image);
void drawCross(IplImage* image, CvPoint* center, CvScalar color);

//画像面積
int area;

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
  
  int rgb_thre[6];
  CvPoint centroid;
  CvFont font;
  char text[50];
  int i;  
  
  //fontの設定(しないとSegfaultで落ちる)
  float hscale = 0.6f;
  float vscale = 0.6f;
  float italicscale = 0.0f;
  int thickness = 2;
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
  frame_image = cvLoadImage("./bmp/sample.bmp",1);
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

  //loop画面(bmpからとってくる場合はループを回す必要ないけどね)
  while(input != 113){
    // Masking by RGB threshold
    maskRGB(frame_image, processed_image, rgb_thre);

    // Calculate Centroid
    centroid = calcCentroid(processed_image, grayImage, binaryImage);

    // Display Centroid
    drawCross(processed_image, &centroid, CV_RGB(0, 255, 0));

    // Text を書き込む
    sprintf(text, "X: %d Y: %d AREA: %d", centroid.x, centroid.y, area);
    cvPutText(processed_image, text, cvPoint(25, (height-25)), &font, CV_RGB(0, 255, 0));

    //Imageに画面を更新
    cvShowImage("Display", frame_image);
    cvShowImage("Processed", processed_image);

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

//画像の重心を出すとともに、面積をセット
CvPoint calcCentroid(IplImage* image, IplImage* g_image, IplImage* b_image) {
  CvMoments moments;
  double m_00, m_10, m_01;
  
  cvSetImageCOI(image, 3);
  cvMoments(image, &moments, 0);
  cvSetImageCOI(image, 0);
  
  m_00 = cvGetSpatialMoment(&moments, 0, 0);
  m_10 = cvGetSpatialMoment(&moments, 1, 0);
  m_01 = cvGetSpatialMoment(&moments, 0, 1);

  //画像をgreyscaleに変換
  cvCvtColor(image, g_image, CV_BGR2GRAY);
  cvThreshold(g_image, b_image, 0, 255, CV_THRESH_BINARY);
  cvMoments(b_image, &moments, 1);
  area = (int)cvGetSpatialMoment(&moments, 0, 0); //実はこれが面積
  
  return cvPoint(m_10 / m_00, m_01 / m_00);
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
