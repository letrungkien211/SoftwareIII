#include "read_robot_state.h"
#include "robot.h"
#include <sys/select.h> //for select
#include <string.h>     //for memcpy
#include <stdio.h>
#include <unistd.h>  //for read

//()の数があうまで読みつづけてbufに保存する
// 汚いから整理したいかも
int DataRead(int fd, char* buf){
  int size=0;
  int ret=0;
  int i;
  int kakko_pos = 0;
  int kakko_num=0;
  int kakko_flag = FALSE;
  char tmp_buf[MAXBUFSIZE];
  char* tmp_bufp = tmp_buf;

  //最初に(が見付かるまで待つ)
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
  
  //kakko_posのところまでのdataをコピーする
  tmp_bufp = tmp_buf;
  tmp_bufp += kakko_pos;
  size = size - kakko_pos;
  for(i=0; i<size; i++){
    *buf++ = *tmp_bufp++;
  }
  //ここまでのkakkoの数を数える
  kakko_num+=count_kakko(buf, size);
  //仮に読み込んだけど、kakkoの数が0ではない場合,
  //引続きデータを読込み、kakkoの数が0になるまで待機する
  //fprintf(stderr, "kakko_num is %d\n", kakko_num);
  if(!(size != 0 && kakko_num >= 0)){
    //fprintf(stderr, "hoge1\n");
    while(1){
      //とりあえず読めるだけ読み込む
      //fprintf(stderr, "hoge2\n");
      ret=read(fd, buf+size, sizeof(buf));
      if(ret!=0){
	kakko_num+=count_kakko(buf+size, ret);
	size+=ret;
	if(kakko_num == 0){
	  break;
	}
      }}}
  //dataの事後処理
  if(buf[size-1] != '\0'){
    buf[size] = '\0';
    size += 1;
  }
  return size;
}

//基本的にDataReadだが、timeoutを設定できる.
//timeoutした場合は、-1を返す
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

  //timeoutの設定
  tv.tv_sec = 0;
  tv.tv_usec = timeout*1000;
  //初期化
  FD_ZERO(&readfds);
  FD_SET(fd, &readfds);

  //最初に(が見付かるまで待つ)
  while(1){
    memcpy(&fds, &readfds, sizeof(fd_set));
    n = select(0, &fds, NULL,NULL,&tv);
    //timeoutした場合は0を返す
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
  
  //kakko_posのところまでのdataをコピーする
  tmp_bufp = tmp_buf;
  tmp_bufp += kakko_pos;
  size = size - kakko_pos;
  for(i=0; i<size; i++){
    *buf++ = *tmp_bufp++;
  }
  //ここまでのkakkoの数を数える
  kakko_num+=count_kakko(buf, size);
  //仮に読み込んだけど、kakkoの数が0ではない場合,
  //引続きデータを読込み、kakkoの数が0以上になるまで待機する
  if(!(size != 0 && kakko_num >= 0)){
    //fprintf(stderr, "hoge1\n");
    while(1){
      memcpy(&fds, &readfds, sizeof(fd_set));
      n = select(0, &fds, NULL,NULL,&tv);
      //timeoutした場合は0を返す
      if(n==0){
	fprintf(stderr, "read timeout2\n");
	return -1;
      }	
      //とりあえず読めるだけ読み込む
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
  //dataの事後処理
  if(buf[size-1] != '\0'){
    buf[size] = '\0';
    size += 1;
  }
  return size;


}

//bufからnum文字分読んで()の数を数える
// ( は -1, )は +1 とする
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
