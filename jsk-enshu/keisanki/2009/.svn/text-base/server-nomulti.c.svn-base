//-----------------------------------------------------------------------------------
// server.cpp
//-----------------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/types.h>
#include <sys/socket.h>

#include "socketlib.h"

#define BUFSIZE 1024
#define PORT 1080


//-----------------------------------------------------------------------------------
// main
//-----------------------------------------------------------------------------------
int main()
{
    int sock, ns, ret;
    char buf[BUFSIZE];

    sock = socket_listen(PORT);


    // acecptを使いクライアントからの接続をまつ 
    //---------------------------------------------------
    for (;;) {
	if ((ns = accept(sock, NULL, NULL)) < 0) {
	    perror("server: accept");
	    continue;
	}

	fprintf(stderr, "Connected : %d\n", ns);

	do {
	    /* クライアントから受信する */
	    ret = read(ns, buf, BUFSIZE);
	    buf[ret] = '\0';
	    fprintf(stderr, "received :[%d] (%d)%s", ns, ret, buf);

	    /* クライアントへ送信する */
	    fprintf(stderr, "sending  :[%d] (%d)%s", ns, ret, buf);
	    ret = write(ns, &buf, ret);
	}
	while (ret > 0);

	fprintf(stderr, "\nDisconnected : %d\n", ns);

    }

    socket_close(sock);

    exit(1);
}
