TOP = ../..
include ${TOP}/common/Makefile.gen
 
CFLAGS += -I$(COMMON_INCLUDE_DIR) -I$(PC104_INCLUDE_DIR)
LIBS = -lm -lpthread

OBJS = arm_kinematics.o $(DRIVER_OBJS) $(SERVO_OBJS)
OBJS_FILES = $(DRIVER_FILES) $(SERVO_FILES)
INCS = arm_kinematics.h

TARGETS = servo_test arm_sample1 arm_sample2 arm_sample4

all: objs $(TARGETS)

servo_test: servo_test.o $(OBJS) 
	$(CC) $(CFLAGS) $^ -o $@ $(LIBS)
arm_sample1: arm_sample1.o $(OBJS)  
	$(CC) $(CFALGS) $^ -o $@  $(LIBS)
arm_sample2: arm_sample2.o $(OBJS) 
	$(CC) $(CFLAGS) $^ -o $@ $(LIBS)
arm_sample4: arm_sample4.o $(OBJS) $(SENSOR_OBJS)
	$(CC) $(CFLAGS) $^ -o $@ $(LIBS)

arm_sample1.o: arm_sample1.c $(INCS) 
arm_sample2.o: arm_sample2.c $(INCS) 
arm_sample4.o: arm_sample4.c $(INCS)
arm_kinematics.o: arm_kinematics.c $(INCS)
servo_test.o: servo_test.c $(INCS)

objs: $(OBJS_FILES)
	(cd $(TOP)/common/lib; make)

#shへcopy 毎回パスワードを聞かれるのが嫌だな
copy: $(TARGETS)
	scp $^ root@$(DAISYA_IP):~/bin/
clean:
	rm -f *.o *~ $(TARGETS)
