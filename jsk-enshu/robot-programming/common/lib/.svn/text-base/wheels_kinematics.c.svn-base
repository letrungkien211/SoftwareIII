/*
 * wheels_kinematics.c
 *
 * 2007/12/06 ikuo
 * 2009/12/12 add position control by nakanish
 */

#include <math.h>		/* sin, cos */
#include "pc104ctrl.h"
#include "wheels.h"
#include "wheels_kinematics.h"
#include "servo.h"             //for interpolate_type
#include <pthread.h>
#include <unistd.h>

#define	WHEELPARAM_L	(80.0)		/* 台車の中心からオムニホイールの中心までの距離 */
#define	WHEELPARAM_R	(48.0/2)	/* オムニホイール径＝48mm */
#define	FALSE       (0)
#define	TRUE        (!(FALSE))
#define DAISYA_INTERVAL_MS 100

const float	ALPHA[WHEELS_NUM] = { /* 各オムニホイールの取り付け角度 */
  //とりつけ角度は、右をx、前をyとしたときのなす角度
  deg2rad(150.0), deg2rad(270.0), deg2rad(30.0)
};
static int daisya_control_running_flag = FALSE;
static void *daisya_control(void *arg);
static pthread_t daisya_control_thread;

//指定の台車速度になるように車輪を制御
// jsk_xv, jsk_yv, の座標は前がx, 右がy
void set_car_velocity(float jsk_xv, float jsk_yv, float jsk_thetav/* , float theta */) {
  //高野先生の座標系とJSKの座標系を変換
  float xv,yv,thetav;
  xv = - jsk_yv;
  yv = jsk_xv;
  thetav = jsk_thetav;
  
  //  float omega[WHEELS_NUM];
  const float theta=0.0;
  int ch;

  for (ch=0; ch<WHEELS_NUM; ch++) {
    //     omega[ch] = (WHEELPARAM_L * thetav - sin(ALPHA[ch] + theta) * xv + cos(ALPHA[ch] + theta) * yv) / WHEELPARAM_R;
    //     wheels[ch].goal_velocity = omega[ch] * WHEELPARAM_R;
    wheels[ch].goal_velocity = (WHEELPARAM_L * thetav - sin(ALPHA[ch] + theta) * xv + cos(ALPHA[ch] + theta) * yv);
  }
  if(daisya.controlmode == VELOCITY_CONTROL)
    printf("wheel-vels=(%f, %f, %f)\n", wheels[0].goal_velocity, wheels[1].goal_velocity, wheels[2].goal_velocity);
}

/*********************************************************
   for  台車位置制御
     servo周りの補間を参考
 *********************************************************/
//指定の台車位置になるように速度制御指令を変更する
// ちなみに、x,y,はあくまで、local座標からの積分量である
// thetaで回転するとx,yは世界座標からずれていくので注意すること
void car_pos_interpolation(float x, float y, float theta, float time){
  struct timeval tv;
  //start時間のset
  gettimeofday(&tv, NULL);
  daisya.start_sec = tv.tv_sec;
  daisya.start_usec = tv.tv_usec;
  //start時の位置のset
  //  指令が送られた瞬間の位置を0にする(相対にするため)
  daisya.current_x = 0;
  daisya.current_y = 0;
  daisya.current_theta = 0;
  daisya.start_x = daisya.current_x;
  daisya.start_y = daisya.current_y;
  daisya.start_theta = daisya.current_theta;

  //
  daisya.goal_time = time;
  daisya.goal_x = x;
  daisya.goal_y = y;
  daisya.goal_theta = theta;
  //
  //制御モードの指定(とりあえずやくど最小で)
  daisya.interpolation_type = INTERPOLATE_MINJERK;
}

//現在値を0にセットする
void reset_car_params(){
  daisya.x = 0;
  daisya.y = 0;
  daisya.theta = 0;
  daisya.xv = 0;
  daisya.yv = 0;
  daisya.thetav = 0;
  //
  daisya.start_x = 0;
  daisya.start_y = 0;
  daisya.start_theta = 0;
  daisya.current_x = 0;
  daisya.current_y = 0;
  daisya.current_theta = 0;
  daisya.current_xv = 0;
  daisya.current_yv = 0;
  daisya.current_thetav = 0;
  daisya.goal_x = 0;
  daisya.goal_y = 0;
  daisya.goal_theta = 0;
  daisya.goal_time = 0;
  daisya.interpolation_type = 0; //FINISH
  daisya.start_sec = 0;
  daisya.start_usec = 0;
  //
  daisya.controlmode = VELOCITY_CONTROL;
}

//台車位置制御のgainをセットする
void set_car_gains(){
  //適当
  daisya.x_pgain = 20;
  daisya.y_pgain = 20;
  daisya.theta_pgain = 20;
}

//現在の台車速度や位置を更新
void calc_current_daisyastate(struct timeval *prev_tv){
  struct timeval tv;
  float diff_time;
  float a0,a1,a2,b0,b1,b2;
  float tmp1,tmp2;
  float xv,yv;
  float omega[WHEELS_NUM];
  int i;
  for(i=0;i<WHEELS_NUM; i++){
    omega[i] = deg2rad(wheels[i].velocity);
  }
  //wheels[i].velocityから,台車のthetav, xv, yvを求める(順運動学)
  //xdot, ydot, thetadot, phi_0, phi_1, phi_2が未知変数
  //thetaは元の座標に対する回転角度
  //6個の式が出て来るから、普通に逆行列をかければ計算できる
  //  逆行列を毎回計算するのは面倒なので式をといて代入か
  //  暗算は難しそうなのでとりあえず保留で
  //  例によって、この式で求まるx,yは座標変換の必要があることに注意
#if 0
  a0 = cos(daisya.current_theta) * sin(ALPHA[0]) + sin(daisya.current_theta) * cos(ALPHA[0]);
  a1 = cos(daisya.current_theta) * sin(ALPHA[1]) + sin(daisya.current_theta) * cos(ALPHA[1]);
  a2 = cos(daisya.current_theta) * sin(ALPHA[2]) + sin(daisya.current_theta) * cos(ALPHA[2]);
  b0 = sin(daisya.current_theta) * sin(ALPHA[0]) - cos(daisya.current_theta) * cos(ALPHA[0]);
  b1 = sin(daisya.current_theta) * sin(ALPHA[1]) - cos(daisya.current_theta) * cos(ALPHA[1]);
  b2 = sin(daisya.current_theta) * sin(ALPHA[2]) - cos(daisya.current_theta) * cos(ALPHA[2]);
#endif
#if 1
  a0 = cos(0) * sin(ALPHA[0]) + sin(0) * cos(ALPHA[0]);  // 0.5
  a1 = cos(0) * sin(ALPHA[1]) + sin(0) * cos(ALPHA[1]);  // 0.5
  a2 = cos(0) * sin(ALPHA[2]) + sin(0) * cos(ALPHA[2]);  // -1
  b0 = sin(0) * sin(ALPHA[0]) - cos(0) * cos(ALPHA[0]);  // - 1.73/2
  b1 = sin(0) * sin(ALPHA[1]) - cos(0) * cos(ALPHA[1]);  // + 1.73/2
  b2 = sin(0) * sin(ALPHA[2]) - cos(0) * cos(ALPHA[2]);  // 0
#endif
  //
  tmp1 = WHEELPARAM_R*(omega[0]*(b2-b1) + omega[1]*(b0-b2) + omega[2]*(b1-b0));
  tmp2 = WHEELPARAM_R*(omega[0]*(a2-a1) + omega[1]*(a0-a2) + omega[2]*(a1-a0));
  xv = tmp1/(a0*(b1-b2)+a1*(b2-b0)+a2*(b0-b1));
  yv = tmp2/(b0*(a1-a2)+b1*(a2-a0)+b2*(a0-a1));
  daisya.current_thetav = (a0*xv + b0*yv + WHEELPARAM_R*omega[0])/WHEELPARAM_L;
  daisya.current_xv = yv;
  daisya.current_yv = -1*xv;

  //fprintf(stderr, "w0: %f, w1: %f, w2: %f\n", wheels[0].velocity, wheels[1].velocity, wheels[2].velocity);
  //fprintf(stderr, "xv: %f, yv: %f, thetav: %f\n", daisya.current_xv, daisya.current_yv, daisya.current_thetav);

  //前回からの時間幅の分を積分して足し算する(積分) DAISYA_INTERVAL_MSだけで計算してもいいかも
  gettimeofday(&tv, NULL);
  diff_time = (tv.tv_sec - prev_tv->tv_sec) + 0.001 * 0.001 * (tv.tv_usec - prev_tv->tv_usec);
  daisya.current_x += daisya.current_xv * diff_time;
  daisya.current_y += daisya.current_yv * diff_time;
  daisya.current_theta += daisya.current_thetav * diff_time;
}

//現在の台車速度を生成
// とりあえずpgainの制御のみ loopは大きめでいいのかもしれない
void calc_current_daisya_output(){
  //現在の位置に目標位置を引いて、目標速度をsetする
  daisya.xv = (daisya.x - daisya.current_x) * daisya.x_pgain;
  daisya.yv = (daisya.y - daisya.current_y) * daisya.y_pgain;
  daisya.thetav = (daisya.theta - daisya.current_theta) * daisya.theta_pgain;
}
/**********************************************
   台車の位置制御ループ関数
***********************************************/
/* start daisya control thread */
void start_daisya_control() {
  if (! daisya_control_running_flag) {
    daisya_control_running_flag = TRUE;
    if (pthread_create( &daisya_control_thread, NULL, daisya_control, &daisya)) {
      perror("pthread_create");
    }
  }
}
/* stop daisya control thread */
void stop_daisya_control() {
  daisya_control_running_flag = FALSE;
  pthread_join( daisya_control_thread, NULL );
}

/* is running */
int isrunning_daisya_control() {
  return daisya_control_running_flag;
}

/* 台車位置制御の control loop */
// これをthreadで走らせておく
static void *daisya_control(void *arg) {
  struct timeval tv;
  set_car_gains();
  reset_car_params();
  gettimeofday(&tv, NULL);        //時間を取得

  while(daisya_control_running_flag) {
    calc_current_daisyastate(&tv);  //現在の台車速度や位置を更新
    gettimeofday(&tv, NULL);        //時間を取得
    daisya_interpolate(&tv);        //補間指令を生成
    if(daisya.controlmode == ANGLE_CONTROL){
      calc_current_daisya_output();   //現在の台車速度を生成
      set_car_velocity(daisya.xv, daisya.yv, daisya.thetav); //車輪に出力
      usleep(DAISYA_INTERVAL_MS * 1000);
    }
  }
  return NULL;
}

/**********************************************
   台車の位置制御の補間
***********************************************/
void daisya_interpolate(struct timeval *ptv) {
  double t, pos;
  //Step1. 現在の目標位置を決定する
  t = 
    ((ptv->tv_sec - daisya.start_sec) * 1000.0+ (ptv->tv_usec - daisya.start_usec) / 1000.0) / daisya.goal_time;
  switch(daisya.interpolation_type) {
  case INTERPOLATE_LINEAR:  
    pos = interpolate_linear(t); 
    break;
  case INTERPOLATE_MINJERK: 
    pos = interpolate_minjerk(t); 
    break;
  default:                  
    return;
  }
  daisya.x = daisya.start_x + (daisya.goal_x - daisya.start_x) * pos;
  daisya.y = daisya.start_y + (daisya.goal_y - daisya.start_y) * pos;
  daisya.theta = daisya.start_theta + (daisya.goal_theta - daisya.start_theta) * pos;
  if (t >= 1.0) {
    daisya.x = daisya.goal_x;
    daisya.y = daisya.goal_y;
    daisya.theta = daisya.goal_theta;
    daisya.interpolation_type = INTERPOLATE_FINISH;
  }
}
/* execute linear interpolation */
float interpolate_linear(float t) {
  return t;
}

void daisya_HoffArbib(double t,  double target_t, double dt, 
	       double xi, double vi, double ai, double xf, double vf, double af,
	       double *x, double *v, double *a)
{
  double a0,a1,a2,a3,a4,a5;
  double A,B,C;
  double remain_t=target_t-t;

  if(remain_t > dt){
    A=(xf-(xi+vi*target_t+(ai/2.0)*target_t*target_t))/(target_t*target_t*target_t);
    B=(vf-(vi+ai*target_t))/(target_t*target_t);
    C=(af-ai)/target_t;
    
    a0=xi;
    a1=vi;
    a2=ai/2.0;
    a3=10*A-4*B+0.5*C;
    a4=(-15*A+7*B-C)/target_t;
    a5=(6*A-3*B+0.5*C)/(target_t*target_t);

    *x=a0+a1*t+a2*t*t+a3*t*t*t+a4*t*t*t*t+a5*t*t*t*t*t;
    *v=a1+2*a2*t+3*a3*t*t+4*a4*t*t*t+5*a5*t*t*t*t;
    *a=2*a2+6*a3*t+12*a4*t*t+20*a5*t*t*t;
  } else {
    *x=xf;
    *v=vf;
    *a=af;
  }
}

/* execute min jerk interpolation */
float interpolate_minjerk(float t) {
  double pos;
  double dt=0.02;//20ms
  double v,a;

  daisya_HoffArbib(t,1.0, dt, 0, 0, 0, 1, 0, 0, &pos, &v, &a);

  return (float)pos;
}




