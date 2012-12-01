#ifndef _VISIONLIB_H_
#define _VISIONLIB_H_

#include <stdio.h>
#include <cv.h>
#include <highgui.h>
#include <pthread.h>
/***** socket通信使うために必要なinclude, 定義 ****/
#include "socket_functions.h"
#include "multi_socket_functions.h"
/***** socket通信使うために必要なinclude, 定義(ここまで) ****/

#define DEFAULTPORT 9000
int client_sock;

#endif

