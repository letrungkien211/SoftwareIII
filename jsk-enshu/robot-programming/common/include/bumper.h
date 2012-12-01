/**
 * bumper.h
 *
 * 2007/12/07 maki
 */

#ifndef __BUMPER_H__
#define __BUMPER_H__

#include "stdio.h"
#include "sensor.h"
#define BUMPER_NUM 6
/* ここから個別設定? */
#define BUMPER_LEFT_R 0
#define BUMPER_LEFT_L 1
#define BUMPER_REAR_R 2
#define BUMPER_REAR_L 3
#define BUMPER_RIGHT_R 4
#define BUMPER_RIGHT_L 5

struct bumper_data {
  int id;
  enum eLOCATION location; /* 二個で1セットのバンパーの取付位置（アームが前で台車から見て左右後）  */
  enum eLOCATION lr; /* 1セットのバンパー内での左右の位置（台車から見て左右） */
  unsigned int data;
};

int is_pressed(unsigned int b);
void print_bumper();
int get_bumper_index_by_id(int id);
void read_bumper(int fd);
void read_bumper_mt();
extern struct bumper_data bumpers[];
#endif
