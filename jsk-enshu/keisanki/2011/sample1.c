#include <stdio.h>
#include <cv.h>
#include <highgui.h>

int main (int argc, char **argv)
{
  IplImage *src_img = 0;


  // (1)$B%U%!%$%k$+$i2hA|%a%b%j$KFI$_9~$`(B
  if (argc >= 2)
    src_img = cvLoadImage (argv[1], CV_LOAD_IMAGE_COLOR);
  if (src_img == 0)
    return -1;

  // (2)$B%&%#%s%I%&$rI=<($9$k(B
  cvNamedWindow("Image",  CV_WINDOW_AUTOSIZE);

  // (4)$B2hA|$rI=<($9$k(B
  cvShowImage ("Image", src_img);

  // (5)$B%-!<F~NO$rBT$D(B
  cvWaitKey (0);

  // (6)$B%&%#%s%I%&$r>C5n$9$k(B
  cvDestroyWindow ("Image");

  // (7)$B2hA|%a%b%j$r3+J|$9$k(B
  cvReleaseImage (&src_img);

  return 0;
}
