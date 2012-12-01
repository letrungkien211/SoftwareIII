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

    // (1)���ޥ�ɰ����ˤ�äƻ��ꤵ�줿�ֹ�Υ������Ф��륭��ץ��㹽¤�Τ��������
    if (argc == 1 || (argc == 2 && strlen (argv[1]) == 1 && isdigit (argv[1][0])))
	capture = cvCreateCameraCapture (argc == 2 ? argv[1][0] - '0' : 0);

    /* ��������ϡ����Ѥ��륫���˰�¸���� */
    // (2)����ץ��㥵���������ꤹ�롥
    //cvSetCaptureProperty (capture, CV_CAP_PROP_FRAME_WIDTH, w);
    //cvSetCaptureProperty (capture, CV_CAP_PROP_FRAME_HEIGHT, h);

    cvNamedWindow ("Capture", CV_WINDOW_AUTOSIZE);

    // (3)����餫������򥭥�ץ��㤹��
    {
	IplImage *src_img_gray, *dst_img_gray;
	
	// (a) �������Ѥβ����ǡ��������
	frame = cvQueryFrame (capture);
	frame = cvQueryFrame (capture);
	frame = cvQueryFrame (capture);
	src_img_gray = cvCreateImage(cvGetSize(frame), IPL_DEPTH_8U, 1);
	dst_img_gray = cvCreateImage(cvGetSize(frame), IPL_DEPTH_8U, 1);

	while (1) {
	    frame = cvQueryFrame (capture);

	    // (b)���쥤���������
	    cvCvtColor(frame, src_img_gray, CV_BGR2GRAY);
	    
	    // (c)���Ͳ�����
	    cvThreshold(src_img_gray, dst_img_gray, 90, 255, CV_THRESH_BINARY | CV_THRESH_OTSU);

	    // (d)��̤�ɽ������
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
