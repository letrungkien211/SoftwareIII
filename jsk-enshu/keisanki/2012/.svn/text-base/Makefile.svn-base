ARCH=	$(shell uname | cut -d'_' -f1)

TARGET = sample1 sample2 sample3 sample4 sample5 sample6 sample7 sample8 capture video_chat_server video_chat_client

ifeq ($(ARCH), CYGWIN)
LATEX=	platex
BIBTEX=	jbibtex
XDVI=	cygstart
else
LATEX=	platex
BIBTEX=	jbibtex
XDVI=	xpdf
endif

all: ${TARGET}
tex: 20120516-opencv.pdf  20120517-system.pdf

%.dvi: %.tex
	(cd fig; ebb ./*)
	$(LATEX) $*
	$(LATEX) $*
	grep War $*.log | cat
%.pdf: %.dvi
	dvipdfmx $<

.c.o:
	${CC} -c ${CFLAGS} $<

clean:
	rm -fr ${TARGET} *.o *.bb *.aux *.log *.out fig/*.bb *~

#OPENCV_CFLAGS = `pkg-config opencv-2.3.1 --cflags`
#OPENCV_LIBS   = `pkg-config opencv-2.3.1 --libs`
OPENCV_CFLAGS = `pkg-config opencv --cflags`
OPENCV_LIBS   = `pkg-config opencv --libs`
GLUT_CFLAGS = `pkg-config gl --cflags` `pkg-config glu --cflags`
GLUT_LIBS   = `pkg-config gl --libs` `pkg-config glu --libs` -lglut
 
sample1: sample1.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
sample2: sample2.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
sample3: sample3.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
sample4: sample4.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
sample5: sample5.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
sample6: sample6.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
sample7: sample7.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
sample8: sample8.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
video_chat_server: video_chat_server.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS}
video_chat_client: video_chat_client.c
	gcc -o $@ $< ${OPENCV_CFLAGS} ${OPENCV_LIBS} ${GLUT_CFLAGS} ${GLUT_LIBS}
capture: capture.c
	gcc -o $@ $<

tgz: *.c Makefile.*
	(cd ../../; tar -cvzf keisanki/2012/keisanki-opencv-2012.tgz keisanki/2012/*.c keisanki/2012/*.h keisanki/2012/Makefile.* )

