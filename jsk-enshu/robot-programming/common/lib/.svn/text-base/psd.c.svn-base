/**
 * psd.c
 *
 * 2007/12/08 maki
 */

#include "psd.h"

struct psd_data psds[PSD_NUM] = {
  {PSD_RIGHT, RIGHT, PSD_RIGHT},
  {PSD_LEFT, LEFT, PSD_LEFT},
  {PSD_REAR, REAR, PSD_REAR},
};

void print_psd () {
  int i;
  for (i = 0; i < PSD_NUM; i++) {
    fprintf(stderr, "psd_%s(%d) -> %d\n", 
	    location_name[psds[i].location], 
	    psds[i].id,
	    psds[i].data);
  }
  fprintf(stderr, "\n");
}

void read_psd(int fd) {
  int i;
  for (i = 0; i < PSD_NUM; i++) {
    /*     if (psds[i].id != 2) { */
    psds[i].data = psds[i].id;
    if (ioctl(fd, PC104_READ_PSD, &psds[i].data) < 0) { /* read psd data */
      perror("read_psd_error");
    }
    /*     } else { */
    /*       psds[i].data = 11; */
    /*       if (ioctl(fd, PC104_READ_AD, &psds[i].data) < 0) { /\* read ad data *\/ */
    /* 	perror("read_ad_error"); */
    /*       } */
    /*     } */
  }
}

void read_psd_mt() {
  int i;
  for (i = 0; i < PSD_NUM; i++) {
    /*     if (psds[i].id != 2) { */
    psds[i].data = psds[i].id;
    pc104_ioctl_mt(PC104_READ_PSD, &psds[i].data);
    /*   } else { */
    /*     psds[i].data = 11; */
    /*     pc104_ioctl_mt(PC104_READ_AD, &psds[i].data); */
    /*   } */
  }
}

int get_psd_index_by_id(int id) {
  int i;
  for (i = 0; i < PSD_NUM; i++) {
    if (id == psds[i].id) return i;
  }
  return -1;
}
