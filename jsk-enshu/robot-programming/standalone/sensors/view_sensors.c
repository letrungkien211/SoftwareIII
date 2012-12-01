/**
 * view_sensors.c
 *
 * 2007/12/08 maki
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>    /* usleep */
#include <sys/select.h>
#include "bumper.h"
#include "psd.h"

int fd;

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

void read_and_print_sw(){
  unsigned int swaddr=0x80001;
  
  pc104_ioctl_mt(PC104_READ, &swaddr);

  fprintf(stderr,"RESET: ");
  if(!(swaddr&0x01)) fprintf(stderr,"Pressed\n"); else fprintf(stderr,"\n");
  fprintf(stderr,"PSW1: ");
  if(!(swaddr&0x02)) fprintf(stderr,"Pressed\n"); else fprintf(stderr,"\n");
  fprintf(stderr,"PSW2: ");
  if(!(swaddr&0x04)) fprintf(stderr,"Pressed\n"); else fprintf(stderr,"\n");
  fprintf(stderr,"PSW3: ");
  if(!(swaddr&0x08)) fprintf(stderr,"Pressed\n"); else fprintf(stderr,"\n");
}

int main(int argc, char *argv[]) {
  pc104_open_mt();
  while(1) {    
    read_bumper_mt();
    read_psd_mt();
    fprintf(stderr, "+++ bumper +++\n");
    print_bumper();
    fprintf(stderr, "+++ psd +++\n");
    print_psd();
    //fprintf(stderr, "+++ switch +++\n");
    //read_and_print_sw();
    if(keycheck()) break;
    usleep(100000);
  }
  return 0;
}
