TOP=$(shell pwd)/../..
include $(TOP)/common/Makefile.gen

INCLUDE = -I$(TOP)/common/include/opencv -I$(COMMON_INCLUDE_DIR)
LIBS = -L$(TOP)/common/lib/opencv21-lib -lcv -lhighgui -lcxcore

OBJS = $(SOCKET_SH_OBJS)
TARGETS = vision-server vision-server2 vision-server3 jpgvision-server

all: $(TARGETS)

vision-server: vision-server.o $(OBJS)
	$(CC) -o $@  $^  $(LIBS)
vision-server.o: vision-server.c
	$(CC) -o $@ -c $^ $(INCLUDE)

vision-server2: vision-server2.o $(OBJS)
	$(CC) -o $@  $^ $(LIBS)
vision-server2.o: vision-server2.c
	$(CC) -o $@ -c $^ $(INCLUDE)

vision-server3: vision-server3.o $(OBJS)
	$(CC) -o $@  $^ $(LIBS)
vision-server3.o: vision-server3.c
	$(CC) -o $@ -c $^ $(INCLUDE)

jpgvision-server: jpgvision-server.o $(OBJS)
	$(CC) -o $@  $^ $(LIBS)
jpgvision-server.o: jpgvision-server.c
	$(CC) -o $@ -c $^ $(INCLUDE)

cog: cog.o
	$(CC) -o $@  $^ $(LIBS)
cog.o: cog.c
	$(CC) -o $@ -c $^ $(INCLUDE)

#shへcopy 毎回パスワードを聞かれるのが嫌だな
copy: $(TARGETS)
	scp $^ root@$(DAISYA_IP):~/bin/
clean:
	@rm -f *~ *.o $(TARGETS)

#update cross-compiler
update-cross-compiler:
	sudo rm -f /usr/bin/sh4-linux-gcc
	sudo ln -s $(TOP)/common/bin/sh4-unknown-linux-gnu-gcc /usr/bin/sh4-linux-gcc