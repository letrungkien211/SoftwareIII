/*
 * pc104ctrl.c
 * (original program was written by Harada sensei?)
 *
 * 2006/11/25 nishino
 * 2007/12/3 yoshikai
 */
#include <stdio.h>   /* perror, printf */
#include <stdlib.h>   /* exit */
#include <unistd.h> 
#include <fcntl.h>
#include <pthread.h>
#include "pc104ctrl_mt.h"

static pthread_mutex_t pc104_mutex;
static int mt_fd=-1;

int pc104_open_mt() {
  mt_fd=open("/dev/pc104",O_RDONLY);
  if(mt_fd<0){
    perror("/dev/pc104");
    exit(1);
  }
  pthread_mutex_init( &pc104_mutex, NULL );
  printf("pc104 opened.(fd=%d)\n",mt_fd);
  return mt_fd;
}

int pc104_close_mt() {
  return close(mt_fd);
}

int pc104_ioctl_mt(int request, void *value) {
  int result;
  pthread_mutex_lock( &pc104_mutex );
  if ((result=ioctl(mt_fd, request, value)) < 0) {
    perror("pc104 ioctrl");
  }
  pthread_mutex_unlock( &pc104_mutex );
  return result;
}
