#include "multi_socket_functions.h"
#include "robot.h"
#include "command.h"
#include "wheels.h"
#include "servo.h"
#include "servo_mt.h"
#include "bumper.h"
#include "psd.h"
#include "interpreter.h"
#include "wheels_kinematics.h"

int server_sock;
client	sockets[MAX_SOCKET];

struct servo_param servos[SERVO_NUM];
struct wheel_param wheels[WHEELS_NUM];
struct psd_data psds[PSD_NUM];
struct bumper_data bumpers[BUMPER_NUM];

/***  wheel *****/
#define INTERVAL_MS 10
#define INTERVALPOS_MS 5
#define INTERVALVEL_MS 50
int g_fd;
int running_flag;
unsigned long interval=INTERVALVEL_MS*1000;
void *wheels_control(void *arg);
void wheels_init();

struct daisya_param daisya;
/***  wheel(ここまで) *****/

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

int main (int argc, char **argv){
  int s, i, port = 5000;
  //pthread_t thr_nervous, thr_writer, thr_reader;
  pthread_t wheel_thread;
  char hostname[30];
  pthread_t tid;

  /*** socket通信のための処理 ***/
  for (i=1;i<argc;i++){
    if (strcmp("-port", argv[i]) == 0) {
      port=atoi(argv[++i]);
    }}
  gethostname(hostname, sizeof(hostname));
  s = init_socket_server(hostname, &port);
  for (i=0; i< MAX_SOCKET ; i++) sockets[i].type=0;
  //threadで待ちうけ
  fprintf(stderr, "Waiting connection...\n");
  pthread_create(&tid, NULL, acceptor, (void *)s);
  /*** socket通信のための処理(ここまで) ***/

  /*** pc104のopen ***/
  g_fd = pc104_open_mt();
  
  /*** wheelsの用意 ***/
  wheels_init();
  running_flag = TRUE;
  if (pthread_create( &wheel_thread, NULL, wheels_control, NULL)) {
    perror("pthread_create");
    exit(1);
  }
  /*** wheelsの用意(ここまで) ***/

  /*** armsの用意 ****/
  //servoパラメタを与える
  if (!load_servo_parameters("servoparam", servos)) {
    exit(1);
  }
  servo_power_off_mt(servos);
  reset_all_servos(servos);
  //最初は各servoをOFFしておく
  for(i=0; i<SERVO_NUM; i++){
    servos[i].poweronflag = 0;
  }
  start_servo_control(servos); //これでthreadが自動で立ち上がる
  start_daisya_control();      //これで台車位置制御用threadが自動で立ち上がる
  /*** armsの用意(ここまで) ****/

  //待機します
  while(1){
    //sensorの状態を読む
    read_bumper_mt();
    read_psd_mt();
    //
    usleep(20000);
    //
    //key入力されたら終了
    if(keycheck()) break;
  }

  //終了処理
  running_flag = FALSE;
  pthread_join( wheel_thread, NULL );
  printf("control thread joined.\n");
  wheels_power_off_mt(g_fd);

  stop_servo_control();  //servoのthreadがオフされる
  servo_power_off_mt(servos);

  pc104_close_mt(g_fd);
  return 0;
}

/******************************************
 read_formで得られた1行分のコマンドを解釈する
 コマンド例
   wheel-angle-vector 0 0 0 1000
   wheel-vel-vector 100 100 100 1000
   servo-angle-vector 0 0 0 0 0 1000
   get-robot-state
*******************************************/
int interpreter(char *line)
{
  char com[128];
  char *ptr;
  int i=0;
  int command_flag=FALSE;

  //コマンドを切り出す
  while (*line && whitespace (*line)) line++;
  ptr = read_token(line, "%s", com);
  //fprintf(stderr, "recv command: %s\n", com);

  //切り出されたコマンドで一致するものがあれば、それを実行する
  // 内容自体はcommand.c,hに記述しているのでそこに追加していくこと
  while(1){
    //一致したら実行して抜ける
    if(strcmp(com, robot_command_list[i].command_name) == 0){
      (robot_command_list[i].func)(ptr);
      command_flag=TRUE;
      break;
    }
    //終端コマンドになったら終了
    if(strcmp("end", robot_command_list[i].command_name) == 0){
      break;
    }
    i++;
  }
  //
  //該当しないコマンドがきた場合はその旨を表示
  if(command_flag == FALSE){
    fprintf(stderr, "No such command %s\n", com);
  }
  return 0;
}

void wheels_init(){
  int ch;
  get_wheels_state(g_fd, wheels);   /* いっかいget_stateしておく */
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
  set_wheels_gains(wheels);
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
