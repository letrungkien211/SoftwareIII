#include "socket_functions.h"

/*
  =================================================
  IPアドレス表示
  正常終了:0   異常終了:-1
  =================================================
*/
int dispip(char* ipaddr) {
  char disp_ipaddr[4];
  memcpy(disp_ipaddr,ipaddr,4);
  printf("%u.%u.%u.%u\n",(u_char)disp_ipaddr[0],(u_char)disp_ipaddr[1],(u_char)disp_ipaddr[2],(u_char)disp_ipaddr[3]);
  return 0;
}

/* for server */
int startup_server_with_IP(char* hostname,ushort port_num,int *server_socket){
  int server_socket_listen;
  //  char    hostname[257];
  struct  hostent *myhost;
  struct  sockaddr_in server_saddr;
  struct  sockaddr_in client_saddr;
  socklen_t client_addrlen;
  int	s_retry_counter = 0;
  
  /*ソケットを作成*/
  server_socket_listen = socket(AF_INET, SOCK_STREAM,0);
  if(server_socket_listen< 0 ) {
    fprintf(stderr,"Socket for server failed.\n");
    return -1;
  }
  /*自ホスト名の取得*/
  /*
  bzero(hostname,257);
  gethostname(hostname,256);
  */
  /*自エントリの取得*/
  //if((myhost = gethostbyname(hostname)) == NULL) {
  if((myhost = gethostbyname(hostname)) == NULL) {
    fprintf(stderr,"bad hostname!\n");
    return -1;
  }
  /*自ホスト情報の表示*/
  printf("Hostname  = %s\n", myhost->h_name);
  printf("addrtype  = %d\n", myhost->h_addrtype);
  printf("length    = %d\n", myhost->h_length);
  printf("IP        = ");
  dispip(myhost->h_addr);
  /*自ホスト情報を構造体にセット*/
  server_saddr.sin_family  = AF_INET;
  server_saddr.sin_port    = htons(port_num);
  memcpy((char *)&server_saddr.sin_addr,myhost->h_addr,myhost->h_length); 
  /*BIND*/
  if (bind(server_socket_listen,(struct sockaddr*)&server_saddr, sizeof(server_saddr)) == -1) {
    fprintf(stderr, "Server could not bind.\n");
    return -1;
  }
  printf("Successfully bound in PORT %u.\n",port_num); 
  /*listen*/
  if ( (listen(server_socket_listen, 5)) == -1) {
    fprintf(stderr, "Listen failed.\n");
    return -1;
  }
  while (s_retry_counter<5) {
    /* acceptを試みる */
    client_addrlen=sizeof(client_saddr);
    *server_socket = accept(server_socket_listen, (struct sockaddr*)&client_saddr , &client_addrlen);
    
    /*失敗ならリトライ、それ以外は抜ける*/
    if (*server_socket == -1)
      s_retry_counter++;
    else 
      break;
    
    if (s_retry_counter<5) {
      /* リトライの前にしばし待つ */
      sleep(1);
    } 
  }
  /*  accept失敗  */
  if (*server_socket == -1) {
    fprintf(stderr,"Accept faild.\n");
    return -1;
  }
  else{
    /*相手の情報を表示*/
    printf("Connect from :");
    dispip((char*)&client_saddr.sin_addr);
  }
  close(server_socket_listen);
  return 1;
}

/* for server */
int startup_server(ushort port_num,int *server_socket){
  int server_socket_listen;
  char    hostname[257];
  struct  hostent *myhost;
  struct  sockaddr_in server_saddr;
  struct  sockaddr_in client_saddr;
  socklen_t client_addrlen;
  int	s_retry_counter = 0;
  
  /*ソケットを作成*/
  server_socket_listen = socket(AF_INET, SOCK_STREAM,0);
  if(server_socket_listen< 0 ) {
    fprintf(stderr,"Socket for server failed.\n");
    return -1;
  }
  /*自ホスト名の取得*/
  bzero(hostname,257);
  gethostname(hostname,256);
  /*自エントリの取得*/
  if((myhost = gethostbyname(hostname)) == NULL) {
    fprintf(stderr,"bad hostname!\n");
    return -1;
  }
  /*自ホスト情報の表示*/
  printf("Hostname  = %s\n", myhost->h_name);
  printf("addrtype  = %d\n", myhost->h_addrtype);
  printf("length    = %d\n", myhost->h_length);
  printf("IP        = ");
  dispip(myhost->h_addr);
  /*自ホスト情報を構造体にセット*/
  server_saddr.sin_family  = AF_INET;
  server_saddr.sin_port    = htons(port_num);
  memcpy((char *)&server_saddr.sin_addr,myhost->h_addr,myhost->h_length); 
  /*BIND*/
  if (bind(server_socket_listen,(struct sockaddr*)&server_saddr, sizeof(server_saddr)) == -1) {
    fprintf(stderr, "Server could not bind.\n");
    exit(-1);
  }
  printf("Successfully bound in PORT %u.\n",port_num); 
  /*listen*/
  if ( (listen(server_socket_listen, 5)) == -1) {
    fprintf(stderr, "Listen failed.\n");
    return -1;
  }
  while (s_retry_counter<5) {
    /* acceptを試みる */
    client_addrlen=sizeof(client_saddr);
    *server_socket = accept(server_socket_listen, (struct sockaddr*)&client_saddr , &client_addrlen);
    
    /*失敗ならリトライ、それ以外は抜ける*/
    if (*server_socket == -1)
      s_retry_counter++;
    else 
      break;
    
    if (s_retry_counter<5) {
      /* リトライの前にしばし待つ */
      sleep(1);
    } 
  }
  /*  accept失敗  */
  if (*server_socket == -1) {
    fprintf(stderr,"Accept faild.\n");
    return -1;
  }
  else{
    /*相手の情報を表示*/
    printf("Connect from :");
    dispip((char*)&client_saddr.sin_addr);
  }
  close(server_socket_listen);
  return 1;
}

void close_socket(int sock){
  /*ソケット切断*/
  close(sock);  
}

/* for client */

int startup_client(char *server_name,u_short port_num,int *client_socket){
  int i;
  const int REPETITION_COUNT = 5; //5回はport番号を変更してやりなおしてみる

  struct  hostent *connect_host;
  struct  sockaddr_in desthost;
  /*ソケットを作成*/
  *client_socket = socket(AF_INET, SOCK_STREAM,0);
  if (client_socket < 0){
    fprintf(stderr,"Socket for client failed.\n");
    return -1;
  }
  /*接続先ホストエントリ取得*/
  //connect_host = gethostbyname(server_name);
  connect_host = gethostbyname(server_name);
  if(connect_host == NULL){
    fprintf(stderr,"bad hostname!\n");
    return -1;
  }
  //
  /*コネクトできるまでportを変更してみる*/
  for(i=0; i<REPETITION_COUNT; i++){
    /*接続先情報をソケット型構造体にセット*/
    desthost.sin_family  = AF_INET;
    desthost.sin_port    = htons(port_num+i);
    memcpy((char *)&desthost.sin_addr,connect_host->h_addr,connect_host->h_length);
    if(connect(*client_socket,(struct sockaddr*)&desthost,sizeof(desthost))<0){
      if(i == REPETITION_COUNT){
	fprintf(stderr,"Connect failed.\n");
	return -1;
      }
    }else{
      break;
    }
  }
  fprintf(stderr, "Connect suceeded.\n");
  return 1;
}


