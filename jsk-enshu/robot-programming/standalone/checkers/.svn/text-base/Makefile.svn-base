TOP = ../..
include ${TOP}/common/Makefile.gen
 
CFLAGS += -g -I$(COMMON_INCLUDE_DIR) -I$(PC104_INCLUDE_DIR)
LDFLAGS += -g
LIBS = -lm -lpthread

OBJS = $(DRIVER_OBJS)
OBJS_FILES = $(DRIVER_FILES)

TARGETS = wheels_checker view_sensors arm_test

all: objs $(TARGETS)

#Linkして実行ファイルを生成
wheels_checker: wheels_checker.o $(OBJS) $(WHEEL_OBJS)
	$(CC) $(LDFLAGS) $(LIBS) $^ -o $@ 
view_sensors: view_sensors.o $(OBJS) $(SENSOR_OBJS)
	$(CC) $(LDFLAGS) $^ -o $@
arm_test: arm_test.o $(OBJS) $(SERVO_OBJS)
	$(CC) $^ -o $@ $(LIBS)

#objectファイルの生成
wheels_checker.o: wheels_checker.c
view_sensors.o: view_sensors.c
arm_test.o: arm_test.c
arm_kinematics.o: arm_kinematics.c

objs: $(OBJS_FILES)
	(cd $(TOP)/common/lib; make)

#shへcopy 毎回パスワードを聞かれるのが嫌だな
copy: $(TARGETS)
	scp $^ root@$(DAISYA_IP):~/bin/
clean:
	rm -f *.o *~ $(TARGETS)
