#include <cv.h>
#include <highgui.h>

int
main (int argc, char **argv)
{
  IplImage *src_img, *dst_img1, *dst_img2, *dst_img3;
  IplImage *tmp_img;

  // (1)$B2hA|$NFI$_9~$_(B
  if (argc != 2 || (src_img = cvLoadImage (argv[1], CV_LOAD_IMAGE_GRAYSCALE)) == 0)
    return -1;

  tmp_img = cvCreateImage (cvGetSize (src_img), IPL_DEPTH_16S, 1);
  dst_img1 = cvCreateImage (cvGetSize (src_img), IPL_DEPTH_8U, 1);
  dst_img2 = cvCreateImage (cvGetSize (src_img), IPL_DEPTH_8U, 1);
  dst_img3 = cvCreateImage (cvGetSize (src_img), IPL_DEPTH_8U, 1);

  // (2)Sobel$B%U%#%k%?$K$h$kHyJ,2hA|$N:n@.(B
  cvSobel (src_img, tmp_img, 1, 0, 3);
  cvConvertScaleAbs (tmp_img, dst_img1, 1, 0);

  // (3)$B2hA|$N(BLaplacian$B$N:n@.(B
  cvLaplace (src_img, tmp_img, 3);
  cvConvertScaleAbs (tmp_img, dst_img2, 1, 0);

  // (4)Canny$B$K$h$k%(%C%82hA|$N:n@.(B
  cvCanny (src_img, dst_img3, 50.0, 200.0, 3);

  // (5)$B2hA|$NI=<((B
  cvNamedWindow ("Original", CV_WINDOW_AUTOSIZE);
  cvShowImage ("Original", src_img);
  cvNamedWindow ("Sobel", CV_WINDOW_AUTOSIZE);
  cvShowImage ("Sobel", dst_img1);
  cvNamedWindow ("Laplace", CV_WINDOW_AUTOSIZE);
  cvShowImage ("Laplace", dst_img2);
  cvNamedWindow ("Canny", CV_WINDOW_AUTOSIZE);
  cvShowImage ("Canny", dst_img3);
  cvWaitKey (0);

  cvDestroyWindow ("Original");
  cvDestroyWindow ("Sobel");
  cvDestroyWindow ("Laplace");
  cvDestroyWindow ("Canny");
  cvReleaseImage (&src_img);
  cvReleaseImage (&dst_img1);
  cvReleaseImage (&dst_img2);
  cvReleaseImage (&dst_img3);
  cvReleaseImage (&tmp_img);

  return 0;
}
