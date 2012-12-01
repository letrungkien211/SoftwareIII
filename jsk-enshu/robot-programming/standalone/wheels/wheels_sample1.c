/*
 * wheels_sample1.c
 *
 * 2006/11/24 nishino
 * 2007/11/28 maki
 * 2007/12/01 murama2
 * 2007/12/06 ikuo
 */

#include <stdio.h>
#include <unistd.h>    /* usleep */
#include <sys/select.h>
#include "pc104ctrl.h"
#include "wheels.h"

#define INTERVAL_MS 10
#define INTERVALPOS_MS 5
#define INTERVALVEL_MS 50

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
  struct wheel_param wheels[WHEELS_NUM];
  int fd;
  int mode, ch;
  float value_0, value_1, value_2;
  int counter = 0;
  unsigned long interval=INTERVAL_MS*1000;

  if (argc<=1) {
    printf("usage: wheels_sample1 mode value_0 value_1 value_2\n");
    return 0;
  }
  sscanf(argv[1], "%d", &mode);
  if (mode != -1 && argc < 4) {
    printf("usage: wheels_sample1 mode value_0 value_1 value_2\n");
    return 0;
  }
  if(argc > 3) {
    sscanf(argv[2], "%f", &value_0);
    sscanf(argv[3], "%f", &value_1);
    sscanf(argv[4], "%f", &value_2);
  }
  fd = pc104_open();
  /* set mode & goal */
  if (mode == 0) {
    wheels[WHEEL_0].control_mode
      = wheels[WHEEL_1].control_mode
      = wheels[WHEEL_2].control_mode
      = PWM_CONTROL;
    wheels[WHEEL_0].pwm = (int)value_0;
    wheels[WHEEL_1].pwm = (int)value_1;
    wheels[WHEEL_2].pwm = (int)value_2;
  }
  else if (mode == 1) {
    wheels[WHEEL_0].control_mode
      = wheels[WHEEL_1].control_mode
      = wheels[WHEEL_2].control_mode
      = ANGLE_CONTROL;
    wheels[WHEEL_0].goal_angle = value_0;
    wheels[WHEEL_1].goal_angle = value_1;
    wheels[WHEEL_2].goal_angle = value_2;
    interval = INTERVALPOS_MS * 1000;
  }
  else if (mode == 2) {
    wheels[WHEEL_0].control_mode
      = wheels[WHEEL_1].control_mode
      = wheels[WHEEL_2].control_mode
      = VELOCITY_CONTROL;
    wheels[WHEEL_0].goal_velocity = value_0;
    wheels[WHEEL_1].goal_velocity = value_1;
    wheels[WHEEL_2].goal_velocity = value_2;
    interval = INTERVALVEL_MS * 1000;
  }
  else if (mode == -1) {
    wheels[WHEEL_0].control_mode
      = wheels[WHEEL_1].control_mode
      = wheels[WHEEL_2].control_mode
      = PWM_CONTROL;
    wheels[WHEEL_0].pwm = 0;
    wheels[WHEEL_1].pwm = 0;
    wheels[WHEEL_2].pwm = 0;
  }
  else {
    pc104_close(fd);
    return 0;
  }
  /* intialize */
  set_wheels_gains(wheels);
  get_wheels_state(fd, wheels);   /* いっかいget_stateしておく */
  for(ch = 0; ch < WHEELS_NUM; ch++) {
    wheels[ch].encoder = 0;
    wheels[ch].angle_error_integration = 0.0;
    wheels[ch].velocity_error_integration = 0.0;
  }

  unsigned int led = 0x01;
  while(1) {
    if ((counter % 10) == 0) {
      if (led == 0x01) {
	led = 0x00;
      } else {
	led = 0x01;
      }
      counter = 0;
    }

    get_wheels_state(fd, wheels);
    calc_wheels_output(wheels);
    set_wheels_output(fd, wheels);

    fprintf(stderr, "a0 = %f, a1=%f, a2=%f \n",
	    wheels[WHEEL_0].angle, wheels[WHEEL_1].angle, wheels[WHEEL_2].angle);
    fprintf(stderr, "v0 = %f, v1=%f, v2=%g \n",
	    wheels[WHEEL_0].velocity, wheels[WHEEL_1].velocity, wheels[WHEEL_2].velocity);
    if(keycheck()) break;
    usleep(interval);
    counter++;
  }
  for (ch=0; ch<WHEELS_NUM; ch++) wheels[ch].pwm=0;
  set_wheels_output(fd, wheels);
  pc104_close(fd);
  return 0;
}
