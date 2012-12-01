/*
 * servo.h
 *
 * 2006/11/24 nishino
 * 2007/12/07 ikuo
 */

#ifndef __SERVO_H__
#define __SERVO_H__

#include <sys/time.h>  // gettimeofday

#define SERVO_NUM 5
#define MAX_SERVO_NUM 12

struct servo_param {
  int pulse;
  int port;
  float angle;
  float neutral_angle;
  float max_angle;
  float min_angle;
  int pulse_offset;
  float pulse_per_angle;
  // for sequencer
  int interpolation_type;
  float start_angle;
  float goal_angle;
  float goal_time;
  long start_sec;
  long start_usec;
  //
  int poweronflag;
};

enum interpolate_type {
  INTERPOLATE_FINISH = 0,
  INTERPOLATE_LINEAR,
  INTERPOLATE_MINJERK
};

extern struct servo_param servos[];
int current_interpolation_type;

void set_servo_angle(struct servo_param *servo, float angle);
void set_servo_pulse(struct servo_param *servo, int pulse);
void reset_all_servos(struct servo_param servos[]);
int save_servo_parameters(char *filename, struct servo_param servos[]);
int load_servo_parameters(char *filename, struct servo_param servos[]);
void set_servo_output(int fd, struct servo_param servos[]);
void servo_power_off(int fd, struct servo_param servos[]);
void start_servo_interpolation_all(struct servo_param servos[], 
				   float goal_angles[], float msec, int type);
void wait_servo_interpolation_all(struct servo_param servos[]);
void start_servo_interpolation(struct servo_param *servo,
			 float goal_angle, float msec, int type, struct timeval *ptv);
void wait_servo_interpolation(struct servo_param *servo);
void servo_interpolate(struct servo_param *servo, struct timeval *tv);
float servo_interpolate_linear(float t);
float servo_interpolate_minjerk(float t);

void set_servo_port(struct servo_param *servo, int port);

#endif
