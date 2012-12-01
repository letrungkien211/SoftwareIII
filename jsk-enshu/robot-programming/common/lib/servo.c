/*
 * servo.c
 *
 * 2006/11/25 nishino
 * 2006/11/26 nishino
 * 2006/11/27 nishino
 * 2007/11/30 maki
 * 2007/12/07 ikuo
 */
#include <stdio.h>     /* perror */
#include <sys/ioctl.h> /* ioctl */
#include <sys/time.h>
#include <unistd.h>    /* usleep */

#include "pc104ctrl.h"
#include "servo.h"

/* set servo angle */
void set_servo_angle(struct servo_param *servo, float angle)
{
  if (angle > servo->max_angle) angle = servo->max_angle;
  else if (angle < servo->min_angle) angle = servo->min_angle;
  servo->angle = angle;
  servo->pulse = servo->pulse_offset + servo->angle * servo->pulse_per_angle;
}
/* set servo pulse */
void set_servo_pulse(struct servo_param *servo, int pulse) {
  if (pulse < 0) pulse = 0;
  else if (pulse > 255) pulse = 255;
  servo->pulse = pulse;
  if (servo->pulse_per_angle != 0.0) {
    servo->angle = (servo->pulse - servo->pulse_offset) / servo->pulse_per_angle;
  }
}
/* reset all servos*/
void reset_all_servos(struct servo_param servos[]) {
  int ch;
  current_interpolation_type = INTERPOLATE_MINJERK;
  for (ch = 0; ch < SERVO_NUM; ch++) {
    servos[ch].poweronflag = 1;
    servos[ch].interpolation_type = INTERPOLATE_FINISH;
    set_servo_angle(&servos[ch], servos[ch].neutral_angle);
  }
}
/* save servo parameters */
int save_servo_parameters(char *filename, struct servo_param servos[]) {
  FILE *fp;
  int ch;
  if ((fp = fopen(filename, "w")) == NULL) {
    fprintf(stderr, "failed to open: %s\n", filename);
    return 0;
  }
  fprintf(fp, "survo_num=%d\n", SERVO_NUM);
  for (ch = 0; ch < SERVO_NUM; ch++) {
    fprintf(fp, "max=%f min=%f neutral=%f pulse_offset=%d pulse_per_angle=%f port=%d\n",
	    servos[ch].max_angle, servos[ch].min_angle, servos[ch].neutral_angle,
	    servos[ch].pulse_offset, servos[ch].pulse_per_angle, servos[ch].port);
  }
  fclose(fp);
  return 1;
}
/* load servo parameters */
int load_servo_parameters(char *filename, struct servo_param servos[]) {
  FILE *fp;
  int ch, dummy, portcheck;
  if ((fp = fopen(filename, "r")) == NULL) {
    fprintf(stderr, "failed to open: %s\n", filename);
    return 0;
  }
  fscanf(fp, "survo_num=%d\n", &dummy);
  for (ch = 0; ch < SERVO_NUM; ch++) {
    fscanf(fp, "max=%f min=%f neutral=%f pulse_offset=%d pulse_per_angle=%f port=%d\n",
	   &servos[ch].max_angle, &servos[ch].min_angle, &servos[ch].neutral_angle,
	   &servos[ch].pulse_offset, &servos[ch].pulse_per_angle, &servos[ch].port);
  }
  portcheck=0;
  for (ch = 0; ch < SERVO_NUM; ch++) if (servos[ch].port!=0) portcheck=1;
  for (ch = 0; ch < SERVO_NUM; ch++) {
      set_servo_pulse(&servos[ch], servos[ch].pulse);
      if (portcheck==0) servos[ch].port=ch;
  }
  fclose(fp);
  return 1;
}
/* start interpolation all axes */
void start_servo_interpolation_all(struct servo_param servos[], 
				   float goal_angles[], float msec, int type) {
  int ch;
  struct timeval tv;
  gettimeofday(&tv, NULL);
  for (ch = 0; ch < SERVO_NUM; ch++) {
    start_servo_interpolation(&servos[ch], goal_angles[ch], msec, type, &tv);
  }
}
/* start interpolation specified axis */
void start_servo_interpolation(struct servo_param *servo,
			       float goal_angle, float msec, int type, struct timeval *ptv) {
  struct timeval tv;
  if (ptv == NULL) {
    gettimeofday(&tv, NULL);
    ptv = &tv;
  }
  servo->start_angle = servo->angle;
  servo->goal_angle = goal_angle;
  servo->goal_time = msec;
  servo->start_sec = ptv->tv_sec;
  servo->start_usec = ptv->tv_usec;
  servo->interpolation_type = type;
}
/* wait interpolation all axes */
void wait_servo_interpolation_all(struct servo_param servos[]) {
  int ch;
  for(ch = 0; ch < SERVO_NUM; ch++) wait_servo_interpolation(&servos[ch]);
}
/* wait interpolation specific axis(no timeout) */
void wait_servo_interpolation(struct servo_param *servo) {
  while(servo->interpolation_type != INTERPOLATE_FINISH) usleep(1000);
}
/* execute interpolation */
void servo_interpolate(struct servo_param *servo, struct timeval *ptv) {
  double t, pos;
  t = 
    ((ptv->tv_sec - servo->start_sec) * 1000.0+ (ptv->tv_usec - servo->start_usec) / 1000.0) /
    servo->goal_time;
  switch(servo->interpolation_type) {
  case INTERPOLATE_LINEAR:  
    pos = servo_interpolate_linear(t); 
    break;
  case INTERPOLATE_MINJERK: 
    pos = servo_interpolate_minjerk(t); 
    break;
  default:                  
    return;
  }
  
  set_servo_angle(servo, servo->start_angle + (servo->goal_angle - servo->start_angle) * pos);
  
  if (t >= 1.0) {
    set_servo_angle(servo, servo->goal_angle);
    servo->interpolation_type = INTERPOLATE_FINISH;
  }
}
/* execute linear interpolation */
float servo_interpolate_linear(float t) {
  return t;
}

void HoffArbib(double t,  double target_t, double dt, 
	       double xi, double vi, double ai, double xf, double vf, double af,
	       double *x, double *v, double *a)
{
  double a0,a1,a2,a3,a4,a5;
  double A,B,C;
  double remain_t=target_t-t;

  if(remain_t > dt){
    A=(xf-(xi+vi*target_t+(ai/2.0)*target_t*target_t))/(target_t*target_t*target_t);
    B=(vf-(vi+ai*target_t))/(target_t*target_t);
    C=(af-ai)/target_t;
    
    a0=xi;
    a1=vi;
    a2=ai/2.0;
    a3=10*A-4*B+0.5*C;
    a4=(-15*A+7*B-C)/target_t;
    a5=(6*A-3*B+0.5*C)/(target_t*target_t);

    *x=a0+a1*t+a2*t*t+a3*t*t*t+a4*t*t*t*t+a5*t*t*t*t*t;
    *v=a1+2*a2*t+3*a3*t*t+4*a4*t*t*t+5*a5*t*t*t*t;
    *a=2*a2+6*a3*t+12*a4*t*t+20*a5*t*t*t;
  } else {
    *x=xf;
    *v=vf;
    *a=af;
  }
}

/* execute min jerk interpolation */
float servo_interpolate_minjerk(float t) {
  double pos;
  double dt=0.02;//20ms
  double v,a;

  HoffArbib(t,1.0, dt, 0, 0, 0, 1, 0, 0, &pos, &v, &a);

  return (float)pos;
}

/* output(ioctrl) */
void set_servo_output(int fd, struct servo_param servos[]) {
  int ch;
  servoctl svctl;

  for (ch = 0; ch < SERVO_NUM; ch ++) {
    if (servos[ch].pulse >= 0x100) servos[ch].pulse = 0xff;
    else if (servos[ch].pulse < 0) servos[ch].pulse = 0;
    svctl.devno = servos[ch].port;
    svctl.pwm = servos[ch].pulse;
    if (ioctl(fd, PC104_WRITE_SERVO, &svctl) < 0) {
      perror("PC104_WRITE_SERVO");
    }
  }
}
/* power off */
void servo_power_off(int fd, struct servo_param servos[]) {
  int ch;
  servoctl svctl;

  for (ch = 0; ch < SERVO_NUM; ch ++) {
    svctl.devno = servos[ch].port;
    svctl.pwm = 0;
    if (ioctl(fd, PC104_WRITE_SERVO, &svctl) < 0) {
      perror("PC104_WRITE_SERVO");
    }
  } 
}

/* set servo port */
void set_servo_port(struct servo_param *servo, int port)
{
  if (port < 0 || port >= MAX_SERVO_NUM) {
    fprintf(stderr, "port (%d) should be between %d and %d.\n",
	    port, 0, MAX_SERVO_NUM);
    return;
  }
  servo->port = port;
}
