/*
 * calib_servo.c
 *
 * 2006/11/25 nishino
 */
#include <stdio.h>
#include <stdlib.h> /* exit system */
#include <string.h>
#include <sys/ioctl.h> /* ioctl */

#include "../pc104driver/pc104ctrl_mt.h"
#include "servo_mt.h"
#include "arm_kinematics.h"

#define LINE_BUF 256
#define MAX_ARGS 16
#define	FALSE    (0)
#define	TRUE     (!(FALSE))

struct command {
  char *command_name;
  int (*func)(int, char *[]);
};

int parse_line(char *line, char *argv[]);
int command_axis(int argc, char *argv[]);
int command_pulse(int argc, char *argv[]);
int command_angle(int argc, char *argv[]);
int command_angles(int argc, char *argv[]);
int command_calib(int argc, char *argv[]);
int command_max(int argc, char *argv[]);
int command_min(int argc, char *argv[]);
int command_neutral(int argc, char *argv[]);
int command_p(int argc, char *argv[]);
int command_m(int argc, char *argv[]);
int command_reset(int argc, char *argv[]);
int command_save(int argc, char *argv[]);
int command_load(int argc, char *argv[]);
int command_fk(int argc, char *argv[]);
int command_ik(int argc, char *argv[]);
int command_setport(int argc, char *argv[]);

struct command command_list[] =
  {{"axis", &command_axis},
   {"pls", &command_pulse}, 
   {"ang", &command_angle}, 
   {"calib", &command_calib}, 
   {"max", &command_max}, 
   {"min", &command_min}, 
   {"neutral", &command_neutral}, 
   {"p", &command_p}, 
   {"m", &command_m},
   {"save", &command_save}, 
   {"load", &command_load},
   {"reset", &command_reset}, 
   {"angles", &command_angles},
   {"ik", &command_ik}, 
   {"fk", &command_fk},
   {"set-port", &command_setport}
  };

struct servo_param servos[SERVO_NUM];
int axis = 0;

int main(int argc, char *argv[]) {
  char command_line[LINE_BUF];
  int i;
  int agc;
  char *agv[MAX_ARGS];
  // initialize
  pc104_open_mt();
  for(i = 0; i < SERVO_NUM; i++) {
    servos[i].pulse = 0;
    servos[i].port = i;
  }
  while(1) {
    set_servo_output_mt(servos);
    fprintf(stderr, ">");
    fgets(command_line, sizeof(command_line), stdin);
    /* parse line */
    agc = parse_line(command_line, agv);
    /* execute command */
    if (agc > 0) {
      if (strcmp(agv[0], "exit") == 0) break;
      for(i =  sizeof(command_list) / sizeof(struct command) - 1; i >=0 ; i--) {
	if (strcmp(agv[0], command_list[i].command_name) == 0) {
	  (command_list[i].func)(agc, agv);
	  break;
	}
      }
      if (i < 0) system(command_line);
    }
  }
  servo_power_off_mt(servos);
  pc104_close_mt();
  return 0;
}
/* select axis (0 - SERVO_NUM-1) */
int command_axis(int argc, char *argv[]) {
  if (argc > 1) sscanf(argv[1], "%d", &axis);
  if (axis < 0) axis = 0;
  else if(axis >= SERVO_NUM) axis = SERVO_NUM - 1;
  printf("axis = %d\n", axis);
  return TRUE;
}
/* set servo pulse */
int command_pulse(int argc, char *argv[]) {
  int pulse;
  if (argc > 1) {
    sscanf(argv[1], "%d", &pulse);
    set_servo_pulse(&servos[axis], pulse);
  }
  printf("axis=%d: angle=%f, pulse = %d\n", axis, servos[axis].angle, servos[axis].pulse);
  return TRUE;
}
/* set servo angle(degree) */
int command_angle(int argc, char *argv[]) {
  float angle;
  int set_axis = axis;
  if (argc == 1) angle = servos[axis].angle; else sscanf(argv[1], "%f", &angle);
  if (argc > 2) sscanf(argv[2], "%d", &set_axis);
  if (set_axis < 0) set_axis = 0; else if (set_axis >= SERVO_NUM) set_axis = SERVO_NUM -1;
  set_servo_angle(&servos[set_axis], angle);
  printf("axis=%d: angle=%f, pulse = %d\n", 
	 set_axis, servos[set_axis].angle, servos[set_axis].pulse);
  return TRUE;
}
/* set servo angles(degree) */
int command_angles(int argc, char *argv[]) {
  float angle;
  int ch;
  if (argc > 1) {
    for (ch = 0; ch < (argc - 1) && ch < SERVO_NUM; ch ++) {
      sscanf(argv[ch+1], "%f", &angle);
      set_servo_angle(&servos[ch], angle);
    }
  }
  else {
    for (ch = 0; ch < SERVO_NUM; ch ++) printf("%f ", servos[ch].angle);
    printf("\n");
  }
  return TRUE;
}
/* set pulse_offset & pulse_per_angle */
int command_calib(int argc, char *argv[]) {
  int pulses[2];
  float angles[2];
  if (argc >= 5) {
    sscanf(argv[1], "%d", &pulses[0]);
    sscanf(argv[2], "%f", &angles[0]);
    sscanf(argv[3], "%d", &pulses[1]);
    sscanf(argv[4], "%f", &angles[1]);
    if (angles[0] != angles[1]) {
      servos[axis].pulse_per_angle = (pulses[1] - pulses[0]) / (angles[1] - angles[0]);
      servos[axis].pulse_offset = 
	(pulses[0]*angles[1] - pulses[1]*angles[0]) / (angles[1] - angles[0]);
      printf("axis=%d: pulse_offset=%d pulse/angle=%f\n", 
	     axis, servos[axis].pulse_offset,servos[axis].pulse_per_angle);
    }
  }
  else {
    printf("calib pulse0 angle0 pulse1 angle1\n");
  }
  return TRUE;
}
/* set servo max angle(degree) */
int command_max(int argc, char *argv[]) {
  if (argc > 1) sscanf(argv[1], "%f", &servos[axis].max_angle);
  printf("axis=%d: max_angle = %f\n", axis, servos[axis].max_angle);
  return TRUE;
}
/* set servo min angle(degree) */
int command_min(int argc, char *argv[]) {
  if (argc > 1) sscanf(argv[1], "%f", &servos[axis].min_angle);
  printf("axis=%d: min_angle = %f\n", axis, servos[axis].min_angle);
  return TRUE;
}
/* set servo neutral angle(degree) */
int command_neutral(int argc, char *argv[]) {
  if (argc > 1) sscanf(argv[1], "%f", &servos[axis].neutral_angle);
  printf("axis=%d: neutral_angle = %f\n", axis, servos[axis].neutral_angle);
  return TRUE;
}
/* plus servo pulse */
int command_p(int argc, char *argv[]) {
  int val = 1;
  if (argc > 1) sscanf(argv[1], "%d", &val);
  set_servo_pulse(&servos[axis], servos[axis].pulse + val);
  printf("axis=%d: angle=%f, pulse = %d\n", axis, servos[axis].angle, servos[axis].pulse);
  return TRUE;
}
/* minus servo pulse */
int command_m(int argc, char *argv[]) {
  int val = 1;
  if (argc > 1) sscanf(argv[1], "%d", &val);
  set_servo_pulse(&servos[axis], servos[axis].pulse - val);
  printf("axis=%d: angle=%f, pulse = %d\n", axis, servos[axis].angle, servos[axis].pulse);
  return TRUE;
}
/* save parameters */
int command_save(int argc, char *argv[]) {
  if (argc > 1) {
    if (save_servo_parameters(argv[1], servos)) {
      printf("saved to %s\n", argv[1]);
    }
  }
  else printf("save filename\n");
  return TRUE;
}
/* load parameters */
int command_load(int argc, char *argv[]) {
  if (argc > 1) {
    if (load_servo_parameters(argv[1], servos)) {
      printf("loaded to %s\n", argv[1]);
    }
  }
  else printf("load filename\n");
  return TRUE;
}
/* reset */
int command_reset(int argc, char *argv[]) {
  reset_all_servos(servos);
  return TRUE;
}
/* forward kinematics */
int command_fk(int argc, char *argv[]) {
  float angles[3], position[3];
  int i;
  for(i = 0; i < 3; i ++) angles[i] = servos[i].angle;
  if (forward_kinematics_by_geometry(angles, position)) {
    printf("current position is (%f, %f, %f)\n", position[0], position[1], position[2]);
    printf("current angle is (%f, %f, %f, %f, %f)\n",
	   servos[0].angle, servos[1].angle, angles[2], angles[1], angles[0]);
  }
  return TRUE;
}
/* inverse kinematics */
int command_ik(int argc, char *argv[]) {
  float angles[2][3], position[3];
  int i, j, result;
  if (argc > 3) {
    for(i = 0; i < 3; i ++) sscanf(argv[i+1], "%f", &position[i]);
    if ((result = inverse_kinematics_by_geometry(position, angles)) > 0) {
      printf("inverse kinematics is succeeded.\n");
      for (j = 0; j < result; j++) {
	printf("th0=%f th1=%f th2=%f)\n", angles[j][0], angles[j][1], angles[j][2]);
      }
      for(i = 0; i < 3; i ++) set_servo_angle(&servos[i], angles[0][i]);
    }
  }
  else {
    printf("ik x y z\n");
  }
  return TRUE;
}
/* set servo port */
int command_setport(int argc, char *argv[]) {
  int jno, pno;
  if (argc!=3) {
    int i;
    for (i=0; i<SERVO_NUM; i++) {
      printf("servos[%d].port=%d\n", i, servos[i].port);
    }
    printf("To set: set-port joint-no port-no\n");
    return FALSE;
  }
  sscanf(argv[1], "%d", &jno);
  sscanf(argv[2], "%d", &pno);
  set_servo_port(&servos[jno], pno);
  return TRUE;
}

/* parse line */
int parse_line(char *line, char *argv[]) {
  int argc = 0;
  char *p = line;
  while(1) {
    while(*p == ' ') p++;
    argv[argc] = p;
    while(!(*p == ' ' || *p == '\0' || *p == '\n')) p++;
    if (p != argv[argc]) argc++;
    if (*p != ' ' || argc >= MAX_ARGS) break;
    *p = '\0'; p++;
  }
  *p = '\0';
  return argc;
}
