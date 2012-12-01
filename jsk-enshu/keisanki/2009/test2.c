#include <stdio.h> 
#include <unistd.h> 

int main(int argc, char *argv[]) { 
  int option; 

  opterr = 0; 
  while( 1 ){ 
    option = getopt(argc, argv, "nv:q"); 
    if( option == -1 ) break; 

    switch( option ){ 
      case 'n' : printf("Option %c.\n", option ); break; 
      case 'v' : printf("Option %c with arg %s.\n", option, optarg ); break; 
      case '?' : printf("Unknown option '%c'\n", optopt ); break; 
    } 
    optarg = NULL; 
  } 
}
