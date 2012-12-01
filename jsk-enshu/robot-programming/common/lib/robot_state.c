#include "robot_state.h"
#include "robot.h"
#include <stdlib.h>

struct robot_state robot_state_list[] = {
  //wheels
  {"wheels-control-mode", RobotStateData.wheels_control_mode,WHEELS_NUM, &set_wheels_control_mode},
  {"wheels-goal-angle", RobotStateData.wheels_goal_angle,WHEELS_NUM, &set_wheels_goal_angle},
  {"wheels-angle", RobotStateData.wheels_angle,WHEELS_NUM, &set_wheels_angle},
  {"wheels-angle-error", RobotStateData.wheels_angle_error,WHEELS_NUM, &set_wheels_angle_error},
  //{"wheels-angle-pgain", RobotStateData.wheels_angle_pgain,WHEELS_NUM, &set_wheels_angle_pgain},
  //{"wheels-angle-igain", RobotStateData.wheels_angle_igain,WHEELS_NUM, &set_wheels_angle_igain},
  //{"wheels-angle-dgain", RobotStateData.wheels_angle_dgain,WHEELS_NUM, &set_wheels_angle_dgain},
  {"wheels-goal-velocity", RobotStateData.wheels_goal_velocity,WHEELS_NUM, &set_wheels_goal_velocity},
  {"wheels-velocity", RobotStateData.wheels_velocity,WHEELS_NUM, &set_wheels_velocity},
  {"wheels-velocity-error", RobotStateData.wheels_velocity_error,WHEELS_NUM, &set_wheels_velocity_error},
  //{"wheels-velocity-pgain", RobotStateData.wheels_velocity_pgain,WHEELS_NUM, &set_wheels_velocity_pgain},
  //{"wheels-velocity-igain", RobotStateData.wheels_velocity_igain,WHEELS_NUM, &set_wheels_velocity_igain},
  //{"wheels-velocity-dgain", RobotStateData.wheels_velocity_dgain,WHEELS_NUM, &set_wheels_velocity_dgain},
  //保留してる未実装のデータ
  //wheels_angle_error_integration
  //wheels_angle_error_integration_limit
  //wheels_velocity_error_integration
  //wheels_velocity_error_integration_limit
  //wheels_velocity_feedback_pgain
  //wheels_pwm
  //wheels_encoder
  //wheels_raw_enc
  //wheels_dt
  //wheels_sec
  //wheels_usec
  //wheels_raidus
  
  //servos
  {"servos-pulse", RobotStateData.servos_pulse,SERVO_NUM, &set_servos_pulse},
  //{"servos-port", RobotStateData.servos_port,SERVO_NUM, &set_servos_port},
  {"servos-angle", RobotStateData.servos_angle,SERVO_NUM, &set_servos_angle},
  //{"servos-neutral_angle", RobotStateData.servos_neutral_angle,SERVO_NUM, &set_servos_neutral_angle},
  //{"servos-max-angle", RobotStateData.servos_max_angle,SERVO_NUM, &set_servos_max_angle},
  //{"servos-min-angle", RobotStateData.servos_min_angle,SERVO_NUM, &set_servos_min_angle},
  //{"servos-pulse-offset", RobotStateData.servos_pulse_offset,SERVO_NUM, &set_servos_pulse_offset},
  //{"servos-pulse-per-angle", RobotStateData.servos_pulse_per_angle,SERVO_NUM, &set_servos_pulse_per_angle},
  {"servos-interpolation-type", RobotStateData.servos_interpolation_type,SERVO_NUM, &set_servos_interpolation_type},
  {"servos-start-angle", RobotStateData.servos_start_angle,SERVO_NUM, &set_servos_start_angle},
  {"servos-goal-angle", RobotStateData.servos_goal_angle,SERVO_NUM, &set_servos_goal_angle},
  {"servos-goal-time", RobotStateData.servos_goal_time,SERVO_NUM, &set_servos_goal_time},
  //start_sec
  //start_usec
  //sensors
  {"bumper-onoff", RobotStateData.bumper_onoff,BUMPER_NUM, &set_bumper_onoff},
  {"psd-data", RobotStateData.psd_data, PSD_NUM, &set_psd_data},
};

//各データの収集関数の定義 必要なものは適宜追加してください
void set_wheels_control_mode(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].control_mode;
  }}
void set_wheels_goal_angle(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].goal_angle;
  }}

void set_wheels_angle(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].angle;
  }}
void set_wheels_angle_error(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].angle_error;
  }}
void set_wheels_angle_pgain(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].angle_pgain;
  }}
void set_wheels_angle_igain(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].angle_igain;
  }}
void set_wheels_angle_dgain(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].angle_dgain;
  }}
void set_wheels_goal_velocity(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].goal_velocity;
  }}
void set_wheels_velocity(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].velocity;
  }}
void set_wheels_velocity_error(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].velocity_error;
  }}
void set_wheels_velocity_pgain(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].velocity_pgain;
  }}
void set_wheels_velocity_igain(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].velocity_igain;
  }}
void set_wheels_velocity_dgain(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)wheels[i].velocity_dgain;
  }}

void set_servos_pulse(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)servos[i].pulse;
  }}
void set_servos_angle(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)servos[i].angle;
  }}
void set_servos_interpolation_type(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)servos[i].interpolation_type;
  }}
void set_servos_start_angle(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)servos[i].start_angle;
  }}
void set_servos_goal_angle(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)servos[i].goal_angle;
  }}
void set_servos_goal_time(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = (float)servos[i].goal_time;
  }}
//sensors
void set_bumper_onoff(float* data_ptr, int data_num){
  int i;
  float tmp;
  for(i=0; i<data_num; i++){
    tmp = (float)bumpers[i].data;
    if(tmp > 0) {
      data_ptr[i] = 0;  //おさないときは0
    }else{
      data_ptr[i] = 1;  //おしたときには１
    }
  }}
void set_psd_data(float* data_ptr, int data_num){
  int i;
  for(i=0; i<data_num; i++){
    data_ptr[i] = psds[i].data;
  }}

//RobotStateにデータを格納する
void CollectDataToRobotStateList(){
  int i;
  int state_list_num = sizeof(robot_state_list)/sizeof(struct robot_state);
  
  //登録されたデータ収集関数を実行する
  for(i=0; i<state_list_num; i++){
    (robot_state_list[i].collect_func)(robot_state_list[i].data_vec, robot_state_list[i].vector_num);
  }
}

//RobotStateListをbufに書き出す
int sPrintRobotStateList(char* buf){
  int i;
  int size;
  int state_list_num = sizeof(robot_state_list)/sizeof(struct robot_state);
  //fprintf(stderr, "state_num %d\n", state_list_num);

  //bufに情報を溜める
  size=sprintf(buf, "(");
  for(i=0; i<state_list_num; i++){
    size+=sPrintRobotState(buf+size, 
			   robot_state_list[i].state_name,
			   robot_state_list[i].vector_num,
			   robot_state_list[i].data_vec);
  }
  size+=sprintf(buf+size, ")\n");

  //一応サイズチェック(本当は前段階でやらないと意味ないけど,おかしいことはここでわかる)
  if(size > MAXBUFSIZE){
    fprintf(stderr, "bufsize error\n");
    exit(-1);
  }
  return size;
}

//bufにdataを文字列として格納する
//(sensor-name sensor-num data0 data1 .. dataN) の形式
int sPrintRobotState(char* buf, char* sensor_name, int sensor_num, float* data){
  int size = 0;
  int i;
  if (sensor_num == 0 || data==NULL) return size;
  
  size = sprintf(buf, "(");
  size += sprintf(buf+size, "%s ", sensor_name);
  size += sprintf(buf+size, "%d ", sensor_num);
  for(i=0; i<sensor_num; i++){
    size += sprintf(buf+size, "%f ", data[i]);
  }
  size += sprintf(buf+size, ")\n");
  return size;
}
