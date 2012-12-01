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
short buf[BUFSIZE / sizeof(short)];

int main()
{
    FILE *fp_file;		/* ファイル書き込み用ファイルポインタ */
    int count;

  /****************************/
    /*  音声ファイルの読み込み  */
  /****************************/

    /* ファイルを読みこみ専用でオープンする */
    fp_file = fopen("test.raw", "rb");
    if (fp_file == NULL) {	/* エラー処理 */
	perror("file open failed");
	return 1;
    }

    /* 音声データを読みこむ */
    count = fread(buf, sizeof(short), BUFSIZE / sizeof(short), fp_file);
    if (count != BUFSIZE / sizeof(short)) {	/* エラー処理 */
	fprintf(stderr,
		"read count = %d, BUFSIZE = %d, sizeof(buf) = %d\n", count,
		BUFSIZE, BUFSIZE / sizeof(short));
    }

    /* ファイルをクローズする */
    fclose(fp_file);


    /* 音声出力 */
    sound_open();
    sound_write((char *) buf, count);
    sound_close();

    return 1;
}
