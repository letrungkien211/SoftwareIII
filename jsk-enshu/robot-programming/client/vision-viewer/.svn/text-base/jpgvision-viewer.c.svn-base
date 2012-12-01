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

    /**** 処理結果(euslispのクライアントが受け取る情報)
          を取得して標準エラーに出力 ****/
    char result[8024];
    int n;
    write(client_sock, "result\n", 64);
    n = recv(client_sock, result, 8024, 0);
    result[n] =  '\0';
    fprintf(stderr, "result is %s", result);
    /**** 処理結果を取得(ここまで) ****/
    //if( (cvWaitKey(30) & 255) == 27 ) {
    //break;
    //}
  }

  return 0;
}
