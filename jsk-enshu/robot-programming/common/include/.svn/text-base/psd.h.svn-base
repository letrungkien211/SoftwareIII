/**
 * psd.h
 *
 * 2007/12/07 maki
 */

#ifndef __PSD_H__
#define __PSD_H__

#include "stdio.h"
#include "sensor.h"
#define PSD_NUM 3
/* ここから個別設定? */
#define PSD_RIGHT 0
#define PSD_LEFT 1
#define PSD_REAR 2

struct psd_data {
  int id;
  enum eLOCATION location;
  unsigned int data;
};

void print_psd();
void read_psd(int fd);
void read_psd_mt();
int get_psd_index_by_id(int id);
extern struct psd_data psds[];
#endif
