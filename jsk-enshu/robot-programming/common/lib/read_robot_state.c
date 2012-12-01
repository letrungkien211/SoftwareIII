#include "read_robot_state.h"
#include "robot.h"
#include <sys/select.h> //for select
#include <string.h>     //for memcpy
#include <stdio.h>
#include <unistd.h>  //for read

//()�ο��������ޤ��ɤߤĤŤ���buf����¸����
// ����������������������
int DataRead(int fd, char* buf){
  int size=0;
  int ret=0;
  int i;
  int kakko_pos = 0;
  int kakko_num=0;
  int kakko_flag = FALSE;
  char tmp_buf[MAXBUFSIZE];
  char* tmp_bufp = tmp_buf;

  //�ǽ��(�����դ���ޤ��Ԥ�)
  while(1){
    ret=read(fd, tmp_bufp, MAXBUFSIZE);
    //fprintf(stderr, "%s\n", tmp_bufp);
    for(i=0; i<ret; i++){
      if(*tmp_bufp == '('){
	kakko_pos += i;
	kakko_flag = TRUE;
	break;
      }
      tmp_bufp++;
    }
    size += ret;
    if(kakko_flag == TRUE){
      break;
    }else{
      kakko_pos += ret;
    }
  }
  
  //kakko_pos�ΤȤ���ޤǤ�data�򥳥ԡ�����
  tmp_bufp = tmp_buf;
  tmp_bufp += kakko_pos;
  size = size - kakko_pos;
  for(i=0; i<size; i++){
    *buf++ = *tmp_bufp++;
  }
  //�����ޤǤ�kakko�ο��������
  kakko_num+=count_kakko(buf, size);
  //�����ɤ߹�������ɡ�kakko�ο���0�ǤϤʤ����,
  //��³���ǡ������ɹ��ߡ�kakko�ο���0�ˤʤ�ޤ��Ե�����
  //fprintf(stderr, "kakko_num is %d\n", kakko_num);
  if(!(size != 0 && kakko_num >= 0)){
    //fprintf(stderr, "hoge1\n");
    while(1){
      //�Ȥꤢ�����ɤ������ɤ߹���
      //fprintf(stderr, "hoge2\n");
      ret=read(fd, buf+size, sizeof(buf));
      if(ret!=0){
	kakko_num+=count_kakko(buf+size, ret);
	size+=ret;
	if(kakko_num == 0){
	  break;
	}
      }}}
  //data�λ������
  if(buf[size-1] != '\0'){
    buf[size] = '\0';
    size += 1;
  }
  return size;
}

//����Ū��DataRead������timeout������Ǥ���.
//timeout�������ϡ�-1���֤�
int DataRead_timeout(int fd, char* buf, int timeout){
  struct timeval tv;
  fd_set fds, readfds;
  int size=0;
  int ret=0;
  int i;
  int kakko_pos = 0;
  int kakko_num=0;
  int kakko_flag = FALSE;
  char tmp_buf[MAXBUFSIZE];
  char* tmp_bufp = tmp_buf;
  int n;

  //timeout������
  tv.tv_sec = 0;
  tv.tv_usec = timeout*1000;
  //�����
  FD_ZERO(&readfds);
  FD_SET(fd, &readfds);

  //�ǽ��(�����դ���ޤ��Ԥ�)
  while(1){
    memcpy(&fds, &readfds, sizeof(fd_set));
    n = select(0, &fds, NULL,NULL,&tv);
    //timeout��������0���֤�
    if(n==0){
      fprintf(stderr, "read timeout\n");
      return -1;
    }
    ret=read(fd, tmp_bufp, MAXBUFSIZE);
    //fprintf(stderr, "%s\n", tmp_buf);
    for(i=0; i<ret; i++){
      if(*tmp_bufp == '('){
	kakko_pos += i;
	kakko_flag = TRUE;
	break;
      }
      tmp_bufp++;
    }
    size += ret;
    if(kakko_flag == TRUE){
      break;
    }else{
      kakko_pos += ret;
    }
  }
  
  //kakko_pos�ΤȤ���ޤǤ�data�򥳥ԡ�����
  tmp_bufp = tmp_buf;
  tmp_bufp += kakko_pos;
  size = size - kakko_pos;
  for(i=0; i<size; i++){
    *buf++ = *tmp_bufp++;
  }
  //�����ޤǤ�kakko�ο��������
  kakko_num+=count_kakko(buf, size);
  //�����ɤ߹�������ɡ�kakko�ο���0�ǤϤʤ����,
  //��³���ǡ������ɹ��ߡ�kakko�ο���0�ʾ�ˤʤ�ޤ��Ե�����
  if(!(size != 0 && kakko_num >= 0)){
    //fprintf(stderr, "hoge1\n");
    while(1){
      memcpy(&fds, &readfds, sizeof(fd_set));
      n = select(0, &fds, NULL,NULL,&tv);
      //timeout��������0���֤�
      if(n==0){
	fprintf(stderr, "read timeout2\n");
	return -1;
      }	
      //�Ȥꤢ�����ɤ������ɤ߹���
      //fprintf(stderr, "hoge2:%d\n", kakko_num);
      ret=read(fd, buf+size, sizeof(buf));
      //fprintf(stderr, "a:%s\n", buf);
      if(ret!=0){
	kakko_num+=count_kakko(buf+size, ret);
	size+=ret;
	if(kakko_num == 0){
	  break;
	}
      }}}
  //data�λ������
  if(buf[size-1] != '\0'){
    buf[size] = '\0';
    size += 1;
  }
  return size;


}

//buf����numʸ��ʬ�ɤ��()�ο��������
// ( �� -1, )�� +1 �Ȥ���
int count_kakko(char* bufp, int num){
  int i=0;
  int ret=0;
  for(i=0; i<num; i++){
    if(*bufp == '('){
      ret--;
    }else if(*bufp == ')'){
      ret++;
    }
    //fprintf(stderr, "%c", *bufp);
    bufp++;
  }
  return ret;
}
