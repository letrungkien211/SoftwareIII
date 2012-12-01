// http://opencv.jp/sample/video_io.html#capture
#include <cv.h>
#include <highgui.h>
#include <ctype.h>

int
main (int argc, char **argv)
{
    CvCapture *capture = 0;
    IplImage *frame = 0;
    double w = 320, h = 240;
    int c;

    // (1)コマンド引数によって指定された番号のカメラに対するキャプチャ構造体を作成する
    if (argc == 1 || (argc == 2 && strlen (argv[1]) == 1 && isdigit (argv[1][0])))
	capture = cvCreateCameraCapture (argc == 2 ? argv[1][0] - '0' : 0);

    /* この設定は，利用するカメラに依存する */
    // (2)キャプチャサイズを設定する．
    //cvSetCaptureProperty (capture, CV_CAP_PROP_FRAME_WIDTH, w);
    //cvSetCaptureProperty (capture, CV_CAP_PROP_FRAME_HEIGHT, h);

    cvNamedWindow ("Capture", CV_WINDOW_AUTOSIZE);

    // (3)カメラから画像をキャプチャする
    {
	IplImage *src_img_gray, *tmp_img_gray, *dst_img_gray;
	
	// (a) 画像処用の画像データを確保
	frame = cvQueryFrame (capture);
	frame = cvQueryFrame (capture);
	frame = cvQueryFrame (capture);
	tmp_img_gray = cvCreateImage(cvGetSize(frame), IPL_DEPTH_16S, 1);
	src_img_gray = cvCreateImage(cvGetSize(frame), IPL_DEPTH_8U, 1);
	dst_img_gray = cvCreateImage(cvGetSize(frame), IPL_DEPTH_8U, 1);

	while (1) {
	    frame = cvQueryFrame (capture);

	    // (b)グレイ画像を作成
	    cvCvtColor(frame, src_img_gray, CV_BGR2GRAY);
	    
	    // (c)Edge処理
	    if ( 0 ) {
		cvCanny (src_img_gray, dst_img_gray, 50.0, 200.0, 3);
	    }else{
		cvLaplace (src_img_gray, tmp_img_gray, 5);
		cvConvertScaleAbs(tmp_img_gray, dst_img_gray, 1, 0);
	    }

	    // (d)結果を表示する
	    cvShowImage ("Capture", dst_img_gray);

	    c = cvWaitKey (10);
	    if (c == '\x1b')
		break;
	}
    }
	
    cvReleaseCapture (&capture);
    cvDestroyWindow ("Capture");

    return 0;
}
