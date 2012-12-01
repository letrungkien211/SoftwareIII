/*
  robot-serverから得られたsensorデータを整列して表示するための関数
 */
#include "viewarrange.h"
#include "read_robot_state.h"
#include "interpreter.h"
#include "command.h"
#include <stdio.h>

/*((sensor-name sensor-num data data ...)
   (sensor-name sensor-num data data ...)
   (sensor-name sensor-num data data ...)
  )
 という形式でくるロボットデータを整列して表示する
*/ 

#define MAXDATASIZE 10
#define MAXSENSORNAMESIZE 48
void PrintRobotData(char* buf){
  char sensorname[MAXSENSORNAMESIZE]; //sensornameを格納する
  float datavec[MAXDATASIZE];         //dataを格納する
  int j,datasize;
  char* ptr = buf;

  //strcpy(sensorname, "hogeo");
  ptr += 1; //(をとばす
  ptr = read_token(ptr, "%s", sensorname); //一区切り分読み込む
#if 1 
  while(sensorname[0] != ')'){ //)の場合は終了
    //data数を読み込む
    ptr = read_token(ptr, "%d", &datasize);
    for(j=0; j<datasize; j++){
      //dataを読み込む
      ptr = read_token(ptr, "%f", &(datavec[j]));
    }
    //表示
    printdata(datavec, sensorname, datasize);

    ptr += 2; // )\n をとばす
    ptr = read_token(ptr, "%s", sensorname);
  }
#endif
}

//目盛表示関数　何文字分の目盛りを表示するか
void printheader(int data_num){
  int i;
  for(i = 0; i < data_num; i++){
    fprintf(stdout, "----<");
    if(0<=i<=8){
      fprintf(stdout, " ");
    }
    fprintf(stdout, "%d", i+1);
    fprintf(stdout, ">");
  }
  fprintf(stdout, "\n");
}

//data表示関数(データ数が多いと改行する必要あるけど、移動代車はたかだか3~5個なので改行は要らない)
void printdata(float* datavec, char* dataname, int data_num){
  int i;
  //タイトル
  fprintf(stdout, "%s", dataname);
  fprintf(stdout, "[%d])\n", data_num);
  //目盛り
  printheader(data_num); 
  //データ
  for(i = 0; i < data_num; i++){
    fprintf(stdout, "%8.2f", datavec[i]);
  }
  fprintf(stdout, "\n");
}

