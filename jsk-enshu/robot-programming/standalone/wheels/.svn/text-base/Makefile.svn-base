TOP = ../..
include ${TOP}/common/Makefile.gen
 
CFLAGS += -g -I$(COMMON_INCLUDE_DIR) -I$(PC104_INCLUDE_DIR)
LDFLAGS += -g
LIBS = -lm -lpthread

OBJS = $(DRIVER_OBJS) $(WHEEL_OBJS)
OBJS_FILES = $(DRIVER_FILES) $(WHEELS_FILES)
TARGETS = wheels_sample1 wheels_sample2 wheels_sample3 bumper_sample wheels_sample4

all: objs $(TARGETS)

wheels_sample1: wheels_sample1.o $(OBJS)
	$(CC) $(LDFLAGS) $(LIBS) $^ -o $@
wheels_sample2: wheels_sample2.o $(OBJS)
	$(CC) $(LDFLAGS) $(LIBS)  $^ -o $@
wheels_sample3: wheels_sample3.o $(OBJS) $(WHEEL_KINEMATICS_OBJS)
	$(CC) $(LDFLAGS) $(LIBS)  $^ -o $@
wheels_sample4: wheels_sample4.o $(OBJS) $(WHEEL_KINEMATICS_OBJS)
	$(CC) $(LDFLAGS) $(LIBS)  $^ -o $@
bumper_sample: bumper_sample.o $(OBJS) $(SENSOR_OBJS) $(WHEEL_KINEMATICS_OBJS)
	$(CC) $(LDFLAGS) $(LIBS) $^ -o $@

wheels_sample1.o: wheels_sample1.c
wheels_sample2.o: wheels_sample2.c
wheels_sample3.o: wheels_sample3.c
wheels_sample4.o: wheels_sample4.c
bumper_sample.o: bumper_sample.c
#
objs: $(OBJS_FILES)
	(cd $(TOP)/common/lib; make)

#shへcopy 毎回パスワードを聞かれるのが嫌だな
copy: $(TARGETS)
	scp $^ root@$(DAISYA_IP):~/bin/
clean:
	rm -f *.o *~ $(TARGETS)
