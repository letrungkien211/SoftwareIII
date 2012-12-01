/*
 * arm_test.c
 *
 * 2006/11/25 nishino
 * 2006/11/26 nishino
 * 2006/11/27 nishino
 */
#include <pthread.h>   /* pthread_create, etc. */
#include <stdio.h>
#include <stdlib.h>    /* exit */
#include <unistd.h>    /* usleep */

#include "pc104ctrl_mt.h"
#include "servo_mt.h"

#define	FALSE       (0)
#define	TRUE        (!(FALSE))
#define DEFAULT_ANGLE 10   //[deg]
#define DEFAULT_TIME  1000 //[msec]

struct servo_param servos[SERVO_NUM];

int keycheck(void) {
  fd_set fds;
  struct timeval tv;
  int ret;

  FD_ZERO(&fds);
  FD_SET(0,&fds);
  tv.tv_sec=0; tv.tv_usec=0;

  ret=select(1, &fds, NULL, NULL, &tv);
  return ret;
}

/*
  arm_test 0
  のようにして動かしてみる
  DEFAULT_ANGLE
  に
  DEFAULT_TIME
  で移動するはず．
  
  他のサーボは動かないようにしたいので，
  servoparamの中に poweronflagを追加して
  それが1でないときは動かないようにした.
  reset_all_servosで1に戻るようにはしてある．
  
  ######  重要  #################
  servoparamというファイルを元にパラメタをロードしている
  で，これは個性があり，
  ロボットによっては本来動けない場所に行こうとする可能性がありうる
  すぐに電源が切れるようにして実験を行うこと

  後，なるべくアームがほかの場所に当たって動かなくなる（内力がたまる）
  ことがないようにしておくこと
  ######  重要（終わり) #########

*/
int main(int argc, char *argv[]) {
  int i;
  int jn=0;
  struct timeval tv;
  float a[8] = {0, 10, 20, 30, 20, 10, 0};

  if (argc!=2) {
    printf("usage: arm_test joint-no\n");
    return -1;
  }
  sscanf(argv[1], "%d", &jn);

  /* intialize */
  if (!load_servo_parameters("servoparam", servos)) {
    exit(1);
  }
  pc104_open_mt();
  servo_power_off_mt(servos);
  reset_all_servos(servos);
  //
  //動かす軸だけフラグをたてる
  for(i=0; i<SERVO_NUM; i++){
    servos[i].poweronflag = 0;
  }
  servos[jn].poweronflag = 1;
  
  // start control loop
  printf("Please enter, then start\n");
  getchar();
  start_servo_control(servos);
  // demo */
  for(i=0; i<8; i++){
    gettimeofday(&tv, NULL);
    start_servo_interpolation(&servos[jn], a[i], DEFAULT_TIME, INTERPOLATE_LINEAR, &tv);
    wait_servo_interpolation(&servos[jn]);
    if(keycheck()) break;
  }
  stop_servo_control();
  printf("control thread all joined.\n");
  servo_power_off_mt(servos);
  pc104_close_mt();
  return 0;
}
