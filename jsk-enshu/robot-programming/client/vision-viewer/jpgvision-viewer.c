#include "visionlib.h"

int main (int argc, char **argv){
  char *host = HOSTIP;
  int port = DEFAULTPORT;

  if (argc >= 2) { host = argv[1]; }
  if (argc >= 3) { port = atoi(argv[2]); }

  init_vision(host, port);
  //init_facedetect();

  while(1){
    //proc_vision();
    proc_jpg_vision();
    //detect_and_draw();

    /**** $B=hM}7k2L(B(euslisp$B$N%/%i%$%"%s%H$,<u$1<h$k>pJs(B)
          $B$r<hF@$7$FI8=`%(%i!<$K=PNO(B ****/
    char result[8024];
    int n;
    write(client_sock, "result\n", 64);
    n = recv(client_sock, result, 8024, 0);
    result[n] =  '\0';
    fprintf(stderr, "result is %s", result);
    /**** $B=hM}7k2L$r<hF@(B($B$3$3$^$G(B) ****/
    //if( (cvWaitKey(30) & 255) == 27 ) {
    //break;
    //}
  }

  return 0;
}
