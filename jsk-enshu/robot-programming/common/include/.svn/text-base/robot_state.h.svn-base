/*---------------------------------------------------
  robot_state.h:
  Robotの全SensorData
     使うときだけ確保が正攻法だけど面倒なので配列で定義してしまう
  --------------------------------------------------*/
#ifndef ROBOTSTATE_H_INCLUDED_
#define ROBOTSTATE_H_INCLUDED_

#include "servo.h"
#include "wheels.h"
#include "bumper.h"
#include "psd.h"

//一種類のsensorを格納する
struct robot_state {
  char state_name[64];  //stateの名前 ex) wheels-control-mode
  float* data_vec;      //格納するためのdata領域
  int vector_num;       //vectorの次数
  void (*collect_func)(float* data_ptr, int data_num);    //dataを収集するための関数
};

//robot_stateのlist
extern struct robot_state robot_state_list[];

//data格納のための構造体
struct RobotState {
  float wheels_control_mode[WHEELS_NUM];
  float wheels_goal_angle[WHEELS_NUM];
  float wheels_angle[WHEELS_NUM];
  float wheels_angle_error[WHEELS_NUM];
  float wheels_angle_error_integration[WHEELS_NUM];
  float wheels_angle_error_integration_limit[WHEELS_NUM];
  float wheels_angle_pgain[WHEELS_NUM];
  float wheels_angle_igain[WHEELS_NUM];
  float wheels_angle_dgain[WHEELS_NUM];
  float wheels_goal_velocity[WHEELS_NUM];
  float wheels_velocity[WHEELS_NUM];
  float wheels_velocity_error[WHEELS_NUM];
  float wheels_velocity_error_integration[WHEELS_NUM];
  float wheels_velocity_error_integration_limit[WHEELS_NUM];
  float wheels_velocity_pgain[WHEELS_NUM];
  float wheels_velocity_feedback_pgain[WHEELS_NUM];
  float wheels_velocity_igain[WHEELS_NUM];
  float wheels_velocity_dgain[WHEELS_NUM];
  float wheels_pwm[WHEELS_NUM];
  float wheels_encoder[WHEELS_NUM];
  float wheels_raw_enc[WHEELS_NUM];
  float wheels_dt[WHEELS_NUM];
  float wheels_sec[WHEELS_NUM];
  float wheels_usec[WHEELS_NUM];
  float wheels_raidus[WHEELS_NUM];
  //servo.hからとってきたもの
  float servos_pulse[SERVO_NUM];
  float servos_port[SERVO_NUM];
  float servos_angle[SERVO_NUM];
  float servos_neutral_angle[SERVO_NUM];
  float servos_max_angle[SERVO_NUM];
  float servos_min_angle[SERVO_NUM];
  float servos_pulse_offset[SERVO_NUM];
  float servos_pulse_per_angle[SERVO_NUM];
  float servos_interpolation_type[SERVO_NUM];
  float servos_start_angle[SERVO_NUM];
  float servos_goal_angle[SERVO_NUM];
  float servos_goal_time[SERVO_NUM];
  float servos_start_sec[SERVO_NUM];
  float servos_start_usec[SERVO_NUM];
  //sensors(bumper.h, psd.h)からとってきたもの
  float bumper_onoff[BUMPER_NUM];
  float psd_data[PSD_NUM];
} RobotStateData;

//data収集関数
//wheel由来
void set_wheels_control_mode(float* data_ptr, int data_num);
void set_wheels_goal_angle(float* data_ptr, int data_num);
void set_wheels_angle(float* data_ptr, int data_num);
void set_wheels_angle_error(float* data_ptr, int data_num);
void set_wheels_angle_error_integration(float* data_ptr, int data_num);
void set_wheels_angle_error_integration_limit(float* data_ptr, int data_num);
void set_wheels_angle_pgain(float* data_ptr, int data_num);
void set_wheels_angle_igain(float* data_ptr, int data_num);
void set_wheels_angle_dgain(float* data_ptr, int data_num);
void set_wheels_goal_velocity(float* data_ptr, int data_num);
void set_wheels_velocity(float* data_ptr, int data_num);
void set_wheels_velocity_error(float* data_ptr, int data_num);
void set_wheels_velocity_error_integration(float* data_ptr, int data_num);
void set_wheels_velocity_error_integration_limit(float* data_ptr, int data_num);
void set_wheels_velocity_pgain(float* data_ptr, int data_num);
void set_wheels_velocity_feedback_pgain(float* data_ptr, int data_num);
void set_wheels_velocity_igain(float* data_ptr, int data_num);
void set_wheels_velocity_dgain(float* data_ptr, int data_num);
void set_wheels_pwm(float* data_ptr, int data_num);
void set_wheels_encoder(float* data_ptr, int data_num);
void set_wheels_raw_enc(float* data_ptr, int data_num);
void set_wheels_dt(float* data_ptr, int data_num);
void set_wheels_sec(float* data_ptr, int data_num);
void set_wheels_usec(float* data_ptr, int data_num);
void set_wheels_raidus(float* data_ptr, int data_num);
//servo(arm)由来
void set_servos_pulse(float* data_ptr, int data_num);
void set_servos_port(float* data_ptr, int data_num);
void set_servos_angle(float* data_ptr, int data_num);
void set_servos_neutral_angle(float* data_ptr, int data_num);
void set_servos_max_angle(float* data_ptr, int data_num);
void set_servos_min_angle(float* data_ptr, int data_num);
void set_servos_pulse_offset(float* data_ptr, int data_num);
void set_servos_pulse_per_angle(float* data_ptr, int data_num);
void set_servos_interpolation_type(float* data_ptr, int data_num);
void set_servos_start_angle(float* data_ptr, int data_num);
void set_servos_goal_angle(float* data_ptr, int data_num);
void set_servos_goal_time(float* data_ptr, int data_num);
void set_servos_start_sec(float* data_ptr, int data_num);
void set_servos_start_usec(float* data_ptr, int data_num);
//sensors由来
void set_bumper_onoff(float* data_ptr, int data_num);
void set_psd_data(float* data_ptr, int data_num);
//
void CollectDataToRobotStateList();
int sPrintRobotStateList(char* buf);
int sPrintRobotState(char* buf, char* sensor_name, int sensor_num, float* data);

#endif //ROBOTSTATE_H_INCLUDED_
