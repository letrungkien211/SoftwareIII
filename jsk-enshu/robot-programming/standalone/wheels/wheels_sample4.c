/*
 * wheels_sample3.c  をベースに対話的に台車の位置制御を行うようにしたもの
 *
 * 2010/11/17 nakanish hogeo
 */

#include <pthread.h>   /* pthread_create, etc. */
#include <stdio.h>
#include <stdlib.h>    /* exit */
#include <unistd.h>    /* usleep */
#include <sys/select.h>
#include <math.h>		/* sin, cos */
#include "pc104ctrl_mt.h"
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
  float xpos=0, ypos=0, thetaval=0, time=100;
  volatile int flag=1;

  printf("usage:\n");
  printf("	q 0 0 0 0: quit\n");
  printf("	p xpos[mm] ypos[mm] theta[deg] time[msec]: set all positions\n");
  printf("	v xvel[mm/s] yvel[mm/s] thetavel[deg/s] 0: set all vels\n");
  //set_car_gains();
  while (flag) {
    printf("> ");
    scanf("%c %f %f %f %f", &command, &xpos, &ypos, &thetaval, &time);
    switch (command) {
    case 'q': case 'Q': flag=0; break;
    case 'p': case 'P':
      printf("\nxpos=%f[mm], ypos=%f[mm], theta=%f[deg], time=%f[msec]\n", xpos, ypos, thetaval, time);
      daisya.controlmode = ANGLE_CONTROL;
      printf(" %f\n", (float)daisya.controlmode);
      car_pos_interpolation(xpos, ypos, deg2rad(thetaval), time);
      break;
    case 'v': case 'V':
      printf("\nxvel=%f[mm/s], yvel=%f[mm/s], thetavel=%f[deg/s]\n", xpos, ypos, thetaval);
      daisya.controlmode = VELOCITY_CONTROL;
      printf(" %f\n", (float)daisya.controlmode);
      set_car_velocity(xpos, ypos, deg2rad(thetaval));
      break;
    default:
      printf("q: quit\n");
      printf("p: xpos[mm] ypos[mm] theta[deg] time[msec]: set all positions\n");
      printf("v: xvel[mm/s] yvel[mm/s] thetavel[deg/s] 0: set all vels\n");
      break;
    }
  }
  wheels_power_off_mt(g_fd);
}

int main(int argc, char *argv[]) {
  pthread_t wc_thread;
  int ch;
  g_fd = pc104_open_mt();
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
    wheels[ch].goal_angle = 0.0;
    wheels[ch].goal_velocity = 0.0;
  }
  set_wheels_gains(wheels);
  running_flag = TRUE;
  // start control loop
  if (pthread_create( &wc_thread, NULL, wheels_control, NULL)) {
    perror("pthread_create");
    exit(1);
  }

  //これで台車位置制御用threadが自動で立ち上がる
  start_daisya_control();
  interactive_move();

  //終了処理
  running_flag = FALSE;
  pthread_join( wc_thread, NULL );
  wheels_power_off_mt(g_fd);
  pc104_close_mt(g_fd);
  return 0;
}

void *wheels_control(void *arg) {
  while(running_flag) {
    get_wheels_state(g_fd, wheels);
    calc_wheels_output(wheels);
    set_wheels_output(g_fd, wheels);
    switch (wheels[0].control_mode) {
    case PWM_CONTROL: interval=INTERVAL_MS*1000; break;
    case VELOCITY_CONTROL: interval=INTERVALVEL_MS*1000; break;
    case ANGLE_CONTROL: interval=INTERVALPOS_MS*1000; break;
    default: interval=INTERVAL_MS*1000; break;
    }
    usleep(interval);
  }
  return NULL;
}
