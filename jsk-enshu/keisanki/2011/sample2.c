#include <cv.h>
#include <highgui.h>

int
main (int argc, char **argv)
{
  IplImage *src_img = 0, *src_img_gray = 0, *tmp_img1 = 0;

  // (1)画像を読み込む
  if (argc >= 2)
    src_img = cvLoadImage (argv[1], CV_LOAD_IMAGE_COLOR);
  if (src_img == 0)
    return -1;

  tmp_img1 = cvCreateImage (cvGetSize (src_img), IPL_DEPTH_8U, 1);
  src_img_gray = cvCreateImage (cvGetSize (src_img), IPL_DEPTH_8U, 1);
  cvCvtColor (src_img, src_img_gray, CV_BGR2GRAY);

  // (2)二値化:cvThreshold
  cvThreshold (src_img_gray, tmp_img1, 90, 255, CV_THRESH_BINARY);

  // (3)画像を表示する
  cvNamedWindow ("Threshold", CV_WINDOW_AUTOSIZE);
  cvShowImage ("Threshold", tmp_img1);
  cvWaitKey (0);

  cvDestroyWindow ("Threshold");
  cvReleaseImage (&src_img);
  cvReleaseImage (&src_img_gray);
  cvReleaseImage (&tmp_img1);

  return 0;
}
