/*----------------------------------------------
    計算機演習 デバイス・プログラミング
             サンプルプログラム
  ----------------------------------------------*/

#define LENGTH 5		/* 再生する時間 (秒) */
#define RATE 44100		/* サンプリングレイト */
#define SIZE 16			/* サンプルサイズ */
#define CHANNELS 1		/* 1 = mono 2 = stereo */
#define BUFSIZE (SIZE*LENGTH*RATE*CHANNELS/8)

void sound_open();
void sound_close();
int sound_read(char *buf, int buf_size);
void sound_write(char *buf, int buf_size);
