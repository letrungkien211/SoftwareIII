/*---------------------------------------------------
  read_robot_state.h:
  ソケットから送られる文字列を読みとく
  --------------------------------------------------*/
#ifndef READ_ROBOT_STATE_H_INCLUDED_
#define READ_ROBOT_STATE_H_INCLUDED_

int DataRead(int fd, char* buf);
int DataRead_timeout(int fd, char* buf, int timeout);
int count_kakko(char* bufp, int num);

#endif //READ_ROBOT_STATE_H_INCLUDED_
