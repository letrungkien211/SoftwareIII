/* 
 * capture_test.c
 *
 * 2006-09-28 tmori 
 * 2006-09-18 tmori 
 * 2006-08-12 tmori 
 * 2006-08-08 tmori 
 * 
 */
#include <stdio.h>
#include <ctype.h> /* for isdigit */
#include "cv.h"
#include "highgui.h"


/* main */
int main( int argc, char** argv ) {
  CvCapture* capture;
  IplImage* frame;

  if( argc == 1 
      || (argc == 2 && strlen(argv[1]) == 1 && isdigit(argv[1][0]))) {
    capture = cvCreateCameraCapture( argc == 2 ? argv[1][0] - '0' : 1 );
  }
  else if( argc == 2 ) {
    capture = cvCreateFileCapture( argv[1] ); 
  }
  if( !capture ) {
    fprintf( stderr, "ERROR: capture is NULL \n" );
    return(-1);
  }

  // Create a window in which the captured images will be presented
  cvNamedWindow( "Camera", 0 );
  /* cvNamedWindow( "Camera", CV_WINDOW_AUTOSIZE ); */

  // Show the image captured from the camera in the window and repeat
  while( 1 ) {
    // Get one frame
    frame = cvQueryFrame( capture );
    if( !frame ) {
      fprintf( stderr, "ERROR: frame is null...\n" );
      break;
    }

    cvShowImage( "Camera", frame ); // Do not release the frame!

    //If ESC key pressed, Key=0x10001B under OpenCV (linux version),
    //remove higher bits using AND operator
    if( (cvWaitKey(10) & 255) == 27 ) {
      break;
    }
  }

  cvReleaseCapture( &capture );
  cvDestroyWindow( "Camera" );

  return( 0 );
}

