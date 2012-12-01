TOP = ../..
include ${TOP}/common/Makefile.gen
 
CFLAGS += -g -I$(COMMON_INCLUDE_DIR) -I$(PC104_INCLUDE_DIR)
LDFLAGS += -g
LIBS = -lm -lpthread

OBJS = $(DRIVER_OBJS) $(SENSOR_OBJS)
OBJS_FILES = $(DRIVER_FILES) $(SENSOR_FILES)
TARGETS = view_sensors

all: objs $(TARGETS)

view_sensors: view_sensors.o $(OBJS)
	$(CC) $(LDFLAGS) $^ -o $@
view_sensors.o: view_sensors.c

objs: $(OBJS_FILES)
	(cd $(TOP)/common/lib; make)

#shへcopy 毎回パスワードを聞かれるのが嫌だな
copy: $(TARGETS)
	scp $^ root@$(DAISYA_IP):~/bin/
clean:
	rm -f *.o *~ $(TARGETS)
