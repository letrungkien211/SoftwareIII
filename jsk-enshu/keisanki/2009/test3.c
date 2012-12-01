#include <stdio.h> 
#include <unistd.h> 
#include <getopt.h>

int main(int argc, char *argv[]) { 
  int option; 

  static struct option long_options[] = {
    {"null", no_argument, NULL, 'n'},
    {"value", required_argument, NULL, 'v'},
    {0, 0, 0, 0}};

  while( 1 ){ 
    int index;
    option = getopt_long(argc, argv, "nv:q", long_options, &index); 

    if( option == -1 ) break; 
    switch( option ){ 
      case 'n' : printf("Option %c.\n", option ); break; 
      case 'v' : printf("Option %c with arg %s.\n", option, optarg ); break; 
      case '?' : printf("Unknown option '%c'\n", optopt ); break; 
    } 
    optarg = NULL; 
  } 
}
 
