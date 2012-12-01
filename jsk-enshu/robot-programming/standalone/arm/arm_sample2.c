/*
 * arm_sample2.c
 *
 * 2006/11/25 nishino
 * 2006/11/26 nishino
 * 2006/11/27 nishino
 * 2007/12/4 yoshikai
 */
#include <pthread.h>   /* pthread_create, etc. */
#include <stdio.h>
#include <stdlib.h>    /* exit */
#include <unistd.h>    /* usleep */

#include "pc104ctrl_mt.h"
#include "servo_mt.h"

#define	FALSE       (0)
#define	TRUE        (!(FALSE))

struct servo_param servos[SERVO_NUM];
int arm_controller_running_flag;

void *hand_control(void *arg);
void *arm_control(void *arg);
void move_arm(float a1, float a2, float a3, float a4, float time, int type);

int main(int argc, char *argv[]) {
  int i,j;
  pthread_t armc_thrd, handc_thrd;
  float a[4][5] = {{ 0, 0, -92, 21, 70},
		   { 50, 90, -65, 60, 0},
		   { 0, 180, -92, 21, -70},
		   { 50, 90, -65, 60, 0}};
  /* intialize */
  if (!load_servo_parameters("servoparam", servos)) {
    exit(1);
  }
  pc104_open_mt();
  servo_power_off_mt(servos);
  reset_all_servos(servos);
  // start control loop
  for(i=0; i<4; i++){
    servos[i].poweronflag = 1;
  }
  getchar();
  start_servo_control(servos);
  // demo */
  for(i = 0; i < 2; i++) {
    for(j = 0; j < 4; j++) {
      //start_servo_interpolation_all(servos, a[j], 1000, INTERPOLATE_LINEAR);
      start_servo_interpolation_all(servos, a[j], 1000, INTERPOLATE_MINJERK);
      wait_servo_interpolation(servos);
    }
  }
  // demo2
  arm_controller_running_flag = TRUE;
  if (pthread_create( &armc_thrd, NULL, arm_control, NULL)) {
    perror("pthread_create");
    exit(1);
  }
  if (pthread_create( &handc_thrd, NULL, hand_control, NULL)) {
    perror("pthread_create");
    exit(1);
  }
  // demo2 wait
  getchar();

  // stop arm & hand control thread first
  arm_controller_running_flag = FALSE;
  pthread_join( armc_thrd, NULL );
  pthread_join( handc_thrd, NULL );
  //
  for(i=0; i<4; i++){
    servos[i].poweronflag = 0;
  }
  stop_servo_control();
  printf("control thread all joined.\n");
  servo_power_off_mt(servos);
  pc104_close_mt();
  return 0;
}

void *hand_control(void *arg) {
  while(arm_controller_running_flag) {
    start_servo_interpolation(&servos[0], 50, 220, INTERPOLATE_LINEAR, NULL);
    wait_servo_interpolation(&servos[0]);
    start_servo_interpolation(&servos[0], 0, 220, INTERPOLATE_LINEAR, NULL);
    wait_servo_interpolation(&servos[0]);
  }
  return NULL;
}

void *arm_control(void *arg) {
  while(arm_controller_running_flag) {
/*     move_arm( 0, -92, 21, 70,1000,INTERPOLATE_LINEAR); */
/*     move_arm(90, -65, 60,  0,1000,INTERPOLATE_LINEAR); */
/*     move_arm(180,-92,-21,-70,1000,INTERPOLATE_LINEAR); */
/*     move_arm( 90,-65, 60, 0,1000,INTERPOLATE_LINEAR); */
    move_arm( 0, -92, 21, 70,1000,INTERPOLATE_MINJERK);
    move_arm(90, -65, 60,  0,1000,INTERPOLATE_MINJERK);
    move_arm(180,-92,-21,-70,1000,INTERPOLATE_MINJERK);
    move_arm( 90,-65, 60, 0,1000,INTERPOLATE_MINJERK);
  }
  return NULL;
}

void move_arm(float a1, float a2, float a3, float a4, float time, int type) {
  struct timeval tv;
  gettimeofday(&tv, NULL);
/*   start_servo_interpolation(&servos[1], a1, time, INTERPOLATE_LINEAR, &tv); */
/*   start_servo_interpolation(&servos[2], a2, time, INTERPOLATE_LINEAR, &tv); */
/*   start_servo_interpolation(&servos[3], a3, time, INTERPOLATE_LINEAR, &tv); */
/*   start_servo_interpolation(&servos[4], a4, time, INTERPOLATE_LINEAR, &tv); */
  start_servo_interpolation(&servos[1], a1, time, INTERPOLATE_MINJERK, &tv);
  start_servo_interpolation(&servos[2], a2, time, INTERPOLATE_MINJERK, &tv);
  start_servo_interpolation(&servos[3], a3, time, INTERPOLATE_MINJERK, &tv);
  start_servo_interpolation(&servos[4], a4, time, INTERPOLATE_MINJERK, &tv);
  wait_servo_interpolation(&servos[1]);
}
