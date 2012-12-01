#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include "socketlib.h"

int socket_list[16];
int client_num = 0;

//-----------------------------------------------------------------------------------
// socket_connect
//-----------------------------------------------------------------------------------
int
socket_connect (const char *ip_addr, const int ip_port)
{
  struct sockaddr_in sin;
  int s;

  // ソケットを生成する
  //---------------------------------------------------
  if ((s = socket (AF_INET, SOCK_STREAM, 0)) < 0)
    {
      perror ("client: socket");
      exit (1);
    }

  // サーバの情報を与える
  //---------------------------------------------------
  sin.sin_family = AF_INET;	// アドレスの型の指定
  sin.sin_port = htons (ip_port);	// ポート番号
  sin.sin_addr.s_addr = inet_addr (ip_addr);	// 宛先のアドレスの指定 IPアドレスの文字列を変換

  // サーバに接続する
  //---------------------------------------------------
  if ((connect (s, (struct sockaddr *) &sin, sizeof (sin))) < 0)
    {
      perror ("client: connect");
      exit (1);
    }

  return s;
}

//-----------------------------------------------------------------------------------
// signal_handler
//-----------------------------------------------------------------------------------
void
sigint_handler (int signum)
{
  int i;

  fprintf (stderr, "sigint _handler(%d)\n", signum);
  for (i = 0; i < client_num; i++)
    {
      fprintf (stderr, "closing %d\n", socket_list[i]);
      close (socket_list[i]);
    }
  exit (1);
}


//-----------------------------------------------------------------------------------
// socket_listen
//-----------------------------------------------------------------------------------
int
socket_listen (const int ip_port)
{
  int s, retry = 0;
  struct sockaddr_in sin;
  struct sigaction sa_sigint;

  // 
  memset (&sa_sigint, 0, sizeof (sa_sigint));
  sa_sigint.sa_handler = sigint_handler;
  sa_sigint.sa_flags = SA_RESTART;
  if (sigaction (SIGINT, &sa_sigint, NULL) < 0)
    {
      perror ("sigaction");
      exit (1);
    }

  // ソケットの生成
  //---------------------------------------------------
  if ((s = socket (AF_INET, SOCK_STREAM, 0)) < 0)
    {
      perror ("server: socket");
      exit (1);
    }

  memset ((char *) &sin, 0, sizeof (struct sockaddr));
  sin.sin_family = AF_INET;	// アドレスの型の指定
  sin.sin_port = htons (ip_port);	// ポート番号
  sin.sin_addr.s_addr = htonl (INADDR_ANY);	// 待ち受けのIPアドレスの設定 

  /* ソケットにパラメータを与える */
  while ((bind (s, (struct sockaddr *) &sin, sizeof (sin))) < 0)
    {
      perror ("server: bind, but force try to open");
      // http://www.kt.rim.or.jp/~ksk/sock-faq/unix-socket-faq-ja-4.html#ss4.5
      int one = 1;
      setsockopt (s, SOL_SOCKET, SO_REUSEADDR, &one, sizeof (int));

      if (retry++ > 1)
	{
	  perror ("server: bind");
	  exit (1);
	}
    }

  // クライアントの接続を待つ
  //---------------------------------------------------
  if ((listen (s, 10)) < 0)
    {
      perror ("server: listen");
      exit (1);
    }

  printf ("waiting for connection\n");

  return s;
}

//-----------------------------------------------------------------------------------
// socket_close
//-----------------------------------------------------------------------------------
void
socket_close (int socket)
{
  close (socket);
}

//-----------------------------------------------------------------------------------
// socket_read
//-----------------------------------------------------------------------------------
int
socket_read (int socket, void *buf, int buf_size)
{
  int size;
  int left_size = buf_size;
  char *p = (char *) buf;

  memset (buf, 0, buf_size);
  // 指定されたサイズのバッファを受信完了するまで、
  // ループで読み込み続ける
  //---------------------------------------------------
  while (left_size > 0)
    {
      size = read (socket, p, left_size);
      p += size;
      left_size -= size;

      if (size == 0)
	{
	  socket_close (socket);
	}
      else if (size < 0)
	{
	  break;
	}
    }

  return buf_size - left_size;
}

//-----------------------------------------------------------------------------------
// socket_write
//-----------------------------------------------------------------------------------
int
socket_write (int socket, void *buf, int buf_size)
{
  int size;
  int left_size = buf_size;
  char *p = (char *) buf;

  // 指定されたサイズのバッファを送信完了するまで、
  // ループで書き込み続ける
  //---------------------------------------------------
  while (left_size > 0)
    {
      size = write (socket, p, left_size);
      p += size;
      left_size -= size;

      if (size <= 0)
	break;
    }

  return buf_size - left_size;
}
