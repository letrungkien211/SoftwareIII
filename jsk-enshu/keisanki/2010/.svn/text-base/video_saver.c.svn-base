//-----------------------------------------------------------------------------------
// vide_server.c
//-----------------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <cv.h>
#include <highgui.h>
#ifndef CV_FOURCC_DEFAULT
#define CV_FOURCC_DEFAULT CV_FOURCC('I', 'Y', 'U', 'V')
#endif


char* output_filename="output.avi";

//-----------------------------------------------------------------------------------
// main
//-----------------------------------------------------------------------------------
int
main(int argc, char *argv[])
{
  CvCapture *capture = 0;
  CvVideoWriter *writer = 0;
  IplImage *frame;
  int i;

  if (argc == 1
      || (argc == 2 && strlen(argv[1]) == 1 && isdigit(argv[1][0])))
    capture = cvCreateCameraCapture(argc == 2 ? argv[1][0] - '0' : 0);

  int width = (int)cvGetCaptureProperty(capture,CV_CAP_PROP_FRAME_WIDTH);
  int height = (int)cvGetCaptureProperty(capture,CV_CAP_PROP_FRAME_HEIGHT);

  writer = cvCreateVideoWriter(output_filename, CV_FOURCC_DEFAULT, 30,
                               cvSize(width,height), 1);

  fprintf(stderr, "type ESC on the screen to stop\n");

  cvNamedWindow("Capture", CV_WINDOW_AUTOSIZE);

  while (1) {
    frame = cvQueryFrame (capture);

    cvWriteFrame(writer,frame);

    cvShowImage("Capture", frame);

    unsigned char key = cvWaitKey(10);

    if ( key==0x1b ) break;
  }

  fprintf(stderr, "Writing to %s... done\n", output_filename);
  cvReleaseVideoWriter(&writer);
  cvReleaseCapture(&capture);
  cvDestroyWindow("Capture");
}

