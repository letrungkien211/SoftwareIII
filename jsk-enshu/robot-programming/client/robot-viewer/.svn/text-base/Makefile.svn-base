TOP = ../..
include ${TOP}/common/Makefile.gen
 
PC_CFLAGS += -g -I$(COMMON_INCLUDE_DIR) -I$(PC104_INCLUDE_DIR) -DHOSTIP=\"$(DAISYA_IP)\"
# 
LIBS = -lcurses -ltermcap -lreadline -lpthread

OBJS = robot-viewer.o screen.o viewarrange.o $(SOCKET_PC_OBJS) $(ROBOT_PC_OBJS)
TARGETS = robot-viewer

all: $(TARGETS)

robot-viewer:$(OBJS)
	$(PC_CC) $(PC_CFLAGS) $(LIBS) -o $@ $^
robot-viewer.o: robot-viewer.c
	$(PC_CC) $(PC_CFLAGS) -o $@ -c $^ 
screen.o: screen.c
	$(PC_CC) -w -o $@ -c $^ 
viewarrange.o: viewarrange.c
	$(PC_CC) $(PC_CFLAGS) -o $@ -c $^
clean:
	rm -f *.o *~ $(TARGETS)
