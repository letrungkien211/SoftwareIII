#include "multi_socket_functions.h"
#include "robot.h"
#include "interpreter.h"

static int stdin_read_loop = 1;

//ソケット通信のための初期設定
int init_socket(char *host, u_short port, struct sockaddr_in *sa_in)
{
    register int	sock;
    //struct hostent	*host_ent;

    if ((sock = socket(PF_INET, SOCK_STREAM, 0)) < 0)
	perror("init_socket: socket"), exit(1);

    sa_in->sin_addr.s_addr = htonl(INADDR_ANY);
    sa_in->sin_family = AF_INET;
    sa_in->sin_port = htons(port);
    return sock;
}

//ソケット通信のための初期設定
int init_socket_server(char *hostname, int *port)
{
    int s;
    u_short tmp = *port, max_portno = *port + 20;
    struct sockaddr_in sa_in;

    while (1) {
	s = init_socket(hostname, tmp, &sa_in);
	if (++tmp > max_portno)
	    fprintf(stderr, "server: Can't bind.\n"), exit(1);
	if (bind(s, (struct sockaddr *)&sa_in, sizeof(sa_in)) >= 0)
	    break;
	else if (errno != EADDRINUSE)
	  fprintf(stderr, "bind: errno = %d\n",errno),
	  perror("init_socket: bind"), exit(1);
    }
    
    *port = --tmp;
    fprintf(stderr, "init_socket_server: Port %d\n", *port);

    if (listen(s, 5)<0){
	perror("server: listen");
	exit(1);
    }
    return(s);
}

//clientとの接続待ちうけを行う。
// 接続が確認されたらstart_readerでsocket_reader(受信関数)を立ち上げる
// これをthreadで立ち上げておけば、不特定多数のclientと通信をすることが可能となる
void *acceptor(void *arg)
{
    int sport=(int)arg;
    int ns,typeid_=0;
    socklen_t fromlen=sizeof(struct sockaddr_in);
    struct sockaddr_in fsin;
    char client_type[128];
    while(1){
	if ((ns = accept(sport, (struct sockaddr *)&fsin, &fromlen))<0){
	    perror("server: accept");
	    exit(1);
	}
	typeid_ = QUERY_IO;
	printf("client_type=%s(%d)\n", client_type, typeid_);
	fflush(stdout);
	start_reader(ns, typeid_, TRUE);
    }
}


//clientとのsocket通信(受信)を行うためのthreadを立ち上げる
void start_reader(int fd, int type, int threaded)
{
    int i;
    for (i=0; i<MAX_SOCKET; i++){
	if (sockets[i].type == 0) break;
    }
    sockets[i].fd = fd;
    sockets[i].type = type;
    sockets[i].errct = 0;
    
    fprintf(stderr, "No.:%2d, reader started: ID:%d, socket:%d\n",i, type, fd);
    fflush(stderr);
    if (threaded){
      if(pthread_create(&sockets[i].thr, NULL, socket_reader, (void *)(sockets+i)))
	fprintf(stderr, "thr_create(socket_reader) failed.\n");
    }else{
      socket_reader(sockets+i);
    }
}

//socket clientからのコマンドを受信して読込む
// 一行読込むと解釈を interpreter関数に渡す
// なお、interpreter関数を始めとする文字列解釈関数はinterpreter.cに記述しておく
void *socket_reader(void *arg)
{
    int 	ret,i;
    client	*sock=(client *)arg;
    char	buf[BUF_SIZE],form[BUF_SIZE],prompt_string[128];
    char 	*form_ptr=buf,*buf_ptr=buf;

    if (sock->fd ==0){
	sprintf(prompt_string, "%s> ", sock->prompt);
    }
    while (stdin_read_loop){
	if (sock->fd == 0){
	    fprintf(stderr, "%s", prompt_string);
	    fflush(stderr);
	}
	//fprintf(stderr, "before read\n");
	ret=read(sock->fd, buf_ptr, sizeof(buf)-(buf-buf_ptr));
	//fprintf(stderr, "after read %d\n", ret);
	if (ret == 0 || ret == -1) {
	    close (sock->fd);
	    sock->type=0;
	    break;
	} else {
	  /* remove 0x0d character */
	  for (i=0;i<ret;i++) {
	    if (*buf_ptr==0x0d) *buf_ptr=' ';
	    buf_ptr++;
	  }
	  *buf_ptr='\0';
	  while (form_ptr != buf_ptr){
	    form_ptr = read_form(form_ptr, form);
	    if (strlen(form) == 0) break;
	    //fprintf(stderr, "form %s\n", form);
	    interpreter(form);
	  }
	  form_ptr = buf_ptr = buf;
	}
    }
    fprintf(stderr, "End of reading socket(%d)\n", sock->fd);
    return (NULL);
}

//関数が呼ばれたthreadが担当しているsocketに対してメッセージを返す
// strからsize分だけを送信する
int WriteMessageToThePrivateSocket(char *str, int size){
  int fd=get_socket_fd();
  if (fd!=-1) {
    //fprintf(stderr, "Socket success\n");
    write(fd, str, size);
    return fd;
  }
  else {
    fprintf(stderr, "Socket error\n");
    fputs(str, stderr);
    return STDERR_FILENO;
  }
}

//threadのIDを調べて、このthreadが担当するsocket通信のfdを調べて返す
int get_socket_fd(void) {
  int i;
  pthread_t me = pthread_self();
  for (i=0; i<MAX_SOCKET; i++){
    if(pthread_equal(sockets[i].thr, me))
      return sockets[i].fd;
  }
  return (-1);
}

