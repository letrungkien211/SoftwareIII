main(int argc, char* argv[]) {
  int i;
  printf("%d arg(s) exists\n", argc - 1);
  for(i=0; i<argc; i++) {
    printf("argv[%d] is \"%s\".\n", i, argv[i]);
  }
} 
