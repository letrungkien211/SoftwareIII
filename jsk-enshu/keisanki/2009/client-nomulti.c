//-----------------------------------------------------------------------------------
// client.cpp
//-----------------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "socketlib.h"

#define BUFSIZE 1024
#define PORT 1080

// main
//-----------------------------------------------------------------------------------
int main(int argc, char *argv[])
{
    int sock, size, ret;
    char buf[BUFSIZE];

    if (argc == 1) {
	printf("usage: client <server IP address>\n");
	exit(1);
    }

    sock = socket_connect(argv[1], PORT);

    // メインループ
    //---------------------------------------------------
    do {
	/* キー入力 */
	fgets(buf, 256, stdin);
	size = strlen(buf);

	/* Serverへ送信 */
	fprintf(stdout, "sending  :[%d] (%d)%s", sock, size, buf);
	write(sock, buf, size);

	/* Serverから受信 */
	ret = read(sock, buf, BUFSIZE);
	fprintf(stdout, "received :[%d] (%d)%s", sock, ret, buf);
    }
    while (ret > 0);

    socket_close(sock);

    exit(0);
}
