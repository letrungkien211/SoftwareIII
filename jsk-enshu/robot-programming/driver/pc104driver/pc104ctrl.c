/*
 * pc104ctrl.c
 * (original program was written by Harada sensei?)
 *
 * 2006/11/25 nishino
 */
#include <stdio.h>   /* perror, printf */
#include <stdlib.h>   /* exit */
#include <unistd.h> 
#include <fcntl.h>
#include "pc104ctrl.h"

int pc104_open() {
  int fd;
  fd=open("/dev/pc104",O_RDONLY);
  if(fd<0){
    perror("/dev/pc104");
    exit(1);
  }
  printf("pc104 opened.(fd=%d)\n",fd);
  return fd;
}

void pc104_close(int fd) {
  close(fd);
}
