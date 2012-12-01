/*----------------------------------------------
    �׻����齬 �ǥХ������ץ���ߥ�
             ����ץ�ץ����
  ----------------------------------------------*/

#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <stdlib.h>
#include <stdio.h>
#include <linux/soundcard.h>

#include "soundlib.h"

int fd_audio;			/* �����ǥХ����ѥե�����ǥ�������ץ� */

void sound_open()
{

    /* ������ɥǥХ����Υ����ץ� */
    if ((fd_audio = open("/dev/audio", O_RDWR)) <= 0) {	/* ���顼���� */
	perror("open of /dev/audio failed");
	exit(-1);
    }

  /****************************/
    /*    �ѥ�᡼��������      */
  /****************************/
    int fmt = AFMT_S16_LE;
    int freq = RATE;
    int channels = CHANNELS;

    /* ������ɥե����ޥåȤ����ꤹ�� */
    if (ioctl(fd_audio, SOUND_PCM_SETFMT, &fmt) == -1) {
	perror("SOUND_PCM_SETFMT ioctl failed");
	exit(-1);
    }

    /* ���ƥ쥪����Υ������ꤹ�� */
    if (ioctl(fd_audio, SOUND_PCM_WRITE_CHANNELS, &channels) == -1) {
	perror("SOUND_PCM_WRITE_CHANNELS ioctl failed");
	exit(-1);
    }

    /* ����ץ�󥰥쥤�Ȥ����ꤹ�� */
    if (ioctl(fd_audio, SOUND_PCM_WRITE_RATE, &freq) == -1) {
	perror("SOUND_PCM_WRITE_RATE ioctl failed");
	exit(-1);
    }

}

void sound_close()
{
    /* ������ɥǥХ����Υ����� */
    if (close(fd_audio) < 0) {	/* ���顼���� */
	perror("close of /dev/audio failed");
	exit(-1);
    }
}

int sound_read(char *buf, int buf_size)
{
    int count;
    if ((count = read(fd_audio, buf, buf_size)) == -1) {	/* ���顼���� */
	perror("read");
	exit(-1);
    }
    return count;
}


void sound_write(char *buf, int buf_size)
{
    if (write(fd_audio, buf, buf_size) == -1) {	/* ���顼���� */
	perror("write");
	exit(-1);
    }
}
