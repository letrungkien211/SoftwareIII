/*
 * servo_thread.h
 *
 * 2006/12/01 nishino
 */
#ifndef __SERVO_THREAD_H__
#define __SERVO_THREAD_H__

#include "servo.h"
#include "pc104ctrl_mt.h"

void start_servo_control(struct servo_param servos[]);
void stop_servo_control();
int isrunning_servo_control();
void set_servo_output_mt(struct servo_param servos[]);
void servo_power_off_mt(struct servo_param servos[]);

#endif
