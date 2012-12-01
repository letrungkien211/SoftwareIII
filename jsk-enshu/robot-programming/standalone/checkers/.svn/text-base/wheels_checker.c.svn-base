/*
 * wheels_chcker.c
 *
 * 2006/11/25 nishino
 * 2007/12/06 ikuo
 */

#include <pthread.h>   /* pthread_create, etc. */
#include <stdio.h>
#include <stdlib.h>    /* exit */
#include <unistd.h>    /* usleep */
#include "pc104ctrl.h"
#include "wheels.h"

#define INTERVAL_MS 10
#define INTERVALPOS_MS 5
#define INTERVALVEL_MS 50

#define	FALSE       (0)
#define	TRUE        (!(FALSE))

int g_fd;
struct wheel_param wheels[WHEELS_NUM];
int running_flag;

void *wheels_control(void *arg);
void set_wheels_velocity(float v0, float v1, float v2);
void set_wheels_step_angle(float a0, float a1, float a2);

int keycheck(void) {
  fd_set fds;
  struct timeval tv;
  int ret;

  FD_ZERO(&fds);
  FD_SET(0,&fds);
  tv.tv_sec=0; tv.tv_usec=0;

  ret=select(1, &fds, NULL, NULL, &tv);
  return ret;
}

unsigned long interval=INTERVAL_MS*1000;


/*
  もともとのサンプルに対して，現在の状況をprintfされるようにしただけ
  順番に以下を実行する
  1.位置制御
    Motor0,1,2(正):  1[sec]
    Motor0,1,2(逆):  1[sec]

  2.速度制御
    Motor0,1,2(正):  1[sec]
    Motor0,1,2(逆):  1[sec]
*/
int main(int argc, char *argv[]) {
  pthread_t wc_thread;
  int ch;
  float goal_target = 200.0;
  int interpolate_num = 4;
  int i;
  
  g_fd = pc104_open();
  /* intialize */
  get_wheels_state(g_fd, wheels);   /* いっかいget_stateしておく */
  for(ch = 0; ch < WHEELS_NUM; ch++) {
    wheels[ch].control_mode = PWM_CONTROL;
    wheels[ch].pwm = 0;
    wheels[ch].encoder = 0;
    wheels[ch].angle_error_integration = 0.0;
    wheels[ch].velocity_error_integration = 0.0;
    wheels[ch].angle = 0.0;
    wheels[ch].velocity = 0.0;
  }

  set_wheels_gains(wheels);

  running_flag = TRUE;
  // start control loop
  //  ここでget_wheels_stateがされていて，常にstateは更新されている
  if (pthread_create( &wc_thread, NULL, wheels_control, NULL)) {
    perror("pthread_create");
    exit(1);
  }

  // 位置制御
  printf("POSITION_CONTROL(Normal): MOTOR0,1,2 Goal:%f\n", goal_target);
  set_wheels_step_angle(goal_target, goal_target, goal_target);
  for(i=0; i<interpolate_num; i++){
    //その間のpotentioを表示
    printf(" Current Angle: #f(%f %f %f)\n", 
	   wheels[WHEEL_0].angle, wheels[WHEEL_1].angle, wheels[WHEEL_2].angle);
    usleep(1000*1000/(float)interpolate_num);
  }
  printf("POSITION_CONTROL(Reverse): MOTOR0,1,2 Goal:0\n");
  set_wheels_step_angle(-1*goal_target, -1*goal_target, -1*goal_target);
  for(i=0; i<interpolate_num; i++){
    //その間のpotentioを表示
    printf(" Current Angle: #f(%f %f %f)\n", 
	   wheels[WHEEL_0].angle, wheels[WHEEL_1].angle, wheels[WHEEL_2].angle);
    usleep(1000*1000/(float)interpolate_num);
  }
  
  //速度制御
  printf("Sleep...\n");
  sleep(1);
  printf("VELOCITY_CONTROL(Normal): MOTOR0,1,2 Goal_v:200\n");
  set_wheels_velocity(200.0, 200.0, 200.0);
  for(i=0; i<interpolate_num; i++){
    printf(" Current Angle: #f(%f %f %f)\n", 
	   wheels[WHEEL_0].angle,
	   wheels[WHEEL_1].angle,
	   wheels[WHEEL_2].angle);
    usleep(1000*1000/(float)interpolate_num);
  }
  printf("VELOCITY_CONTROL(Reverse): MOTOR0,1,2 Goal_v:-200\n");
  set_wheels_velocity(-200.0, -200.0, -200.0);
  for(i=0; i<interpolate_num; i++){
    printf(" Current Angle: #f(%f %f %f)\n", 
	   wheels[WHEEL_0].angle,
	   wheels[WHEEL_1].angle,
	   wheels[WHEEL_2].angle);
    usleep(1000*1000/(float)interpolate_num);
  }

  // 終了処理
  running_flag = FALSE;
  pthread_join( wc_thread, NULL );
  printf("control thread joined.\n");
  wheels_power_off(g_fd);
  pc104_close(g_fd);
  return 0;
}


//それぞれの軸の速度制御
void set_wheels_velocity(float v0, float v1, float v2) {
  wheels[WHEEL_0].control_mode = wheels[WHEEL_1].control_mode = wheels[WHEEL_2].control_mode = VELOCITY_CONTROL;
  wheels[WHEEL_0].goal_velocity = v0;
  wheels[WHEEL_1].goal_velocity = v1;
  wheels[WHEEL_2].goal_velocity = v2;
  
}

//それぞれの軸の位置制御
void set_wheels_step_angle(float a0, float a1, float a2) {
  wheels[WHEEL_0].control_mode = wheels[WHEEL_1].control_mode = wheels[WHEEL_2].control_mode = ANGLE_CONTROL;
  wheels[WHEEL_0].goal_angle = wheels[WHEEL_0].angle + a0;
  wheels[WHEEL_1].goal_angle = wheels[WHEEL_1].angle + a1;
  wheels[WHEEL_2].goal_angle = wheels[WHEEL_2].angle + a2;
}

void *wheels_control(void *arg) {
  fprintf(stderr, "control thread started.\n");
  while(running_flag) {
    get_wheels_state(g_fd, wheels);
    calc_wheels_output(wheels);
    set_wheels_output(g_fd, wheels);
    switch (wheels[0].control_mode) {
    case PWM_CONTROL: interval=INTERVAL_MS*1000; break;
    case VELOCITY_CONTROL: interval=INTERVALVEL_MS*1000; break;
    case ANGLE_CONTROL: interval=INTERVALPOS_MS*1000; break;
    default: interval=INTERVAL_MS*1000; break;
    }
    usleep(interval);
  }
  return NULL;
}
