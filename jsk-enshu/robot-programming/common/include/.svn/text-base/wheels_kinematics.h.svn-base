/*
 * wheels_kinematics.h
 *
 * 2007/12/07 ikuo
 */

#ifndef __WHEELS_KINEMATICS_H__
#define __WHEELS_KINEMATICS_H__

#include <math.h>		/* sin, cos, M_PI */
#include <sys/time.h>

#define	deg2rad(deg)	(M_PI * (deg) / 180.0)
#define	rad2deg(rad)	(180.0 * (rad) / M_PI)

struct daisya_param {
  //位置、速度のparameter
  float x;             //短期的な目標位置
  float y;             //短期的な目標位置
  float theta;         //短期的な目標位置
  float xv;            //目標速度
  float yv;            //目標速度
  float thetav;        //目標速度
  // for sequencer
  int interpolation_type;
  float start_x;       //補間開始時の初期位置
  float start_y;       //補間開始時の初期位置
  float start_theta;   //補間開始時の初期位置
  float current_x;     //現在の実際のx
  float current_y;     //現在の実際のy
  float current_theta; //現在の実際のtheta
  float current_xv;    //現在の実際のxv
  float current_yv;    //現在の実際のyv
  float current_thetav;//現在の実際のthetav
  float goal_x;        //補間時の目標位置
  float goal_y;        //補間時の目標位置
  float goal_theta;    //補間時の目標位置
  float goal_time;     //目標補間時間
  long start_sec;      //スタート時の開始時刻
  long start_usec;
  //
  // gains
  float x_pgain;
  float y_pgain;
  float theta_pgain;
  //
  // control mode
  int controlmode;
};


extern struct wheel_param wheels[];
extern struct daisya_param daisya;
//台車速度制御関数
extern void set_car_velocity(float xv, float yv, float thetav/* , float theta */);

//台車位置制御関数
extern void car_pos_interpolation(float x, float y, float theta, float time);
extern void reset_car_params();
extern void set_car_gains();
extern void calc_current_daisyastate(struct timeval *prev_tv);
extern void calc_current_daisya_output();

//台車制御ループ関数
extern void start_daisya_control();
extern void stop_daisya_control();
extern int isrunning_daisya_control();

//補間まわり
extern void daisya_interpolate(struct timeval *ptv);
extern float interpolate_linear(float t);
extern float interpolate_minjerk(float t);
extern void daisya_HoffArbib(double t,  double target_t, double dt, 
                             double xi, double vi, double ai, double xf, double vf, double af,
                             double *x, double *v, double *a);

#endif
