/*---------------------------------------------------
  socket_functions.h:
  ソケット通信のライブラリ
  2003.11.13 created by Takashi FUJIMOTO
  2003.11.15 modifyed by Takashi FUJIMOTO
  2003.11.15 modifyed by T. Harada
  --------------------------------------------------*/
#ifndef SOCKET_FUNCTIONS_H_INCLUDED_
#define SOCKET_FUNCTIONS_H_INCLUDED_

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <sys/wait.h>

extern void close_socket(int sock);
//for client
extern int startup_client(char *server_name,unsigned short port_num,int *client_socket);
//for server
extern int startup_server_with_IP(char* server_name,unsigned short port_num,int *server_socket);
//for server
extern int startup_server(unsigned short port_num,int *server_socket);

#endif




