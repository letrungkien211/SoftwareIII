#include <cv.h>
#include <highgui.h>
#include <stdio.h>

/* グローバル変数 */
CvFont font;
IplImage *img = 0;

/* プロトタイプ宣言 */
void on_mouse (int event, int x, int y, int flags, void *param);

int
main (int argc, char *argv[])
{
  int c;

  // (1)画像領域を確保し，初期化する
  img = cvCreateImage (cvSize (640, 480), IPL_DEPTH_8U, 3);
  cvZero (img);
  cvInitFont (&font, CV_FONT_HERSHEY_DUPLEX, 0.4, 0.4, 0.0, 1, CV_AA);

  // (2)ウィンドウを作成し，マウスイベントに対するコールバック関数を登録する
  cvNamedWindow ("Image", CV_WINDOW_AUTOSIZE);
  cvSetMouseCallback ("Image", on_mouse, 0);
  cvShowImage ("Image", img);

  // (3)'Esc'キーが押された場合に終了する
  while (1) {
    c = cvWaitKey (0);
    if (c == '\x1b')
      return 1;
  }

  cvDestroyWindow ("Image");
  cvReleaseImage (&img);

  return 0;
}

/* コールバック関数 */
void
on_mouse (int event, int x, int y, int flags, void *param)
{
  char str[64];
  static int line = 0;
  const int max_line = 15, w = 15, h = 30;

  // (4)マウスイベントを取得
  switch (event) {
  case CV_EVENT_MOUSEMOVE:
    snprintf (str, 64, "(%d,%d) %s", x, y, "MOUSE_MOVE");
    break;
  case CV_EVENT_LBUTTONDOWN:
    snprintf (str, 64, "(%d,%d) %s", x, y, "LBUTTON_DOWN");
    break;
  case CV_EVENT_RBUTTONDOWN:
    snprintf (str, 64, "(%d,%d) %s", x, y, "RBUTTON_DOWN");
    break;
  case CV_EVENT_MBUTTONDOWN:
    snprintf (str, 64, "(%d,%d) %s", x, y, "MBUTTON_DOWN");
    break;
  case CV_EVENT_LBUTTONUP:
    snprintf (str, 64, "(%d,%d) %s", x, y, "LBUTTON_UP");
    break;
  case CV_EVENT_RBUTTONUP:
    snprintf (str, 64, "(%d,%d) %s", x, y, "RBUTTON_UP");
    break;
  case CV_EVENT_MBUTTONUP:
    snprintf (str, 64, "(%d,%d) %s", x, y, "MBUTTON_UP");
    break;
  case CV_EVENT_LBUTTONDBLCLK:
    snprintf (str, 64, "(%d,%d) %s", x, y, "LBUTTON_DOUBLE_CLICK");
    break;
  case CV_EVENT_RBUTTONDBLCLK:
    snprintf (str, 64, "(%d,%d) %s", x, y, "RBUTTON_DOUBLE_CLICK");
    break;
  case CV_EVENT_MBUTTONDBLCLK:
    snprintf (str, 64, "(%d,%d) %s", x, y, "MBUTTON_DOUBLE_CLICK");
    break;
  }

  // (5)マウスボタン，修飾キーを取得
  if (flags & CV_EVENT_FLAG_LBUTTON)
    strncat (str, " + LBUTTON", 64);
  if (flags & CV_EVENT_FLAG_RBUTTON)
    strncat (str, " + RBUTTON", 64);
  if (flags & CV_EVENT_FLAG_MBUTTON)
    strncat (str, " + MBUTTON", 64);
  if (flags & CV_EVENT_FLAG_CTRLKEY)
    strncat (str, " + CTRL", 64);
  if (flags & CV_EVENT_FLAG_SHIFTKEY)
    strncat (str, " + SHIFT", 64);
  if (flags & CV_EVENT_FLAG_ALTKEY)
    strncat (str, " + ALT", 64);

  // (6)マウス座標，イベント，修飾キーなどを画像に描画，表示
  if (line > max_line) {
    cvGetRectSubPix (img, img, cvPoint2D32f (320 - 0.5, 240 - 0.5 + h));
    cvPutText (img, str, cvPoint (w, 20 + h * max_line), &font, CV_RGB (0, 200, 100));
  }
  else {
    cvPutText (img, str, cvPoint (w, 20 + h * line), &font, CV_RGB (0, 200, 100));
  }
  line++;
  cvShowImage ("Image", img);
}
