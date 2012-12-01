/*---------------------------------------------------
  socket_functions.h:
  複数ソケット通信のライブラリ

   threadによる待ちうけ等を行う
  --------------------------------------------------*/
#ifndef MULTI_SOCKET_FUNCTIONS_H_INCLUDED_
#define MULTI_SOCKET_FUNCTIONS_H_INCLUDED_

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <sys/wait.h>
#include <errno.h>
#include <pthread.h>

typedef struct{
  int		type;
  int		fd;
  char		*prompt;
  pthread_t	thr;
  int		errct;
  int		reqct;
} client;

/* socket */
#define QUERY_IO	9
#define MAX_SOCKET	10
#define	SOCKET_ERROR	(-1)
#define	MAX_ERRCT	(60*50)	/* 60 seconds */
#define BUF_SIZE	(9192)

#ifndef MAXTHREAD
#define MAXTHREAD 64
#endif

extern client sockets[MAX_SOCKET];
extern void start_reader(int fd, int type, int threaded);
extern void *acceptor(void *arg);

extern int interpreter(char *line);

int init_socket(char *host, u_short port, struct sockaddr_in *sa_in);
int init_socket_server(char *hostname, int *port);
void *socket_reader(void *arg);
int WriteMessageToThePrivateSocket(char *str, int size);
int get_socket_fd(void);

#endif //MULTI_SOCKET_FUNCTIONS_H_INCLUDED_
