//-----------------------------------------------------------------------------------
// server.cpp
//-----------------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <pthread.h>
#include <sys/types.h>
#include <sys/socket.h>

#include "socketlib.h"

#define TRUE 1
#define FALSE 0

static pthread_mutex_t g_mutex;

//-----------------------------------------------------------------------------------
// thread_comm�����饤����Ȥ��Ȥ�����������å�
//-----------------------------------------------------------------------------------
void *
thread_comm (void *arg)
{
  /* pthread_create(&thread, NULL, comm, (void*)&ns); �Ǻ�����������å�
     ���顢�ƤӽФ���� */
  int s = *(int *) arg;
  int i, size;
  char buf[1024];

  fprintf (stderr, "Starting thrread for socket : %d\n", s);
  pthread_detach (pthread_self ());

  pthread_mutex_lock (&g_mutex);
  {
    socket_list[client_num] = s;
    client_num++;
  }
  pthread_mutex_unlock (&g_mutex);

  while (1)
    {
      if (socket_read (s, &size, sizeof (int)) < 0)
	break;

      if (size > 0)
	{

	  pthread_mutex_lock (&g_mutex);
	  {
	    /*ô�����륯�饤����Ȥ���������� */
	    socket_read (s, buf, size);

	    fprintf (stdout, "received :[%d] (%d)%s", s, size, buf);
	    /*���ƤΥ��饤����Ȥ˼����ǡ����������� */
	    for (i = 0; i < client_num; i++)
	      {
		socket_write (socket_list[i], &size, sizeof (int));
		socket_write (socket_list[i], buf, size);
	      }
	  }
	  pthread_mutex_unlock (&g_mutex);
	}

    }

  fprintf (stderr, "Exiting thread for socket : %d\n", s);
  return NULL;
}

//-----------------------------------------------------------------------------------
// thread_idle�������ɥ��
//-----------------------------------------------------------------------------------
void *
thread_idle (void *arg)
{
  int size = 0;

  pthread_detach (pthread_self ());

  while (1)
    {
      int i;

      // ���٤Ƥ���³��Υ��饤����ȤإХåե�������
      //---------------------------------------------------
      pthread_mutex_lock (&g_mutex);
      {
	for (i = 0; i < client_num; i++)
	  {
	    socket_write (socket_list[i], &size, sizeof (int));
	  }
      }
      pthread_mutex_unlock (&g_mutex);

      usleep (1000000);

    }

  return NULL;
}

//-----------------------------------------------------------------------------------
// main
//-----------------------------------------------------------------------------------
int
main ()
{
  int s, ns;
  pthread_t thread1, thread2;

  s = socket_listen (1024);

  // thread_idle�ʥ����ɥ�����ѤΥ���åɤ����
  pthread_create (&thread1, NULL, thread_idle, NULL);

  // ���饤����Ȥ������³����С�����åɤ���������
  //---------------------------------------------------
  while (1)
    {
      if ((ns = accept (s, NULL, 0)) < 0)
	{
	  perror ("server: accept");
	  continue;
	}

      printf ("Connected : %d\n", ns);
      //comm�ѤΥ���åɤ���������
      pthread_create (&thread2, NULL, thread_comm, (void *) &ns);
    }

  exit (1);
}
