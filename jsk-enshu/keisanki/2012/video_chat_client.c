//-----------------------------------------------------------------------------------
// vide_chat_client.c : �ӥǥ�����åȥץ����
//-----------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/socket.h>
#include <arpa/inet.h>

#include <pthread.h>

#include <GL/glut.h>

#include <cv.h>
#include <highgui.h>

#include "defs.h"

static int g_socket;

static pthread_t g_tr, g_ts;
static pthread_mutex_t g_mutex;
static int g_width=640, g_height=480, g_depth=8, g_nChannel=3;
static char g_image_buf[640*480*3];

GLuint g_texture;

//-----------------------------------------------------------------------------------
// socket_open
//-----------------------------------------------------------------------------------
void
socket_open (const char* ip_addr)
{
  struct sockaddr_in sin;

  // �����åȤ���������
  //---------------------------------------------------
  if ((g_socket = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
    perror("client: socket");
    exit(1);
  }

  // �����Фξ����Ϳ����
  //---------------------------------------------------
  sin.sin_family = AF_INET;  // ���ɥ쥹�η��λ���
  sin.sin_port = PORT;  // �ݡ����ֹ�
  sin.sin_addr.s_addr = inet_addr(ip_addr);  // ����Υ��ɥ쥹�λ��� IP���ɥ쥹��ʸ������Ѵ�

  // �����Ф���³����
  //---------------------------------------------------
  if ((connect(g_socket, (struct sockaddr *)&sin, sizeof(sin))) < 0) {
    perror("client: connect");
    exit(1);
  }
}

//-----------------------------------------------------------------------------------
// socket_close
//-----------------------------------------------------------------------------------
void
socket_close()
{
  close( g_socket );
}

//-----------------------------------------------------------------------------------
// socket_read
//-----------------------------------------------------------------------------------
int
socket_read( int socket, void* buf, int buf_size )
{
  int size;
  int left_size = buf_size;
  char* p = (char*) buf;

  // ���ꤵ�줿�������ΥХåե��������λ����ޤǡ�
  // �롼�פ��ɤ߹���³����
  //---------------------------------------------------
  while( left_size > 0 ) {
    size = read(socket, p, left_size);
    p += size;
    left_size -= size;

    if( size <= 0 ) break;
  }

  return buf_size - left_size;
}

//-----------------------------------------------------------------------------------
// socket_write
//-----------------------------------------------------------------------------------
int
socket_write( int socket, void* buf, int buf_size )
{
  int size;
  int left_size = buf_size;
  char* p = (char*) buf;

  // ���ꤵ�줿�������ΥХåե���������λ����ޤǡ�
  // �롼�פǽ񤭹���³����
  //---------------------------------------------------
  while( left_size > 0 ) {
    size = write(socket, p, left_size);
    p += size;
    left_size -= size;

    if( size <= 0 ) break;
  }

  return buf_size - left_size;
}

//-----------------------------------------------------------------------------------
// send_sock
//-----------------------------------------------------------------------------------
void*
thread_send(void *arg)
{
  char buf = {"0"};

  int size = strlen(buf)+1;
  socket_write( g_socket, &size, sizeof(int) );
  socket_write( g_socket, buf, size );

  return NULL;
}

//-----------------------------------------------------------------------------------
// recv_sock
//-----------------------------------------------------------------------------------
void*
thread_recv(void *arg)
{
  char buf[1024];
  int size;

  socket_read(g_socket, &g_width, sizeof(int) );
  socket_read(g_socket, &g_height, sizeof(int) );
  socket_read(g_socket, &g_depth, sizeof(int) );
  socket_read(g_socket, &g_nChannel, sizeof(int) );

  while(1){

    socket_read(g_socket, &size, sizeof(int));

    // ���ߡ��ǤϤʤ��Ȥ�
    if( size > 0 ) {
      socket_read(g_socket, buf, size );

      char insert_text[1024];
      sprintf( insert_text, "%s\n", buf);

    } else {
      socket_read(g_socket, g_image_buf, g_width*g_height*(g_depth/8)*g_nChannel);
      //image_buf, width*nChannel
    }
  }

  return NULL;
}

//-----------------------------------------------------------------------------------
// init
//-----------------------------------------------------------------------------------
void init(void)
{
    glClearColor (0.0, 0.0, 0.0, 0.0);
    glShadeModel (GL_FLAT);

    glGenTextures( 1, &g_texture );
    glBindTexture( GL_TEXTURE_2D, g_texture );
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST); 
}

//-----------------------------------------------------------------------------------
// display
//-----------------------------------------------------------------------------------
void display(void)
{
    glEnable(GL_DEPTH_TEST);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-10, 10, -10, 10, -10, 10);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glColor3ub(255,255,255);

    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, g_texture);

    glScalef(20,20,20);
    glTranslatef(-0.5f, -0.5f, 0.0f);
    glBegin(GL_QUADS);
    glTexCoord2f(0,1);    glVertex2f(0,0);
    glTexCoord2f(1,1);    glVertex2f(1,0);
    glTexCoord2f(1,0);    glVertex2f(1,1);
    glTexCoord2f(0,0);    glVertex2f(0,1);
    glEnd();

    glFlush();
    glFinish();
    glutSwapBuffers();
}

//-----------------------------------------------------------------------------------
// idle
//-----------------------------------------------------------------------------------
void idle()
{
    glTexImage2D( GL_TEXTURE_2D, 0, GL_RGB, g_width, g_height, 0,
		  GL_BGR, GL_UNSIGNED_BYTE, g_image_buf );

    glutPostRedisplay();
}

//-----------------------------------------------------------------------------------
// reshape
//-----------------------------------------------------------------------------------
void reshape (int w, int h)
{
    glViewport(0, 0, w, h);
}


//-----------------------------------------------------------------------------------
// keyboard
//-----------------------------------------------------------------------------------
/* ARGSUSED1 */
void keyboard(unsigned char key, int x, int y)
{
    switch (key) {
    case 27:
	socket_close();
	exit(0);
	break;
    }
}

//-----------------------------------------------------------------------------------
// main
//-----------------------------------------------------------------------------------
int
main(int argc, char *argv[])
{
  if(argc == 1){
    printf("usage: client <server IP address>\n");
    exit(1);
  }

  // GLUT�ν����
  //---------------------------------------------------
  glutInit(&argc, argv);
  glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
  glutInitWindowSize (680, 480);
  glutInitWindowPosition (100, 100);

  // �����С�����³
  //---------------------------------------------------
  socket_open( argv[1] );

  pthread_mutex_init( &g_mutex, NULL );
  pthread_create( &g_tr, NULL, thread_recv, NULL );

  // ������������ɥ�����
  //---------------------------------------------------
  glutCreateWindow (argv[0]);
  init();

  // GLUT�Υᥤ��롼��
  //---------------------------------------------------
  glutDisplayFunc(display);
  glutReshapeFunc(reshape);
  glutKeyboardFunc(keyboard);
  glutIdleFunc(idle);
  glutMainLoop();

  return 0;
}
