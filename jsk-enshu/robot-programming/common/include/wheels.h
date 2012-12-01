/*
 * wheels.h
 *
 * 2006/11/24 nishino
 */

#ifndef __WHEELS_H__
#define __WHEELS_H__

#include <math.h>
#include <stdio.h>
#include <sys/ioctl.h> // ioctl
#include <sys/time.h>  // gettimeofday
#include "pc104ctrl.h"
#include "pc104ctrl_mt.h"

#define ANGLE_PER_PULSE (360/100.0)

enum wheels_number {
  WHEEL_0 = 0,
  WHEEL_1 = 1, 
  WHEEL_2 = 2, 
  WHEELS_NUM
};

enum control_mode {
  PWM_CONTROL = 0,
  VELOCITY_CONTROL,
  ANGLE_CONTROL,
};
  
struct wheel_param {
  //
  int control_mode;
  //
  float goal_angle;
  float angle;
  float angle_error;
  float angle_error_integration;
  float angle_error_integration_limit;
  float angle_pgain;
  float angle_igain;
  float angle_dgain;
  //
  float goal_velocity;
  float velocity;
  float velocity_error;
  float velocity_error_integration;
  float velocity_error_integration_limit;
  float velocity_pgain;
  float velocity_feedback_pgain;
  float velocity_igain;
  float velocity_dgain;

  //
  int pwm;
  //
  int encoder;			/* 十分なビット幅を持ったエンコーダ値 */
  unsigned int raw_enc;		/* CPLDが保持している値(8bit) */
  //
  float dt; /* sec */
  long sec;
  long usec;
  //
  float wheel_raidus;
};

extern struct wheel_param wheels[];

void get_wheels_state(int fd, struct wheel_param wheels[]);
void get_wheels_state_mt(struct wheel_param wheels[]);
void calc_wheels_output(struct wheel_param wheels[]);
void set_wheels_output(int fd, struct wheel_param wheels[]);
void set_wheels_output_mt(struct wheel_param wheels[]);
void wheels_power_off(int fd);
void wheels_power_off_mt();
void set_wheels_gains(struct wheel_param wheels[]);

#endif
