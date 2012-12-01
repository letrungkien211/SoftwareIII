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

    /* 音声入力 */
    sound_open();
    fprintf(stderr, ";; Start recording\n");

    count = sound_read((char *) buf, BUFSIZE);
    fprintf(stderr, ";; %d byte are recorded\n", count);

    sound_close();

  /****************************/
    /*  音声ファイルの書き出し  */
  /****************************/

    /* ファイルを書きだし専用でオープンする */
    fp_file = fopen("test.raw", "wb");
    if (fp_file == NULL) {	/* エラー処理 */
	perror("file open failed");
	return 1;
    }

    /* 音声データを書き込む */
    count = fwrite(buf, sizeof(short), BUFSIZE / sizeof(short), fp_file);
    if (count != BUFSIZE / sizeof(short)) {	/* エラー処理 */
	fprintf(stderr,
		"read count = %d, BUFSIZE = %d, sizeof(buf) = %d\n", count,
		BUFSIZE, BUFSIZE / sizeof(short));
    }

    /* ファイルをクローズする */
    fclose(fp_file);


    return 1;
}
