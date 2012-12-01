# JSK標準環境だと/usr/include/opencvが既にあったので、彼らにもこれを配るのが正解かなあ
#
TOP = ../..
include $(TOP)/common/Makefile.gen

PC_CFLAGS += -g -I$(COMMON_INCLUDE_DIR) -I$(PC104_INCLUDE_DIR) -DHOSTIP=\"$(DAISYA_IP)\"

OPT  =	-lcv -lcxcore -lhighgui -lpthread
#for ROS-OpenCV 2.3
OPT  =
OBJS = $(SOCKET_PC_OBJS) facedetect.o cog_eus.o

all: vision-viewer jpgvision-viewer visionlib.so

vision-viewer: vision-viewer.o  visionlib.so
	$(PC_CC) $^ $(OPENCV_LIB) $(OPT) -o $@
	ln -fs ../eus-client/haarcascade_frontalface_alt.xml haarcascade_frontalface_alt.xml

jpgvision-viewer: jpgvision-viewer.o  visionlib.so
	$(PC_CC) $^ $(OPENCV_LIB) $(OPT) -o $@
	ln -fs ../eus-client/haarcascade_frontalface_alt.xml haarcascade_frontalface_alt.xml

.c.o:
	$(PC_CC) -w $(PC_CFLAGS) -c $^ $(OPENCV_INC)

visionlib.so: visionlib.o $(OBJS)
	$(PC_CC) -shared $^ $(OPENCV_LIB) $(OPT) -o $@

clean:
	rm -f *~ *.o vision-viewer *.exe *.so
