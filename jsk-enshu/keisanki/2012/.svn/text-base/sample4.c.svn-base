#include <cv.h>
#include <highgui.h>

int
main (int argc, char **argv)
{
  int i;
  IplImage *src_img = 0, *src_gray = 0;
  const char *cascade_name = "/usr/share/opencv/haarcascades/haarcascade_frontalface_default.xml";
  const char *cascade_name_local = "/usr/share/OpenCV-2.3.1/haarcascades/haarcascade_frontalface_default.xml";
  CvHaarClassifierCascade *cascade = 0;
  CvMemStorage *storage = 0;
  CvSeq *faces;
  static CvScalar colors[] = {
    {{0, 0, 255}}, {{0, 128, 255}},
    {{0, 255, 255}}, {{0, 255, 0}},
    {{255, 128, 0}}, {{255, 255, 0}},
    {{255, 0, 0}}, {{255, 0, 255}}
  };

  // (1)画像を読み込む
  if (argc < 2 || (src_img = cvLoadImage (argv[1], CV_LOAD_IMAGE_COLOR)) == 0)
    return -1;
  src_gray = cvCreateImage (cvGetSize (src_img), IPL_DEPTH_8U, 1);

  // (2)ブーストされた分類器のカスケードを読み込む
  cascade = (CvHaarClassifierCascade *) cvLoad (cascade_name, 0, 0, 0);
  if ( cascade == 0 ) {
    cascade = (CvHaarClassifierCascade *) cvLoad (cascade_name_local, 0, 0, 0);
  }

  // (3)メモリを確保し，読み込んだ画像のグレースケール化，ヒストグラムの均一化を行う
  storage = cvCreateMemStorage (0);
  cvClearMemStorage (storage);
  cvCvtColor (src_img, src_gray, CV_BGR2GRAY);
  cvEqualizeHist (src_gray, src_gray);

  // (4)物体（顔）検出
#if CV_MAJOR_VERSION <= 2 && CV_MINOR_VERSION <= 1 
  faces = cvHaarDetectObjects (src_gray, cascade, storage, 1.11, 4, 0, cvSize (40, 40));
#else
  faces = cvHaarDetectObjects (src_gray, cascade, storage, 1.11, 4, 0, cvSize (40, 40), cvSize (0, 0));
#endif

  // (5)検出された全ての顔位置に，円を描画する
  for (i = 0; i < (faces ? faces->total : 0); i++) {
    CvRect *r = (CvRect *) cvGetSeqElem (faces, i);
    CvPoint center;
    int radius;
    center.x = cvRound (r->x + r->width * 0.5);
    center.y = cvRound (r->y + r->height * 0.5);
    radius = cvRound ((r->width + r->height) * 0.25);
    cvCircle (src_img, center, radius, colors[i % 8], 3, 8, 0);
  }

  // (6)画像を表示，キーが押されたときに終了
  cvNamedWindow ("Face Detection", CV_WINDOW_AUTOSIZE);
  cvShowImage ("Face Detection", src_img);
  cvWaitKey (0);

  cvDestroyWindow ("Face Detection");
  cvReleaseImage (&src_img);
  cvReleaseImage (&src_gray);
  cvReleaseMemStorage (&storage);

  return 0;
}
