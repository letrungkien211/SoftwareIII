/*---------------------------------------------------
  command.h:
  interpreterで解釈された命令の中身を記述しておく
   ここでrobotのdevice層とつながることになる
  --------------------------------------------------*/
#ifndef COMMAND_H_INCLUDED_
#define COMMAND_H_INCLUDED_

//命令関数(引数ポインタを与える形)で記述すること
int wheel_controlmode_vector(char *ptr);
int wheel_angle_vector(char *ptr);
int wheel_velocity_vector(char *ptr);
int wheel_pwm_vector(char *ptr);
int daisya_velocity_vector(char *ptr);
int wheel_reset(char *ptr);
//
int daisya_controlmode(char *ptr);
int set_daisya_position_vector(char *ptr);
int get_daisya_position_vector(char *ptr);
int set_daisya_position_pgain_vector(char *ptr);
int get_daisya_position_pgain_vector(char *ptr);
int daisya_reset(char *ptr);
//
int set_wheel_angle_pgain_vector(char *ptr);
int set_wheel_angle_dgain_vector(char *ptr);
int set_wheel_angle_igain_vector(char *ptr);
int get_wheel_angle_pgain_vector(char *ptr);
int get_wheel_angle_dgain_vector(char *ptr);
int get_wheel_angle_igain_vector(char *ptr);
int set_wheel_velocity_pgain_vector(char *ptr);
int set_wheel_velocity_dgain_vector(char *ptr);
int set_wheel_velocity_igain_vector(char *ptr);
int get_wheel_velocity_pgain_vector(char *ptr);
int get_wheel_velocity_dgain_vector(char *ptr);
int get_wheel_velocity_igain_vector(char *ptr);
//
int servo_poweron_vector(char *ptr);
int servo_interpolation_method(char *ptr);
int servo_angle_vector(char *ptr);
//
int get_robot_state(char *ptr);
int null_func(char *ptr);

//命令の保存形式 名前と関数ポインタ
struct robot_command {
  char *command_name;
  int (*func)(char*);
};

//命令リスト
extern struct robot_command robot_command_list[];

#endif //COMMAND_H_INCLUDED_
