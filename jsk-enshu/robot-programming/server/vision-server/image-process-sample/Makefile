TOP=../../..
include $(TOP)/common/Makefile.gen
OPT  =	-lcv -lcxcore -lhighgui -lpthread
TARGETS = imagetest_from_bmp imagetest_from_bmp2 imagetest_from_bmp3 imagetest_from_camera

all: $(TARGETS)

imagetest_from_bmp: imagetest_from_bmp.c
	$(PC_CC) $(OPENCV_INC) $(OPENCV_LIBDIR) -o $@ $^ $(OPT)
imagetest_from_bmp2: imagetest_from_bmp2.c
	$(PC_CC) $(OPENCV_INC) $(OPENCV_LIBDIR) -o $@ $^ $(OPT)
imagetest_from_bmp3: imagetest_from_bmp3.c
	$(PC_CC) $(OPENCV_INC) $(OPENCV_LIBDIR) -o $@ $^ $(OPT)
imagetest_from_camera: imagetest_from_camera.c
	$(PC_CC) $(OPENCV_INC) $(OPENCV_LIBDIR) -o $@ $^ $(OPT)
clean:
	@rm -f *~ *.o $(TARGETS)
