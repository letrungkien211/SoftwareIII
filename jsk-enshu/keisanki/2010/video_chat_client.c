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

#include <gtk/gtk.h>

#include <cv.h>
#include <highgui.h>

#include "defs.h"

static int g_socket;

static pthread_t g_tr, g_ts;
static pthread_mutex_t g_mutex;

enum{
  STATE_IDLE,
  STATE_SEND
};

static int g_state = STATE_IDLE;

// GTK Widgets
GtkWidget *window;
GtkWidget *mainbox;

GtkWidget *entry_box;
GtkWidget *entry_msg;
GtkWidget *button_send;

GtkWidget *label_state;

GtkTextBuffer *text_buf;
GtkWidget *text_view;
GtkWidget *image_view;

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
  char *buf;

  gdk_threads_enter();
  buf = (char*) gtk_entry_get_text( GTK_ENTRY( entry_msg ) );
  gdk_threads_leave();

  int size = strlen(buf)+1;
  socket_write( g_socket, &size, sizeof(int) );
  socket_write( g_socket, buf, size );

  gdk_threads_enter();
  gtk_entry_set_text( GTK_ENTRY( entry_msg ), (gchar*) "" );
  gdk_flush();
  gdk_threads_leave();

  g_state = STATE_IDLE;

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
  int width, height, depth, nChannel;

  socket_read(g_socket, &width, sizeof(int) );
  socket_read(g_socket, &height, sizeof(int) );
  socket_read(g_socket, &depth, sizeof(int) );
  socket_read(g_socket, &nChannel, sizeof(int) );
  IplImage *frame = cvCreateImage(cvSize(width,height), depth, nChannel);

  while(1){

    socket_read(g_socket, &size, sizeof(int));

    // ���ߡ��ǤϤʤ��Ȥ�
    if( size > 0 ) {
      socket_read(g_socket, buf, size );

      char insert_text[1024];
      sprintf( insert_text, "%s\n", buf);

      gdk_threads_enter();
      GtkTextIter itr;
      gtk_text_buffer_get_end_iter( text_buf, &itr );
      gtk_text_buffer_insert( text_buf, &itr, insert_text, strlen(insert_text) );
      gdk_flush();
      gdk_threads_leave();
    } else {
      int x, y;
      char image_buf[width*height*nChannel];
      //fprintf(stderr, "get = %d / %d %d %d %d\n", width*height*(depth/8)*nChannel, width, height , depth, nChannel);
      socket_read(g_socket, frame->imageData, width*height*(depth/8)*nChannel);
      for(y=0;y<height;y++){
        for(x=0;x<width;x++){
          image_buf[(y*width+x)*3+2] = frame->imageData[(y*width+x)*3+0];
          image_buf[(y*width+x)*3+1] = frame->imageData[(y*width+x)*3+1];
          image_buf[(y*width+x)*3+0] = frame->imageData[(y*width+x)*3+2];
        }
      }
      gdk_threads_enter();
      gdk_draw_rgb_image(image_view->window,
                         image_view->style->fg_gc[GTK_STATE_NORMAL],
                         0, 0, width, height,
                         GDK_RGB_DITHER_NONE,
                         image_buf, width*nChannel);
      gdk_flush();
      gdk_threads_leave();
    }
  }

  return NULL;
}

//-----------------------------------------------------------------------------------
// on_button_send_pressed
//-----------------------------------------------------------------------------------
void
on_button_send_pressed(GtkWidget *widget,
		       gpointer data)
{
  switch(g_state) {
  case STATE_IDLE:
    pthread_create( &g_ts, NULL, thread_send, NULL );
    g_state = STATE_SEND;
    break;

  default:
    break;
  }

}

//-----------------------------------------------------------------------------------
// delete_event
//-----------------------------------------------------------------------------------
gint
delete_event( GtkWidget *widget,
	      GdkEvent  *event,
	      gpointer   data )
{
  //g_print("delete event occurred\n");
  return(FALSE);
}

//-----------------------------------------------------------------------------------
// destroy
//-----------------------------------------------------------------------------------
void
destroy( GtkWidget *widget, gpointer   data )
{
  gtk_main_quit();
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

  // GTK�ν����
  //---------------------------------------------------
  g_thread_init(NULL);
  gdk_threads_init();

  gtk_init(&argc, &argv);

  // ������������ɥ�����
  //---------------------------------------------------
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);

  // ������ɥ��� "delete_event" �����ʥ뤬����줿��(������̾
  // ������ɥ��͡����㤫�� "close" ���ץ����䥿���ȥ�С�������
  // ��ä�������)�������������ؿ� delete_event() ��ƽФ��褦��
  // ���ꤹ�롣������Хå��ؿ��ؤΥǡ����� NULL �ǡ�������Хå�
  // �ؿ���Ǥϻ��Ѥ��Ƥ��ʤ�
  //---------------------------------------------------
  gtk_signal_connect(GTK_OBJECT(window), "delete_event",
		     GTK_SIGNAL_FUNC(delete_event), NULL);

  // �����Ǥ� "destroy" ���٥�Ȥ򥷥��ʥ�ϥ�ɥ����³���롣
  // ���Υ��٥�Ȥϡ����Υ�����ɥ��ˤ����� gtk_widget_destroy() ��
  // �ƽФ�����"delete_event" ������Хå��� FALSE ���֤���ȯ������
  //---------------------------------------------------
  gtk_signal_connect(GTK_OBJECT(window), "destroy",
		     GTK_SIGNAL_FUNC(destroy), NULL);

  // ������ɥ��Υܡ������������ꤹ��
  //---------------------------------------------------
  gtk_container_set_border_width(GTK_CONTAINER(window), 10);

  // �������ѥå��󥰥ܥå����κ����ȥᥤ�󥦥���ɥ��ؤ�����
  //---------------------------------------------------
  mainbox = gtk_vbox_new( FALSE, 2 );
  entry_box = gtk_hbox_new( FALSE, 2 );

  // �ᥤ��ܥå�������ꤹ��
  //---------------------------------------------------
  gtk_container_add(GTK_CONTAINER(window), mainbox);

  // entry�ܥå����κ���
  //---------------------------------------------------
  entry_msg = gtk_entry_new_with_max_length( 256 );

  // button send������
  //---------------------------------------------------
  button_send = gtk_button_new_with_label("Send");
  gtk_signal_connect(GTK_OBJECT(button_send), "clicked",
		     GTK_SIGNAL_FUNC(on_button_send_pressed),
		     NULL );

  // label_state������
  //---------------------------------------------------
  label_state = gtk_label_new("state: Idle");

  // text view������
  //---------------------------------------------------
  text_view = gtk_text_view_new ();
  text_buf = gtk_text_view_get_buffer( (GtkTextView*) text_view );
  gtk_text_view_set_editable( (GtkTextView*) text_view, FALSE );

  // image_box������
  image_view = gtk_drawing_area_new();
  gtk_drawing_area_size(GTK_DRAWING_AREA(image_view),640, 480);

  // �ѥå�������
  //---------------------------------------------------
  // entry_box������
  gtk_box_pack_start(GTK_BOX(entry_box), entry_msg,
		     TRUE, TRUE, 1);

  gtk_box_pack_start(GTK_BOX(entry_box), button_send,
		     TRUE, TRUE, 1);

  //image_box �Υѥå������� mainbox������
  gtk_box_pack_start(GTK_BOX(mainbox), image_view,
  		     TRUE, TRUE, 1);

  //text view�Υѥå������� mainbox������
  gtk_box_pack_start(GTK_BOX(mainbox), text_view,
  		     TRUE, TRUE, 1);

  //entry_box�Υѥå������� mainbox������
  gtk_box_pack_start(GTK_BOX(mainbox), entry_box,
		     TRUE, TRUE, 1);

  gtk_widget_show_all(window);

  // �����С�����³
  //---------------------------------------------------
  socket_open( argv[1] );

  pthread_mutex_init( &g_mutex, NULL );
  pthread_create( &g_tr, NULL, thread_recv, NULL );

  // gtk�Υᥤ��롼��
  //---------------------------------------------------
  gdk_threads_enter();
  gtk_main();
  gdk_threads_leave();
}

