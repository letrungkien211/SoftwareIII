#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
#include <linux/joystick.h>

#include "joy.h"

int fd;
unsigned char buttons = 2;
unsigned char axes = 2;
int button[1024];
int axis[1024];

bool joyInit (void *h) {
  if ( (fd = open("/dev/input/js0",O_RDONLY)) < 0 ) {
    return false;
  }

  char name[128];
  if (ioctl(fd, JSIOCGNAME(sizeof(name)), name) < 0)
    strncpy(name, "Unknown", sizeof(name));
  printf("Name: %s\n", name);

  ioctl(fd,JSIOCGBUTTONS,&buttons);
  ioctl(fd,JSIOCGAXES,&axes);
  printf("buttons = %d\n", buttons);
  printf("axes    = %d\n", axes);

  timeval tim;
  timeval *timeout = NULL;
  js_event js;
  fd_set fds; 
  
  FD_ZERO(&fds);
  FD_SET(fd,&fds);
  tim.tv_usec = 100000;
  tim.tv_sec = 0;

  if(select(fd + 1,&fds,NULL,NULL,&tim)){
    for (int i = 0; i < buttons+axes ; i ++ ) {
      read(fd,&js,sizeof(js));
    }
  }
  
  return true;
}

bool joyUpdate() {
  
  timeval tim;
  timeval *timeout = NULL;
  js_event js;
  fd_set fds; 
  
  FD_ZERO(&fds);
  FD_SET(fd,&fds);
  //tim.tv_usec = 100000;
  tim.tv_usec = 10000;
  tim.tv_sec = 0;
  while ( (select(fd + 1,&fds,NULL,NULL,&tim) ) ) {
    read(fd,&js,sizeof(js));
#if 0
    printf("js.type   = %8x, ", js.type);
    printf("js.number = %8d, ", js.number);   
    printf("js.value  = %8d\n", js.value);    
#endif
    switch (js.type ) {
    case JS_EVENT_BUTTON:
      button[js.number] = js.value;
      break;
    case JS_EVENT_AXIS:
      if (axes == 3 ) {
	axis[js.number+2] = js.value;
      }else{
	axis[js.number] = js.value;
      }
      break;
    }
    timeout = &tim; 
  }
  return true;
}

void joyQuit    () {
  joyUpdate();
  close(fd);
}

double	joyGetXPos () {return (double)(axis[0]/32767.0);}
double	joyGetYPos () {return (double)(axis[1]/32767.0);}
double	joyGetZPos () {return (double)(0);}
double	joyGetXRot () {return (double)(0);}
double	joyGetYRot () {return (double)(0);}
double	joyGetZRot () {return (double)(axis[4]/32767.0);}
double	joyGet0Sli () {return (double)(axis[5]/32767.0);}
double	joyGet1Sli () {return (double)(0);}
int	joyGetPOV (int i) {
  int r;
  if ( axis[2] == 0 && axis[3] == 0 ) return -1;
  if ( axis[2] == 0 && axis[3] <  0 ) r = 0;
  if ( axis[2] >  0 && axis[3] <  0 ) r = 1;
  if ( axis[2] >  0 && axis[3] == 0 ) r = 2;
  if ( axis[2] >  0 && axis[3] >  0 ) r = 3;
  if ( axis[2] == 0 && axis[3] >  0 ) r = 4;
  if ( axis[2] <  0 && axis[3] >  0 ) r = 5;
  if ( axis[2] <  0 && axis[3] == 0 ) r = 6;
  if ( axis[2] <  0 && axis[3] <  0 ) r = 7;
  return r*4500;
}

int	joyGetButtons (int i) {return (int)(button[i]);}
double	joyGetAxis (int i) {return (double)(axis[i]/32767.0);}

bool	joyForces()	{}
bool	joyRumbleMagnitude(int lMagnitude)	{}
bool	joyRumbleEnvelope(int lMagnitude, double attack, double fade, double duration)	{}

