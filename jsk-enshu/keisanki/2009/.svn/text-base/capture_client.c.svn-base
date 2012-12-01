//-----------------------------------------------------------------------------------
// client.cpp
//-----------------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <cv.h>
#include <highgui.h>

#include "socketlib.h"

#define TRUE 1
#define FALSE 0

static pthread_mutex_t g_mutex;
static int g_main_loop = TRUE;

#define WIDTH 320
#define HEIGHT 240

//-----------------------------------------------------------------------------------
// recv_sock
//-----------------------------------------------------------------------------------
void*
thread_recv(void *arg)
{
    int socket = *(int *) arg;
    int ret, size;
    char buf[WIDTH*HEIGHT*3];
    IplImage* image;
    int count = 0, count_size = 10;
    int64 tick = cvGetTickCount();
  
    cvNamedWindow ("Image", CV_WINDOW_AUTOSIZE);
    cvResizeWindow ("Image", WIDTH, HEIGHT);

    image = cvCreateImage( cvSize(WIDTH, HEIGHT), IPL_DEPTH_8U, 3);

    while(1){

	if ( socket_read(socket, &size, sizeof(int)) <= 0 ) 
	    break;

	// ダミーではないとき
	if( size > 0 ) {
      
	    socket_read(socket, buf, size );
	    memcpy(image->imageData, buf, size);
	    cvShowImage ("Image", image);
	    cvWaitKey(10);

	    if ( count % count_size == 0 ) {
		float fps = (double)(count_size)/
		    (((cvGetTickCount() - tick)/cvGetTickFrequency())/(1000.0*1000.0));
		tick = cvGetTickCount();
		fprintf(stderr, "capture image %7.3f fps %d\n", fps);
	    }
	    count++;
	}

    }

    cvDestroyWindow ("Image");

    g_main_loop = FALSE; 
    return NULL; 
}

// main
//-----------------------------------------------------------------------------------
int main(int argc, char *argv[])
{
    int s, size;
    pthread_t thread;
    char buf[256];

    if(argc == 1){
	printf("usage: client <server IP address>\n");
	exit(1);
    }
  
    s = socket_connect( argv[1], 1024 );
  
    pthread_mutex_init( &g_mutex, NULL );
    pthread_create( &thread, NULL, thread_recv, (void *) &s);
  
    // メインループ
    //---------------------------------------------------
    while ( g_main_loop ) {
	fgets(buf, 256, stdin);
	size = strlen(buf);
	fprintf(stderr, "sending[%d] %s", size, buf);
	socket_write(s, &size, sizeof(int));
	socket_write(s, buf, size);
    }

    pthread_join( thread, NULL);

    exit (0);
}

