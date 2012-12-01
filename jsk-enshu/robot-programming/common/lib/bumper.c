/**
 * bumper.c
 *
 * 2007/12/07 maki
 */

#include "bumper.h"

struct bumper_data bumpers[BUMPER_NUM] = {
  {BUMPER_LEFT_R, LEFT, RIGHT, BUMPER_LEFT_R},
  {BUMPER_LEFT_L, LEFT, LEFT, BUMPER_LEFT_L},
  {BUMPER_REAR_R, REAR, RIGHT, BUMPER_REAR_R},
  {BUMPER_REAR_L, REAR, LEFT, BUMPER_REAR_L},
  {BUMPER_RIGHT_R, RIGHT, RIGHT, BUMPER_RIGHT_R},
  {BUMPER_RIGHT_L, RIGHT, LEFT, BUMPER_RIGHT_L},
};

int is_pressed(unsigned int b) {
  return (b == 0 ? 1 : 0);
}

void read_bumper(int fd) {
  int i;
  for (i = 0; i < BUMPER_NUM; i++) {
    bumpers[i].data = bumpers[i].id;
    if (ioctl(fd, PC104_READ_BMP, &bumpers[i].data) < 0) { /* read bumper data */
      perror("read_bmp_error");
    }
  }
}

void read_bumper_mt() {
  int i;
  for (i = 0; i < BUMPER_NUM; i++) {
    bumpers[i].data = bumpers[i].id;
    pc104_ioctl_mt(PC104_READ_BMP, &bumpers[i].data);
  }
}

void print_bumper () {
  int i;
  for (i = 0; i < BUMPER_NUM; i++) {
    fprintf(stderr, "bumper_%s_%s(%d) -> %s\n", 
	    location_name[bumpers[i].location], 
	    location_name[bumpers[i].lr],
	    bumpers[i].id,
	    is_pressed(bumpers[i].data) ? "pressed" : "");
  }
  fprintf(stderr, "\n");
}

int get_bumper_index_by_id(int id) {
  int i;
  for (i = 0; i < BUMPER_NUM; i++) {
    if (id == bumpers[i].id) return i;
  }
  return -1;
}
