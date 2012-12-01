/*---------------------------------------------------
  viewarrange.h:
  sensor情報を整列して表示するための関数の用意
  --------------------------------------------------*/
#ifndef VIEWARRANGE_H_INCLUDED_
#define VIEWARRANGE_H_INCLUDED_

void PrintRobotData(char* buf);
void printheader(int data_num);
void printdata(float* datavec, char* dataname, int data_num);

#endif //VIEWARRANGE_H_INCLUDED_
