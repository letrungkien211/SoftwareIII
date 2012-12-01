#ifndef _SOCKETLIB_H_
#define _SOCKETLIB_H_

extern int socket_list[];
extern int client_num;

int socket_connect(const char *ip_addr, const int ip_port);
int socket_listen(const int ip_port);
void socket_close(int socket);
int socket_read(int socket, void *buf, int buf_size);
int socket_write(int socket, void *buf, int buf_size);

#endif				// _SOCKETLIB_H_
