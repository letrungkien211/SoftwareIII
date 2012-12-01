/*
  robot-server��������줿sensor�ǡ��������󤷤�ɽ�����뤿��δؿ�
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
 �Ȥ��������Ǥ����ܥåȥǡ��������󤷤�ɽ������
*/ 

#define MAXDATASIZE 10
#define MAXSENSORNAMESIZE 48
void PrintRobotData(char* buf){
  char sensorname[MAXSENSORNAMESIZE]; //sensorname���Ǽ����
  float datavec[MAXDATASIZE];         //data���Ǽ����
  int j,datasize;
  char* ptr = buf;

  //strcpy(sensorname, "hogeo");
  ptr += 1; //(��ȤФ�
  ptr = read_token(ptr, "%s", sensorname); //����ڤ�ʬ�ɤ߹���
#if 1 
  while(sensorname[0] != ')'){ //)�ξ��Ͻ�λ
    //data�����ɤ߹���
    ptr = read_token(ptr, "%d", &datasize);
    for(j=0; j<datasize; j++){
      //data���ɤ߹���
      ptr = read_token(ptr, "%f", &(datavec[j]));
    }
    //ɽ��
    printdata(datavec, sensorname, datasize);

    ptr += 2; // )\n ��ȤФ�
    ptr = read_token(ptr, "%s", sensorname);
  }
#endif
}

//����ɽ���ؿ�����ʸ��ʬ���������ɽ�����뤫
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

//dataɽ���ؿ�(�ǡ�������¿���Ȳ��Ԥ���ɬ�פ��뤱�ɡ���ư��֤Ϥ�������3~5�ĤʤΤǲ��Ԥ��פ�ʤ�)
void printdata(float* datavec, char* dataname, int data_num){
  int i;
  //�����ȥ�
  fprintf(stdout, "%s", dataname);
  fprintf(stdout, "[%d])\n", data_num);
  //������
  printheader(data_num); 
  //�ǡ���
  for(i = 0; i < data_num; i++){
    fprintf(stdout, "%8.2f", datavec[i]);
  }
  fprintf(stdout, "\n");
}

