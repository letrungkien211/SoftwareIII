/*
 * wheels_sample3.c
 *
 * 2007/12/06 ikuo
 */

#include <pthread.h>   /* pthread_create, etc. */
#include <stdio.h>
#include <stdlib.h>    /* exit */
#include <unistd.h>    /* usleep */
#include <sys/select.h>
#include <math.h>		/* sin, cos */
#include "pc104ctrl.h"
#include "wheels.h"
#include "wheels_kinematics.h"

#define INTERVAL_MS 10
#define INTERVALPOS_MS 5
#define INTERVALVEL_MS 50

#define	FALSE       (0)
#define	TRUE        (!(FALSE))

int g_fd;
struct wheel_param wheels[WHEELS_NUM];
int running_flag;
unsigned long interval=INTERVALVEL_MS*1000;
struct daisya_param daisya;

void *wheels_control(void *arg);

// keyが押されてたらTRUEを返す関数
int keycheck(void) {
  fd_set fds; struct timeval tv;
  int ret;

  FD_ZERO(&fds); FD_SET(STDIN_FILENO,&fds); /* 標準入力をfdsにセット */
  tv.tv_sec=0; tv.tv_usec=0;

  ret=select(1, &fds, NULL, NULL, &tv);	/* fdsにデータが来ているfdがあるかをチェック */
  return ret;
}

void interactive_move(void) {
  char command;
  float xvel=0, yvel=0, thetavel=0;
  volatile int flag=1;

  printf("usage:\n");
  printf("	q 0 0 0: quit\n");
  printf("	m xvel yvel thetavel: set all vels\n");
  while (flag) {
    set_car_velocity(xvel, yvel, thetavel);
    printf("> ");
    scanf("%c %f %f %f", &command, &xvel, &yvel, &thetavel);
    switch (command) {
    case 'q': case 'Q': flag=0; break;
    case 'm': case 'M':
      printf("\nxvel=%f, yvel=%f, thetavel=%f[deg/s]\n", xvel, yvel, thetavel);
      thetavel = deg2rad(thetavel);
      break;
    default:
      printf("q: quit\n");
      printf("m xvel yvel thetavel: set all vels\n");
      break;
    }
  }
  wheels_power_off(g_fd);
}

int main(int argc, char *argv[]) {
  pthread_t wc_thread;
  int ch;
  g_fd = pc104_open();
  /* intialize */
  get_wheels_state(g_fd, wheels);   /* いっかいget_stateしておく */
  for(ch = 0; ch < WHEELS_NUM; ch++) {
    wheels[ch].control_mode = VELOCITY_CONTROL;
    wheels[ch].pwm = 0;
    wheels[ch].encoder = 0;
    wheels[ch].angle_error_integration = 0.0;
    wheels[ch].velocity_error_integration = 0.0;
    wheels[ch].angle = 0.0;
    wheels[ch].velocity = 0.0;
  }
  set_wheels_gains(wheels);

  running_flag = TRUE;
  // start control loop
  if (pthread_create( &wc_thread, NULL, wheels_control, NULL)) {
    perror("pthread_create");
    exit(1);
  }
  interactive_move();

  running_flag = FALSE;
  pthread_join( wc_thread, NULL );
  wheels_power_off(g_fd);
  pc104_close(g_fd);
  return 0;
}

void *wheels_control(void *arg) {
  while(running_flag) {
    get_wheels_state(g_fd, wheels);
    calc_wheels_output(wheels);
    set_wheels_output(g_fd, wheels);
    usleep(interval);
  }
  return NULL;
}
