/**
 * bumper_sample.c
 *
 * 2007/12/07 maki
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
#include "bumper.h"


#define INTERVAL_MS 100
#define INTERVALVEL_MS 50
#define	FALSE       (0)
#define	TRUE        (!(FALSE))

int fd;
struct wheel_param wheels[WHEELS_NUM];
int running_flag;
unsigned long interval=INTERVALVEL_MS*1000;
struct daisya_param daisya;

void bumper_action();
void *wheels_control(void *arg);

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
  int ch;
  pthread_t wc_thread;
  unsigned long interval=INTERVAL_MS*1000;

  fd = pc104_open();
  get_wheels_state(fd, wheels);   /* いっかいget_stateしておく */

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

  if (pthread_create( &wc_thread, NULL, wheels_control, NULL)) {
    perror("pthread_create");
    exit(1);
  }

  while(1) {
    get_wheels_state(fd, wheels);

    read_bumper(fd);
    print_bumper();
    bumper_action();

    if(keycheck()) break;
    usleep(interval);
  }

  running_flag = FALSE;
  pthread_join( wc_thread, NULL );
  wheels_power_off(fd);
  pc104_close(fd);
  return 0;
}

void bumper_action() {
  int i;
  int pressed[BUMPER_NUM];
  for (i = 0; i < BUMPER_NUM; i++) {
    pressed[bumpers[i].id] = is_pressed(bumpers[i].data);
  }
  
  if (pressed[BUMPER_REAR_R]) {
    set_car_velocity(-400, -100, deg2rad(-120));
    sleep(1);
  } else if (pressed[BUMPER_REAR_L]) {
    set_car_velocity(-400, 100, deg2rad(120));
    sleep(1);
  } else if (pressed[BUMPER_LEFT_R]) {
    set_car_velocity(400, -100, deg2rad(-120));
    sleep(1);
  } else if (pressed[BUMPER_RIGHT_L]) {
    set_car_velocity(400, 100, deg2rad(120));
    sleep(1);
  } else if (pressed[BUMPER_RIGHT_R]) {
    set_car_velocity(0, -400, 0);
    sleep(1);
  } else if (pressed[BUMPER_LEFT_L]) {
    set_car_velocity(0, 400, 0);
    sleep(1);
  } else {
    set_car_velocity(-200, 0, 0);
  }
}

void *wheels_control(void *arg) {
  while(running_flag) {
    get_wheels_state(fd, wheels);
    calc_wheels_output(wheels);
    set_wheels_output(fd, wheels);
    usleep(interval);
  }
  return NULL;
}
