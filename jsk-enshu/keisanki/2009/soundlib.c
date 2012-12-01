/*----------------------------------------------
    計算機演習 デバイス・プログラミング
             サンプルプログラム
  ----------------------------------------------*/

#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <stdlib.h>
#include <stdio.h>
#include <linux/soundcard.h>

#include "soundlib.h"

int fd_audio;			/* 音声デバイス用ファイルディスクリプタ */

void sound_open()
{

    /* サウンドデバイスのオープン */
    if ((fd_audio = open("/dev/audio", O_RDWR)) <= 0) {	/* エラー処理 */
	perror("open of /dev/audio failed");
	exit(-1);
    }

  /****************************/
    /*    パラメータの設定      */
  /****************************/
    int fmt = AFMT_S16_LE;
    int freq = RATE;
    int channels = CHANNELS;

    /* サウンドフォーマットを設定する */
    if (ioctl(fd_audio, SOUND_PCM_SETFMT, &fmt) == -1) {
	perror("SOUND_PCM_SETFMT ioctl failed");
	exit(-1);
    }

    /* ステレオかモノラルを設定する */
    if (ioctl(fd_audio, SOUND_PCM_WRITE_CHANNELS, &channels) == -1) {
	perror("SOUND_PCM_WRITE_CHANNELS ioctl failed");
	exit(-1);
    }

    /* サンプリングレイトを設定する */
    if (ioctl(fd_audio, SOUND_PCM_WRITE_RATE, &freq) == -1) {
	perror("SOUND_PCM_WRITE_RATE ioctl failed");
	exit(-1);
    }

}

void sound_close()
{
    /* サウンドデバイスのクローズ */
    if (close(fd_audio) < 0) {	/* エラー処理 */
	perror("close of /dev/audio failed");
	exit(-1);
    }
}

int sound_read(char *buf, int buf_size)
{
    int count;
    if ((count = read(fd_audio, buf, buf_size)) == -1) {	/* エラー処理 */
	perror("read");
	exit(-1);
    }
    return count;
}


void sound_write(char *buf, int buf_size)
{
    if (write(fd_audio, buf, buf_size) == -1) {	/* エラー処理 */
	perror("write");
	exit(-1);
    }
}
