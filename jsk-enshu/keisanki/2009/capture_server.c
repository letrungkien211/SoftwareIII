// http://opencv.jp/sample/video_io.html#capture
#include <stdio.h>
#include <ctype.h>

#include <cv.h>
#include <highgui.h>

#include "socketlib.h"

#define TRUE 1
#define FALSE 0

static pthread_mutex_t g_mutex;
static IplImage *g_frame = 0;
static int g_main_loop = TRUE;

//-----------------------------------------------------------------------------------
// thread_comm：クライアントごとの送受信スレッド
//-----------------------------------------------------------------------------------
void *
thread_comm (void *arg)
{
    /* pthread_create(&thread, NULL, comm, (void*)&ns); で作成したスレッド
       から、呼び出される */
    int s = *(int *) arg;
    int size;
    char buf[1024];

    pthread_detach (pthread_self ());

    pthread_mutex_lock (&g_mutex);
    {
	socket_list[client_num] = s;
	client_num++;
    }
    pthread_mutex_unlock (&g_mutex);

    while (1)
    {
	int i;

	socket_read (s, &size, sizeof (int));

	if (size > 0)
	{

	    pthread_mutex_lock (&g_mutex);
	    {
		/*担当するクライアントから受信する */
		socket_read (s, buf, size);

		fprintf (stdout, "Client:[%d] %s\n", s, buf);
		/*全てのクライアントに受信データ送信する */
		for (i = 0; i < client_num; i++)
		{
		    socket_write (socket_list[i], &size, sizeof (int));
		    socket_write (socket_list[i], buf, size);
		}
	    }
	    pthread_mutex_unlock (&g_mutex);
	}

    }

    return NULL;
}

//-----------------------------------------------------------------------------------
// thread_idle：アイドル時
//-----------------------------------------------------------------------------------
void *
thread_idle (void *arg)
{
    unsigned char *frame_data;
    CvSize frame_size;
    int frame_step, size;

    pthread_detach (pthread_self ());

    while (1)
    {
	int i;

	// すべての接続中のクライアントへバッファを送信
	//---------------------------------------------------
	pthread_mutex_lock (&g_mutex);
	{
	    for (i = 0; i < client_num; i++)
	    {
		size = g_frame->width * g_frame->height * 3;
		socket_write (socket_list[i], &size, sizeof (int));
		socket_write (socket_list[i], g_frame->imageData, size);
	    }
	}
	pthread_mutex_unlock (&g_mutex);

	usleep (1000000);

    }

    return NULL;
}

//-----------------------------------------------------------------------------------
// thread_capture：アイドル時
//-----------------------------------------------------------------------------------
void *
thread_capture (void *arg)
{
    CvCapture *capture = 0;
    double w = 320, h = 240;
    int c, count = 0, count_size = 10;
    int64 tick = cvGetTickCount();

    // (1)コマンド引数によって指定された番号のカメラに対するキャプチャ構造体を作成する
    capture = cvCreateCameraCapture (0);

    /* この設定は，利用するカメラに依存する */
    // (2)キャプチャサイズを設定する．
    cvSetCaptureProperty (capture, CV_CAP_PROP_FRAME_WIDTH, w);
    cvSetCaptureProperty (capture, CV_CAP_PROP_FRAME_HEIGHT, h);

    cvNamedWindow ("Capture", CV_WINDOW_AUTOSIZE);

    // (3)カメラから画像をキャプチャする
    while (1) {
	pthread_mutex_lock (&g_mutex);
	g_frame = cvQueryFrame (capture);
	pthread_mutex_unlock (&g_mutex);
	cvShowImage ("Capture", g_frame);

	c = cvWaitKey (10);
	if (c == '\x1b')
	    break;

	if ( count % count_size == 0 ) {
	    float fps = (double)(count_size)/
		(((cvGetTickCount() - tick)/cvGetTickFrequency())/(1000.0*1000.0));
	    tick = cvGetTickCount();
	    fprintf(stderr, "capture image %7.3f fps %d\n", fps);
	}
	count++;
    }

    cvReleaseCapture (&capture);
    cvDestroyWindow ("Capture");

    g_main_loop = FALSE;
    return 0;
}

//-----------------------------------------------------------------------------------
// main
//-----------------------------------------------------------------------------------
int
main ()
{
    int s, ns;
    pthread_t thread1, thread2, thread3;

    s = socket_listen(1024);

    // thread_idle（アイドル時）用のスレッドを作成
    pthread_create (&thread1, NULL, thread_idle, NULL);

    // thread_capture（Capture時）用のスレッドを作成
    pthread_create (&thread2, NULL, thread_capture, NULL);

    // クライアントからの接続あれば、スレッドを生成する
    //---------------------------------------------------
    while (g_main_loop)
    {
	fd_set fds;
	struct timeval tv;

	/* ns を監視し、入力があった場合にacceptする */
	FD_ZERO(&fds);
	FD_SET(s, &fds);

	/* 1 秒間を監視する */
	tv.tv_sec = 1;
	tv.tv_usec = 0;

	if ( select(s+1, &fds, NULL, NULL, &tv) > 0 ) {
	    if ((ns = accept (s, NULL, 0)) < 0)
	    {
		perror ("server: accept");
		continue;
	    }
	    
	    printf ("Connected : %d\n", ns);
	    //comm用のスレッドを生成する
	    pthread_create (&thread3, NULL, thread_comm, (void *) &ns);
	}
    }

    pthread_detach(thread1);
    pthread_join(thread2, NULL);

}

