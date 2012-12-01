#include "visionlib.h"
extern IplImage *raw_image;

/***********************************************************/
/********************** face detect ************************/
/***********************************************************/

static CvMemStorage* storage = 0;
static CvHaarClassifierCascade* cascade = 0;

const char* cascade_name = "haarcascade_frontalface_alt.xml";
/*    "haarcascade_profileface.xml";*/

int init_facedetect(){
  storage = cvCreateMemStorage(0);
  cascade = (CvHaarClassifierCascade*)cvLoad( cascade_name, 0, 0, 0 );
  cvNamedWindow("FaceDetect", 0);         //元画像の表示画面
}
  

int detect_and_draw(void){
  static CvScalar colors[] = {
    {{0,0,255}},
    {{0,128,255}},
    {{0,255,255}},
    {{0,255,0}},
    {{255,128,0}},
    {{255,255,0}},
    {{255,0,0}},
    {{255,0,255}}
  };

  double scale = 1.3;
  IplImage* gray = cvCreateImage( cvSize(raw_image->width,raw_image->height), 8, 1 );
  IplImage* small_img = cvCreateImage( cvSize( cvRound (raw_image->width/scale),
                                               cvRound (raw_image->height/scale)),
                                       8, 1 );
  int i;

  cvCvtColor( raw_image, gray, CV_BGR2GRAY );
  cvResize( gray, small_img, CV_INTER_LINEAR );
  cvEqualizeHist( small_img, small_img );
  cvClearMemStorage( storage );
  int xx = -1;
  if( cascade ){
    double t = (double)cvGetTickCount();
#if (CV_MAJOR_VERSION >= 2) && (CV_MINOR_VERSION >= 2)
    CvSeq* faces = cvHaarDetectObjects( small_img, cascade, storage,
                                        1.1, 2, 0/*CV_HAAR_DO_CANNY_PRUNING*/,
					cvSize(30, 30), cvSize(60, 60) );
#else
    CvSeq* faces = cvHaarDetectObjects( small_img, cascade, storage,
                                        1.1, 2, 0/*CV_HAAR_DO_CANNY_PRUNING*/,
                                            cvSize(30, 30) );
#endif
    t = (double)cvGetTickCount() - t;
    printf( "detection time = %gms\n", t/((double)cvGetTickFrequency()*1000.) );
    for( i = 0; i < (faces ? faces->total : 0); i++ ){
      CvRect* r = (CvRect*)cvGetSeqElem( faces, i );
      CvPoint center;
      int radius;
      center.x = cvRound((r->x + r->width*0.5)*scale);
      xx = cvRound((r->x + r->width*0.5)*scale);
      center.y = cvRound((r->y + r->height*0.5)*scale);
      radius = cvRound((r->width + r->height)*0.25*scale);
      cvCircle( raw_image, center, radius, colors[i%8], 3, 8, 0 );
    }
  }

  cvReleaseImage( &gray );
  cvReleaseImage( &small_img );
  cvShowImage( "FaceDetect", raw_image );

  return xx;
}

