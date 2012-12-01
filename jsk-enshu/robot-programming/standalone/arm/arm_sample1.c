/*
 * arm_sample1.c
 *
 * 2006/11/25 nishino
 * 2006/11/26 nishino
 * 2006/11/27 nishino
 */
#include <pthread.h>   /* pthread_create, etc. */
#include <stdio.h>
#include <stdlib.h>    /* exit */
#include <unistd.h>    /* usleep */

#include "../pc104driver/pc104ctrl_mt.h"
#include "servo_mt.h"

#define	FALSE       (0)
#define	TRUE        (!(FALSE))

struct servo_param servos[SERVO_NUM];

int main(int argc, char *argv[]) {
  int i,j;
  int jn=0;
  struct timeval tv;

  if (argc!=2) {
    printf("usage: arm_sample1 joint-no\n");
    return -1;
  }
  sscanf(argv[1], "%d", &jn);

  float a[4] = {0, 10, 20, 30};

  /* intialize */
  if (!load_servo_parameters("servoparam", servos)) {
    exit(1);
  }

  for(i=0; i<4; i++){
    servos[i].poweronflag = 1;
  }

  pc104_open_mt();
  servo_power_off_mt(servos);
  reset_all_servos(servos);
  // start control loop
  getchar();
  start_servo_control(servos);
  // demo */
  for(i = 0; i < 2; i++) {
    for(j = 0; j < 4; j++) {
      gettimeofday(&tv, NULL);
      start_servo_interpolation(&servos[jn], a[j], 1000, INTERPOLATE_LINEAR, &tv);
      //start_servo_interpolation(&servos[jn], a[j], 1000, INTERPOLATE_MINJERK, &tv);
      wait_servo_interpolation(&servos[jn]);
    }
  }
  for(i=0; i<4; i++){
    servos[i].poweronflag = 0;
  }
  stop_servo_control();
  printf("control thread all joined.\n");
  servo_power_off_mt(servos);
  pc104_close_mt();
  return 0;
}
