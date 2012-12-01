#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <curses.h>
#include <sys/termios.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>

#include <unistd.h>
#include <netdb.h>
#include "screen.h"
#include "read_robot_state.h"
#include "viewarrange.h"
#include "robot.h"

#include "wheels.h"
#include "servo.h"
#include "psd.h"
#include "bumper.h"
#include "socket_functions.h"
#include "multi_socket_functions.h"
#include "wheels_kinematics.h"
#include "command.h"
struct servo_param servos[SERVO_NUM];
struct wheel_param wheels[WHEELS_NUM];
struct psd_data psds[PSD_NUM];
struct bumper_data bumpers[BUMPER_NUM];
struct daisya_param daisya;

#define DEFAULTPORT 5000
//ここでは使わないけど実体なくてエラーになるので定義しておく
client sockets[MAX_SOCKET];
int interpreter(char *line){return 0;};
void wheels_power_off_mt(){};
void set_car_velocity(float xv, float yv, float thetav){};
void start_servo_interpolation_all(struct servo_param servos[], 
				   float goal_angles[], float msec, int type){};
void reset_car_params(){};
void car_pos_interpolation(float x, float y, float theta, float time){};

//本体
int main(int argc, char **argv){
  //変数
  char command[64] = "get-robot-state\n";
  int n;
  char* buf[8092]; //十分大きい領域
  int client_sock;

  //fprintf(stderr, "%s\n", HOSTIP);

  // ***********    robot-server(サーバ)とsocketで繋ぐ(ここから) **************************
  if(argc == 3){
    startup_client(argv[1], atoi(argv[2]), &client_sock);
  } else if(argc == 2){
    startup_client(argv[1], DEFAULTPORT, &client_sock);
  } else {
    startup_client(HOSTIP, DEFAULTPORT, &client_sock);
  }

  // ***********    robot-server(サーバ)とsocketで繋ぐ(ここまで) *************************
  //terminalの表示初期設定(おまじない)
  init_termcap(TRUE);
  clear_scr();

  // ***********    dataの取得と表示(ここから)   ************************
  //1)表示するデータを読み込む  .. 全部表示するのは面倒なので allで全部出る
  //2)一度試し読みしてデータ領域(robotstate)を確保する(全部取りでいいか)
  while(1){
    //data受信要求
    write(client_sock, command, 64); //"get-robot-state\n"をwriteしている
    //bufにdataを読み込む
    n = DataRead(client_sock, (char*)buf);
    //bufを表示
    if(n != -1){
      PrintRobotData((char*)buf);
    }
    usleep(200000);
  }
  // ***********    dataの取得と表示(ここまで)   ************************
  //
  //終了
  close(client_sock);
  return 0;
}
