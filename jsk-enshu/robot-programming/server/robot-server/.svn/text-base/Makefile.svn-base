TOP = ../..
include ${TOP}/common/Makefile.gen
 
CFLAGS += -g -I$(COMMON_INCLUDE_DIR) -I$(PC104_INCLUDE_DIR)
LDFLAGS += -g
LIBS = -lm -lpthread

OBJS = $(DRIVER_OBJS) $(WHEEL_OBJS) $(SERVO_OBJS) $(SENSOR_OBJS)\
       $(SOCKET_SH_OBJS) $(ROBOT_OBJS) $(WHEEL_KINEMATICS_OBJS)
TARGETS = robot-server

all: $(TARGETS)

robot-server: robot-server.o $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(LIBS) -o $@  $^ 
robot-server.o: robot-server.c
	$(CC) $(CFLAGS) -o $@ -c $^ $(INCLUDE)

#shへcopy 毎回パスワードを聞かれるのが嫌だな
copy: $(TARGETS)
	scp $^ root@$(DAISYA_IP):~/bin/
clean:
	rm -f *.o *~ $(TARGETS)
