/*
 * servo_thread.c
 *
 * 2006/12/01 nishino
 */
#include <stdio.h>     /* perror */
#include <sys/ioctl.h> /* ioctl */
#include <sys/time.h>  /* gettimeofday */
#include <unistd.h>    /* usleep */
#include <pthread.h>  /* pthread */

#include "servo_mt.h"
#include "pc104ctrl_mt.h"

#define	FALSE       (0)
#define	TRUE        (!(FALSE))
#define SERVO_INTERVAL_MS 10
static void *servo_control(void *arg);
static pthread_t servo_control_thread;
static int servo_control_running_flag = FALSE;

/* start servo control thread */
void start_servo_control(struct servo_param servos[]) {
  if (! servo_control_running_flag) {
    servo_control_running_flag = TRUE;
    if (pthread_create( &servo_control_thread, NULL, servo_control, servos)) {
      perror("pthread_create");
    }
  }
}

/* stop servo control thread */
void stop_servo_control() {
  servo_control_running_flag = FALSE;
  pthread_join( servo_control_thread, NULL );
}

/* is running */
int isrunning_servo_control() {
  return servo_control_running_flag;
}

/* servo control loop */
static void *servo_control(void *arg) {
  int ch;
  struct servo_param *servos = arg;
  struct timeval tv;
  while(servo_control_running_flag) {
    /* execute interpolation */
    gettimeofday(&tv, NULL);
    for(ch = 0; ch < SERVO_NUM; ch++) {
      servo_interpolate(&servos[ch], &tv);
    }
    /* output */
    set_servo_output_mt(servos);
    usleep(SERVO_INTERVAL_MS * 1000);
  }
  return NULL;
}

/* output(ioctrl) thread safe*/
void set_servo_output_mt(struct servo_param servos[]) {
  int ch;
  servoctl svctl;

  for (ch = 0; ch < SERVO_NUM; ch ++) {
    if(servos[ch].poweronflag == 1){
      if (servos[ch].pulse >= 0x100) servos[ch].pulse = 0xff;
      else if (servos[ch].pulse < 0) servos[ch].pulse = 0;
      svctl.devno = servos[ch].port;
      svctl.pwm = servos[ch].pulse;

      pc104_ioctl_mt(PC104_WRITE_SERVO, &svctl);
    }else{
      svctl.devno = servos[ch].port;
      svctl.pwm = 0;
      pc104_ioctl_mt(PC104_WRITE_SERVO, &svctl);
    }
  }
}

/* power off thread safe */
void servo_power_off_mt(struct servo_param servos[]) {
  int ch;
  servoctl svctl;

  for (ch = 0; ch < SERVO_NUM; ch ++) {
    svctl.devno = servos[ch].port;
    svctl.pwm = 0;
    pc104_ioctl_mt(PC104_WRITE_SERVO, &svctl);
  }
}
