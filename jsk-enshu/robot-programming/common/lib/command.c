#include "command.h"
#include "servo_mt.h" //for arm
#include "wheels.h"   //for wheel
#include "wheels_kinematics.h" //for set_car_velocity
#include "bumper.h"   //for bumper
#include "psd.h"      //for psd
#include "robot.h"    //for maxbufsize definition
#include "robot_state.h" //for collectdatatorobotstate, sprintrobotstate
#include "interpreter.h"  //for read_token
#include "multi_socket_functions.h" //for WriteMessageToPrivateSocket

#define DEBUG 1

// 意図しないcommandがきた場合は無視するようにしないと
// 書式ミスによるエラー処理はしていないので注意
//  最初にTokenの数を数えてチェックくらいはしないとまずそう
//
//
//命令リストの登録
// 状態取得関数はget-robot-stateで全て賄う
struct robot_command robot_command_list[] =
  {{"wheel-controlmode-vector", &wheel_controlmode_vector},
   {"wheel-angle-vector", &wheel_angle_vector},
   {"wheel-velocity-vector", &wheel_velocity_vector},
   {"wheel-pwm-vector", &wheel_pwm_vector},
   {"daisya-velocity-vector", &daisya_velocity_vector},
   {"wheel-reset", &wheel_reset},
   //台車位置制御
   {"daisya-controlmode", &daisya_controlmode},
   {"set-daisya-position-vector", &set_daisya_position_vector},
   {"get-daisya-position-vector", &get_daisya_position_vector},
   {"set-daisya-position-pgain-vector", &set_daisya_position_pgain_vector},
   {"get-daisya-position-pgain-vector", &get_daisya_position_pgain_vector},
   {"daisya-reset", &daisya_reset},
   //
   {"set-wheel-angle-pgain-vector", &set_wheel_angle_pgain_vector},
   {"set-wheel-angle-dgain-vector", &set_wheel_angle_dgain_vector},
   {"set-wheel-angle-igain-vector", &set_wheel_angle_igain_vector},
   {"get-wheel-angle-pgain-vector", &get_wheel_angle_pgain_vector},
   {"get-wheel-angle-dgain-vector", &get_wheel_angle_dgain_vector},
   {"get-wheel-angle-igain-vector", &get_wheel_angle_igain_vector},
   //
   {"set-wheel-velocity-pgain-vector", &set_wheel_velocity_pgain_vector},
   {"set-wheel-velocity-dgain-vector", &set_wheel_velocity_dgain_vector},
   {"set-wheel-velocity-igain-vector", &set_wheel_velocity_igain_vector},
   {"get-wheel-velocity-pgain-vector", &get_wheel_velocity_pgain_vector},
   {"get-wheel-velocity-dgain-vector", &get_wheel_velocity_dgain_vector},
   {"get-wheel-velocity-igain-vector", &get_wheel_velocity_igain_vector},
   //
   {"servo-poweron-vector", &servo_poweron_vector},
   {"servo-interpolation-method", &servo_interpolation_method},
   {"servo-angle-vector", &servo_angle_vector},
   //
   {"get-robot-state", &get_robot_state},
   //
   //この命令リストが最後だよ、と教えるためだけの命令(命令長さを持たせるのが面倒だったので)
   {"end", &null_func}
  };

/*********************************
    車輪用のコマンド
 *********************************/

//車輪の制御モードを与える
int wheel_controlmode_vector(char *ptr){
  int i;
  float tmp;
  //目標制御モードを取得してセット
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].control_mode = (int)tmp;
  }
#ifdef DEBUG
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-controlmode-vector:#i(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%d ", wheels[i].control_mode);
  }
  fprintf(stderr, ")\n");
#endif
  return TRUE;
}

//車輪に目標速度を与える
int wheel_angle_vector(char *ptr){
  float tmp;
  float time;
  int i;
  //
  //目標車輪角度を取得してセット
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].goal_angle = tmp;
  }
  //目標到達時間を取得してセット
  ptr = read_token(ptr, "%f", &time);
  
  //実行部はなしだが、servoのようにstart_wheel_interpolationがあるべきかと思う

#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-angle-vector:#f(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%f ", wheels[i].goal_angle);
  }
  fprintf(stderr, ") time: %f\n", time);
#endif
  //
  return TRUE;
}

//車輪に目標速度を与える
int wheel_velocity_vector(char *ptr){
  float tmp;
  //float time;
  int i;
  //
  //目標車輪速度を取得してセット
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].goal_velocity = tmp;
  }
  //目標到達時間を取得してセット
  //ptr = read_token(ptr, "%f", &time);
  //実行部はなしだが、servoのようにstart_wheel_interpolationがあるべきかと思う
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-velocity-vector:#f(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%f ", wheels[i].goal_velocity);
  }
  fprintf(stderr, ")\n");
  //fprintf(stderr, ") time: %f\n", time);
#endif
  //
  return TRUE;
}

//車輪に目標pwmを与える
int wheel_pwm_vector(char *ptr){
  float tmp;
  //float time;
  int i;
  //
  //目標車輪pwmを取得してセット
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].pwm = (int)tmp;
  }
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-velocity-vector:#i(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%d ", wheels[i].pwm);
  }
  fprintf(stderr, ")\n");
#endif
  //
  return TRUE;
}

//台車に目標xy速度、目標角速度[deg]を与える
int daisya_velocity_vector(char *ptr){
  float xvel,yvel,thetavel;
  ptr = read_token(ptr, "%f", &xvel);
  ptr = read_token(ptr, "%f", &yvel);
  ptr = read_token(ptr, "%f", &thetavel);
  //
  //台車制御指令を送る(この中にデバッグメッセージが入っている)
  set_car_velocity(xvel, yvel, deg2rad(thetavel));
  return TRUE;
}

//車輪parameterを初期状態にセットする
int wheel_reset(char *ptr){
  //一度電源を切る
  wheels_power_off_mt();
  //値を設定
  int ch;
  for(ch = 0; ch < WHEELS_NUM; ch++) {
    wheels[ch].control_mode = VELOCITY_CONTROL;
    wheels[ch].pwm = 0;
    wheels[ch].encoder = 0;
    wheels[ch].angle_error_integration = 0.0;
    wheels[ch].velocity_error_integration = 0.0;
    wheels[ch].angle = 0.0;
    wheels[ch].velocity = 0.0;
    wheels[ch].goal_angle = 0.0;
    wheels[ch].goal_velocity = 0.0;
  }
#ifdef DEBUG
  fprintf(stderr, "wheel reset\n");
#endif
  return TRUE;
}

//車輪のgainをセット
int set_wheel_angle_pgain_vector(char *ptr){
  float tmp;
  int i;
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].angle_pgain = tmp;
  }
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-angle-pgain-vector:#f(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%f ", wheels[i].angle_pgain);
  }
  fprintf(stderr, ")\n");
#endif
  //
  return TRUE;
}
int set_wheel_angle_dgain_vector(char *ptr){
  float tmp;
  int i;
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].angle_dgain = tmp;
  }
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-angle-dgain-vector:#f(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%f ", wheels[i].angle_dgain);
  }
  fprintf(stderr, ")\n");
#endif
  //
  return TRUE;
}
int set_wheel_angle_igain_vector(char *ptr){
  float tmp;
  int i;
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].angle_igain = tmp;
  }
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-angle-igain-vector:#f(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%f ", wheels[i].angle_igain);
  }
  fprintf(stderr, ")\n");
#endif
  //
  return TRUE;
}
int set_wheel_velocity_pgain_vector(char *ptr){
  float tmp;
  int i;
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].velocity_pgain = tmp;
  }
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-velocity-pgain-vector:#f(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%f ", wheels[i].velocity_pgain);
  }
  fprintf(stderr, ")\n");
#endif
  //
  return TRUE;
}
int set_wheel_velocity_dgain_vector(char *ptr){
  float tmp;
  int i;
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].velocity_dgain = tmp;
  }
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-velocity-dgain-vector:#f(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%f ", wheels[i].velocity_dgain);
  }
  fprintf(stderr, ")\n");
#endif
  //
  return TRUE;
}
int set_wheel_velocity_igain_vector(char *ptr){
  float tmp;
  int i;
  for(i=0; i<WHEELS_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    wheels[i].velocity_igain = tmp;
  }
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "wheel-velocity-igain-vector:#f(");
  for(i=0; i<WHEELS_NUM; i++){  
    fprintf(stderr, "%f ", wheels[i].velocity_igain);
  }
  fprintf(stderr, ")\n");
#endif
  //
  return TRUE;
}

//gainの取得
int get_wheel_angle_pgain_vector(char *ptr){
  char buf[MAXBUFSIZE];
  int size,i;
  size = sprintf(buf, "#f(");
  for(i=0; i<WHEELS_NUM; i++){
    size += sprintf(buf+size, "%f ", wheels[i].angle_pgain);
  }
  size += sprintf(buf+size, ")\n");
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}
int get_wheel_angle_dgain_vector(char *ptr){
  char buf[MAXBUFSIZE];
  int size,i;
  size = sprintf(buf, "#f(");
  for(i=0; i<WHEELS_NUM; i++){
    size += sprintf(buf+size, "%f ", wheels[i].angle_dgain);
  }
  size += sprintf(buf+size, ")\n");
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}
int get_wheel_angle_igain_vector(char *ptr){
  char buf[MAXBUFSIZE];
  int size,i;
  size = sprintf(buf, "#f(");
  for(i=0; i<WHEELS_NUM; i++){
    size += sprintf(buf+size, "%f ", wheels[i].angle_igain);
  }
  size += sprintf(buf+size, ")\n");
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}

int get_wheel_velocity_pgain_vector(char *ptr){
  char buf[MAXBUFSIZE];
  int size,i;
  size = sprintf(buf, "#f(");
  for(i=0; i<WHEELS_NUM; i++){
    size += sprintf(buf+size, "%f ", wheels[i].velocity_pgain);
  }
  size += sprintf(buf+size, ")\n");
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}
int get_wheel_velocity_dgain_vector(char *ptr){
  char buf[MAXBUFSIZE];
  int size,i;
  size = sprintf(buf, "#f(");
  for(i=0; i<WHEELS_NUM; i++){
    size += sprintf(buf+size, "%f ", wheels[i].velocity_dgain);
  }
  size += sprintf(buf+size, ")\n");
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}
int get_wheel_velocity_igain_vector(char *ptr){
  char buf[MAXBUFSIZE];
  int size,i;
  size = sprintf(buf, "#f(");
  for(i=0; i<WHEELS_NUM; i++){
    size += sprintf(buf+size, "%f ", wheels[i].velocity_igain);
  }
  size += sprintf(buf+size, ")\n");
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}

/*********************************
    台車の位置制御用コマンド
 *********************************/
int daisya_controlmode(char *ptr){
  float tmp;
  ptr = read_token(ptr, "%f", &tmp);
#ifdef DEBUG
  fprintf(stderr, "change wheel controlmode\n");
  switch((int)tmp){
  case VELOCITY_CONTROL:
    fprintf(stderr, " VELOCITY CONTROL\n");
    daisya.controlmode = VELOCITY_CONTROL;
    break;
  case ANGLE_CONTROL:
    fprintf(stderr, " ANGLE CONTROL\n");
    daisya.controlmode = ANGLE_CONTROL;
    break;
  default:
    fprintf(stderr, " No such method\n");
    fprintf(stderr, " Method is still %d\n", daisya.controlmode);
  }
#endif
  return TRUE;
}

int set_daisya_position_vector(char *ptr){
  float pos_vec[3]; //x y theta(rad)
  float time;
  int i;
  //
  for(i=0; i<3; i++){
    ptr = read_token(ptr, "%f", &pos_vec[i]);
  }
  ptr = read_token(ptr, "%f", &time);
  //
  //位置制御指令を送ってスタート
  switch(daisya.controlmode){
  case ANGLE_CONTROL:
    car_pos_interpolation(pos_vec[0], pos_vec[1], pos_vec[2], time);
    break;
  default:
    fprintf(stderr, "Not angle control mode\n");
  }
  return TRUE;
}

//現在の台車の位置、角度を返す
int get_daisya_position_vector(char *ptr){
  char buf[MAXBUFSIZE];
  int size;
  size = sprintf(buf, "#f(%f %f %f)\n", 
                 daisya.current_x, daisya.current_y, daisya.current_theta);
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}

//x,y,thetaの位置制御に対するgainを設定する
int set_daisya_position_pgain_vector(char* ptr){
  float gain_vec[3]; //x y theta
  int i;
  for(i=0; i<3; i++){
    ptr = read_token(ptr, "%f", &gain_vec[i]);
  }
  daisya.x_pgain = gain_vec[0];
  daisya.y_pgain = gain_vec[1];
  daisya.theta_pgain = gain_vec[2];
  return TRUE;
}
int get_daisya_position_pgain_vector(char* ptr){
  char buf[MAXBUFSIZE];
  int size;
  size = sprintf(buf, "#f(%f %f %f)\n", 
                 daisya.x_pgain, daisya.y_pgain, daisya.theta_pgain);
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}

//台車の位置制御指令を初期化する (controlmodeはすえおき)
int daisya_reset(char* ptr){
  int tmp_ctrlmode = daisya.controlmode;
  reset_car_params();
  daisya.controlmode = tmp_ctrlmode;
  return TRUE;
}

/*********************************
    ARM用のコマンド
 *********************************/
//腕に目標角度を与える
// waitの有無、補完の切替とかはとりあえず無視
int servo_angle_vector(char *ptr){
  float tmp_angle[SERVO_NUM];
  float time;
  int i;

  //目標車輪角度を取得してセット
  for(i=0; i<SERVO_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp_angle[i]);
  }
  //目標到達時間を取得してセット
  ptr = read_token(ptr, "%f", &time);

  //wait or not, interpolation type
  //実行(Minjerk専用になってるな)
  switch(current_interpolation_type){
  case INTERPOLATE_FINISH:
    start_servo_interpolation_all(servos, tmp_angle, time, INTERPOLATE_FINISH);
    break;
  case INTERPOLATE_LINEAR:
    start_servo_interpolation_all(servos, tmp_angle, time, INTERPOLATE_LINEAR);
    break;
  case INTERPOLATE_MINJERK:
    start_servo_interpolation_all(servos, tmp_angle, time, INTERPOLATE_MINJERK);
    break;
  }
  //wait_servo_interpolation(servos);
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "servo-angle-vector:#f(");
  for(i=0; i<SERVO_NUM; i++){  
    fprintf(stderr, "%f ", tmp_angle[i]);
  }
  fprintf(stderr, ") time: %f\n", time);
#endif
  return TRUE;
}

//servoの任意の軸の制御をOFFにしたいとき
// 1は制御ON, それ例外はOFF
int servo_poweron_vector(char *ptr){
  int i;
  float tmp;
  for(i=0; i<SERVO_NUM; i++){
    ptr = read_token(ptr, "%f", &tmp);
    if(tmp == 1.0){
      servos[i].poweronflag = 1;
    }else{
      servos[i].poweronflag = 0;
    }
  }
#ifdef DEBUG  
  //for debug 取得した値を表示
  fprintf(stderr, "servo-poweron-vector:#f(");
  for(i=0; i<SERVO_NUM; i++){  
    fprintf(stderr, "%d ", servos[i].poweronflag);
  }
  fprintf(stderr, ")\n");
#endif
  return TRUE;
}

//補間方式を切替える
// servo全てを切替えることはないと仮定して、一度に全部切替える
int servo_interpolation_method(char *ptr){
  float tmp;
  ptr = read_token(ptr, "%f", &tmp);
#ifdef DEBUG
  fprintf(stderr, "change servo interpolation method\n");
  switch((int)tmp){
  case INTERPOLATE_FINISH:
    fprintf(stderr, " INTERPOLATE_FINISH\n");
    current_interpolation_type = INTERPOLATE_FINISH;
    break;
  case INTERPOLATE_LINEAR:
    fprintf(stderr, " INTERPOLATE_LINIEAR\n");
    current_interpolation_type = INTERPOLATE_LINEAR;
    break;
  case INTERPOLATE_MINJERK:    
    fprintf(stderr, " INTERPOLATE_MINJERK\n");
    current_interpolation_type =  INTERPOLATE_MINJERK;
    break;
  default:
    fprintf(stderr, " No such method\n");
    fprintf(stderr, " Method is still %d\n", current_interpolation_type);
  }
#endif
  return TRUE;
};

/**********************************************
    センサ(状態)取得用コマンド arm, wheel,sensor共通
*********************************************/
/* client側にsensor情報を文字列データとして返信する
  robotstateの書式
 ((sensor-name sensor-num data0 data1 .. dataN)
  (sensor-name sensor-num data0 data1 .. dataN))
  というリスト形式で渡すことにする */
int get_robot_state(char *ptr){
  char buf[MAXBUFSIZE];
  //int i;
  int size;
  //現在のロボットデータを集める (この作業をしないと書き出すのが面倒なので)
  CollectDataToRobotStateList();
  //bufにロボットデータを格納
  size = sPrintRobotStateList(buf);
  //bufに格納したデータをsocketで送る
  WriteMessageToThePrivateSocket(buf,size);
  return TRUE;
}

int null_func(char *ptr){
  return TRUE;
}
