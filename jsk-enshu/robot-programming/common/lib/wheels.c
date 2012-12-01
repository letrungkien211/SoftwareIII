/*
 * wheels.c
 *
 * 2006/11/25 nishino
 * 2007/11/28 maki
 * 2007/12/01 murama2
 * 2007/12/06 ikuo
 * 2008/12/01 ikuo
 */

#include "wheels.h"
#include <stdlib.h>

#define ENC_ERROR_THRESHOLD (1000)

void calc_wheels_output(struct wheel_param wheels[]) {
  struct wheel_param *wheel;
  int ch;
  float err, ferr, derr;
  for (ch = 0; ch < WHEELS_NUM; ch++ ) {
    //fprintf(stderr, "ch = %d\n", ch);
    wheel = &wheels[ch];
    switch(wheel->control_mode) {
      /* control angle */
    case ANGLE_CONTROL:
      err = wheel->goal_angle - wheel->angle;
      derr = (err - wheel->angle_error) / (wheel->dt + 0.000001);
      //derr = (err - wheel->angle_error) / wheel->dt;
      wheel->angle_error = err;
      wheel->angle_error_integration += err * wheel->dt;
      if (wheel->angle_error_integration > wheel->angle_error_integration_limit) {
	wheel->angle_error_integration =  wheel->angle_error_integration_limit;
      }
      else if (wheel->angle_error_integration < -wheel->angle_error_integration_limit) {
	wheel->angle_error_integration =  -wheel->angle_error_integration_limit;
      }
      wheel->pwm = (int)(err * wheel->angle_pgain +
		       derr * wheel->angle_dgain +
		       wheel->angle_error_integration * wheel->angle_igain);
//       fprintf(stderr, "Calc: ch = %d, err = %f, derr = %f, dt = %f\n",
// 	      ch, err, derr, wheel->dt);
      break;
      /* control velocity */
    case VELOCITY_CONTROL:
      err = wheel->goal_velocity - wheel->velocity;
      ferr = wheel->goal_velocity - wheel->velocity_feedback_pgain * wheel->velocity;
      derr = (err - wheel->velocity_error) / (wheel->dt + 0.000001);
      //derr = (err - wheel->velocity_error) / wheel->dt;
      wheel->velocity_error = err;
      wheel->velocity_error_integration += (wheel->goal_velocity - wheel->velocity) * wheel->dt;
      if (wheel->velocity_error_integration > wheel->velocity_error_integration_limit) {
	wheel->velocity_error_integration =  wheel->velocity_error_integration_limit;
      }
      else if (wheel->velocity_error_integration < -wheel->velocity_error_integration_limit) {
	wheel->velocity_error_integration =  -wheel->velocity_error_integration_limit;
      }
      wheel->pwm = (int)(ferr * wheel->velocity_pgain +
			 derr * wheel->velocity_dgain +
			 wheel->velocity_error_integration * wheel->velocity_igain);
//       fprintf(stderr, "Calc: ch = %d, err = %f, derr = %f, dt = %f\n",
// 	      ch, err, derr, wheel->dt);
      break;
      /* no control */
    case PWM_CONTROL:
      break;
    }
  }
}

void get_wheels_state(int fd, struct wheel_param wheels[]) {
  struct wheel_param *wheel;
  unsigned int enc;
  int enc_diff;
  int result,ch;
  float dt; /* sec */
  struct timeval tv;
  // calc dt
  gettimeofday(&tv, NULL);
  dt = (tv.tv_sec - wheels[0].sec) + (tv.tv_usec - wheels[0].usec) * 0.000001;
  wheels[0].sec = tv.tv_sec; wheels[0].usec = tv.tv_usec;
  for (ch = 0; ch < WHEELS_NUM; ch++ ) {
    //fprintf(stderr, "setup %d\n", ch);
    wheel = &wheels[ch];
    wheel->dt = dt;
    enc = ch;

    // get encoder
    result = ioctl(fd, PC104_READ_ENC, &enc);
    if (result < 0) {
      perror("PC104_READ_ENC");
    }

    enc_diff = (enc - wheel->raw_enc) & 0xffffff;
    if (enc_diff > 0x800000) enc_diff = 0xff000000 | enc_diff;
    if (abs(enc_diff)>ENC_ERROR_THRESHOLD) { enc_diff=0; }
    wheel->encoder += enc_diff;
    wheel->raw_enc = enc;

    // calc velcity (rad / sec)
    if (dt != 0.0) wheel->velocity = enc_diff * ANGLE_PER_PULSE / dt;
    else           wheel->velocity = 0;

    // calc angle (rad)
    wheel->angle = wheel->encoder * ANGLE_PER_PULSE;
    //fprintf(stderr, "Get: ch = %d, raw_enc = %d, enc_diff = %d, angle = %f, vel = %f, dt = %f\n",
    //ch, wheel->raw_enc, enc_diff, wheel->angle, wheel->velocity, wheel->dt);
  }
}

void get_wheels_state_mt(struct wheel_param wheels[]) {
  struct wheel_param *wheel;
  unsigned int enc;
  int enc_diff;
  int result,ch;
  float dt; /* sec */
  struct timeval tv;
  // calc dt
  gettimeofday(&tv, NULL);
  dt = (tv.tv_sec - wheels[0].sec) + (tv.tv_usec - wheels[0].usec) * 0.000001;
  wheels[0].sec = tv.tv_sec; wheels[0].usec = tv.tv_usec;
  for (ch = 0; ch < WHEELS_NUM; ch++ ) {
    //fprintf(stderr, "setup %d\n", ch);
    wheel = &wheels[ch];
    wheel->dt = dt;
    enc = ch;

    // get encoder
    result = pc104_ioctl_mt(PC104_READ_ENC, &enc);
    if (result < 0) {
      perror("PC104_READ_ENC");
    }

    enc_diff = (enc - wheel->raw_enc) & 0xffffff;
    if (enc_diff > 0x800000) enc_diff = 0xff000000 | enc_diff;
    wheel->encoder += enc_diff;
    wheel->raw_enc = enc;

    // calc velcity (rad / sec)
    if (dt != 0.0) wheel->velocity = enc_diff * ANGLE_PER_PULSE / dt;
    else           wheel->velocity = 0;

    // calc angle (rad)
    wheel->angle = wheel->encoder * ANGLE_PER_PULSE;
    //fprintf(stderr, "Get: ch = %d, raw_enc = %d, enc_diff = %d, angle = %f, vel = %f, dt = %f\n",
    //ch, wheel->raw_enc, enc_diff, wheel->angle, wheel->velocity, wheel->dt);
  }
}

void set_wheels_output(int fd, struct wheel_param wheels[]) {
  dcmctl dcm;
  int ch;
  for (ch = 0; ch < WHEELS_NUM; ch++ ) {
    dcm.devno = ch;
    dcm.brk = 1;

    if (wheels[ch].pwm >= 0) {
      dcm.cwccw = 1;
    } else {
      dcm.cwccw = 0;
      wheels[ch].pwm *= -1;
    }

    if (wheels[ch].pwm > 0xff) {
      wheels[ch].pwm = 0xff;
    }

    dcm.pwm = wheels[ch].pwm;

    //fprintf(stderr, "pwm2 = %d, %d\n", wheels[ch].pwm, ch);

    if (ioctl(fd, PC104_WRITE_DCMOTOR, &dcm) < 0) {
      perror("set_wheels_output");
    }    
    //fprintf(stderr, "Set: ch = %d, pwm = %d\n",
    //ch, dcm.pwm);
  }
}

void set_wheels_output_mt(struct wheel_param wheels[]) {
  dcmctl dcm;
  int ch;
  for (ch = 0; ch < WHEELS_NUM; ch++ ) {
    dcm.devno = ch;
    dcm.brk = 1;

    if (wheels[ch].pwm >= 0) {
      dcm.cwccw = 1;
    } else {
      dcm.cwccw = 0;
      wheels[ch].pwm *= -1;
    }

    if (wheels[ch].pwm > 0xff) {
      wheels[ch].pwm = 0xff;
    }

    dcm.pwm = wheels[ch].pwm;

    //fprintf(stderr, "pwm2 = %d, %d\n", wheels[ch].pwm, ch);

    if (pc104_ioctl_mt(PC104_WRITE_DCMOTOR, &dcm) < 0) {
      perror("set_wheels_output");
    }    
    //fprintf(stderr, "Set: ch = %d, pwm = %d\n",
    //ch, dcm.pwm);
  }
}

void wheels_power_off(int fd) {
  int ch;
  dcmctl dcm;
  for (ch = 0; ch < WHEELS_NUM; ch++ ) {
    dcm.devno = ch;
    dcm.cwccw = 0;
    dcm.brk = 1;
    dcm.pwm = 0;

    if (ioctl(fd, PC104_WRITE_DCMOTOR, &dcm) < 0) {
      perror("wheels_power_off");
    }    
  }
}

void wheels_power_off_mt() {
  int ch;
  dcmctl dcm;
  for (ch = 0; ch < WHEELS_NUM; ch++ ) {
    dcm.devno = ch;
    dcm.cwccw = 0;
    dcm.brk = 1;
    dcm.pwm = 0;

    if (pc104_ioctl_mt(PC104_WRITE_DCMOTOR, &dcm) < 0) {
      perror("wheels_power_off");
    }    
  }
}

/* set gains */
void set_wheels_gains(struct wheel_param wheels[]) {
  int ch;

  for (ch = 0; ch < WHEELS_NUM; ch++ ) {
    wheels[ch].angle_pgain = 5.0;
    wheels[ch].angle_dgain = 0.02;
    wheels[ch].angle_igain = 0.2;
    wheels[ch].angle_error_integration_limit = 1000.0;
    wheels[ch].velocity_pgain = 0.3;
    wheels[ch].velocity_feedback_pgain = 0.3;
    wheels[ch].velocity_dgain = 0.000005;
    wheels[ch].velocity_igain = 0.0055; //0.55;
    wheels[ch].velocity_error_integration_limit = 1000.0; //10000.0;
  }
}
