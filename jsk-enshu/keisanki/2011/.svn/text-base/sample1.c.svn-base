#include <stdio.h>
#include <cv.h>
#include <highgui.h>

int main (int argc, char **argv)
{
  IplImage *src_img = 0;


  // (1)ファイルから画像メモリに読み込む
  if (argc >= 2)
    src_img = cvLoadImage (argv[1], CV_LOAD_IMAGE_COLOR);
  if (src_img == 0)
    return -1;

  // (2)ウィンドウを表示する
  cvNamedWindow("Image",  CV_WINDOW_AUTOSIZE);

  // (4)画像を表示する
  cvShowImage ("Image", src_img);

  // (5)キー入力を待つ
  cvWaitKey (0);

  // (6)ウィンドウを消去する
  cvDestroyWindow ("Image");

  // (7)画像メモリを開放する
  cvReleaseImage (&src_img);

  return 0;
}
