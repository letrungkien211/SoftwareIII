/*
 * arm_sample4.c
 *
 * 2007/12/09 yoshikai
 */

#include <pthread.h>   /* pthread_create, etc. */
#include <stdio.h>
#include <stdlib.h>    /* exit */
#include <unistd.h>    /* usleep */
#include "psd.h"

#include "pc104ctrl_mt.h"
#include "servo_mt.h"

#define	FALSE       (0)
#define	TRUE        (!(FALSE))

#define PSDTHRES    400
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

int main(int argc, char *argv[]) {
  int i;
  float init_pos[5] = { 90, -29, -61, 0, 0};
  float pos0_0[5] = { 0, -29, -61, 0, 0};
  float pos0_1[5] = { -40, -29, -61, 0, 0};
  float pos1[5] = { 90, -10, -40, 0, 30};
  float pos2_0[5] = { -40, -29, -61, 0, 0};
  float pos2_1[5] = { 90, -10, -40, 0, 30};

  /* intialize */
  if (!load_servo_parameters("servoparam", servos)) {
    exit(1);
  }
  pc104_open_mt();
  servo_power_off_mt(servos);
  reset_all_servos(servos);
  for(i=0; i<4; i++){
    servos[i].poweronflag = 1;
  }

  // start control loop
  start_servo_control(servos);
  // demo */
  start_servo_interpolation_all(servos, init_pos, 1000, INTERPOLATE_MINJERK);
  wait_servo_interpolation(servos);
  printf("Push any key!\n");
  getchar();
  while(1){
    read_psd_mt();
    print_psd();

    if(psds[0].data > PSDTHRES) {
      for(i=0;i<2;i++){
	start_servo_interpolation_all(servos, pos0_0, 1000, INTERPOLATE_MINJERK);
	wait_servo_interpolation(servos);
	start_servo_interpolation_all(servos, pos0_1, 1000, INTERPOLATE_MINJERK);
	wait_servo_interpolation(servos);}
      //to initial position
      start_servo_interpolation_all(servos, init_pos, 1000, INTERPOLATE_MINJERK);
      wait_servo_interpolation(servos);
    } else if(psds[1].data > PSDTHRES) {
      for(i=0;i<2;i++){
	start_servo_interpolation_all(servos, pos1, 1000, INTERPOLATE_MINJERK);
	wait_servo_interpolation(servos);
	start_servo_interpolation_all(servos, init_pos, 1000, INTERPOLATE_MINJERK);
      	wait_servo_interpolation(servos);}
      //to initial position
      start_servo_interpolation_all(servos, init_pos, 1000, INTERPOLATE_MINJERK);
      wait_servo_interpolation(servos);
    } else if(psds[2].data > PSDTHRES) {
      for(i=0;i<2;i++){
	start_servo_interpolation_all(servos, pos2_0, 1000, INTERPOLATE_MINJERK);
	wait_servo_interpolation(servos);
	start_servo_interpolation_all(servos, pos2_1, 1000, INTERPOLATE_MINJERK);
      	wait_servo_interpolation(servos);}
      //to initial position
      start_servo_interpolation_all(servos, init_pos, 1000, INTERPOLATE_MINJERK);
      wait_servo_interpolation(servos);
    }

    if(keycheck()) break;
    usleep(300000);// 300ms sleep
  }

  // stop arm & hand control thread first
  for(i=0; i<4; i++){
    servos[i].poweronflag = 0;
  }
  stop_servo_control();
  printf("control thread all joined.\n");
  servo_power_off_mt(servos);
  pc104_close_mt();
  return 0;
}
