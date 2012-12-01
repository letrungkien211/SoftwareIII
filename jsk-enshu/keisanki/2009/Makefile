ARCH=	$(shell uname | cut -d'_' -f1)

CC	= gcc
CFLAGS	= -O2 `pkg-config opencv --cflags`
LIBS	= `pkg-config opencv --libs`

TARGET = capture capture_threshold capture_laplacian \
        server client server-nomulti client-nomulti capture_server capture_client \
        videocapture_mmap videocapture_read videocapture_full play record \
	20090604-enshu-device.dvi 20090605-enshu-socket.dvi

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

to-sjis:
	find enshu-20090604 -exec ./to-sjis.sh {} \;
	find enshu-20090605 -exec ./to-sjis.sh {} \;

%.dvi: %.tex
	(cd fig; ebb ./*)
	$(LATEX) $*
	$(LATEX) $*
	grep War $*.log | cat
%.pdf: %.dvi
	dvipdfmx $<

.c.o:
	${CC} -c ${CFLAGS} $<

videocapture_mmap: videocapture.o videocapture_mmap.o
	${CC} -o $@ $^

videocapture_read: videocapture.o videocapture_read.o
	${CC} -o $@ $^

videocapture_full: videocapture_full.o
	${CC} -o $@ $^

play: play.o soundlib.o
	${CC} -o $@ $^

record: record.o soundlib.o
	${CC} -o $@ $^

capture: capture.o
	${CC} -o $@ $^ $(LIBS)

capture_threshold: capture_threshold.o
	${CC} -o $@ $^ $(LIBS)

capture_laplacian: capture_laplacian.o
	${CC} -o $@ $^ $(LIBS)

server-nomulti: server-nomulti.o socketlib-nomulti.o
	${CC} -o $@ $^ $(LIBS)

client-nomulti: client-nomulti.o socketlib-nomulti.o
	${CC} -o $@ $^ $(LIBS)

server: server.o socketlib.o
	${CC} -o $@ $^ $(LIBS)

client: client.o socketlib.o
	${CC} -o $@ $^ $(LIBS)

capture_server: capture_server.o socketlib.o
	${CC} -o $@ $^ $(LIBS)

capture_client: capture_client.o socketlib.o
	${CC} -o $@ $^ $(LIBS)

clean:
	rm -f ${TARGET} *.o *~

distclean: clean
	rm -f *.pdf *.out *.log *.aux *.exe *.tgz fig/*.bb
	rm -fr enshu-20090604
	rm -fr enshu-20090605
	rm *.sjis

tgz:
	echo "20090604"
	rm -fr enshu-20090604
	mkdir -p enshu-20090604/sound
	indent -kr play.c record.c soundlib.c soundlib.h
	cp play.c soundlib.c soundlib.h enshu-20090604/sound
	cp Makefile.sound enshu-20090604/sound/Makefile
	if [ -e record ]; then cp record enshu-20090604/sound; fi
	mkdir -p enshu-20090604/camera1
	indent -kr videocapture.c videocapture.h videocapture_mmap.c videocapture_read.c
	cp videocapture.c videocapture.h videocapture_mmap.c videocapture_read.c enshu-20090604/camera1
	cp Makefile.camera1 enshu-20090604/camera1/Makefile
	mkdir -p enshu-20090604/camera2
	indent -kr capture.c
	cp capture.c enshu-20090604/camera2
	cp Makefile.camera2 enshu-20090604/camera2/Makefile
	tar -cvzf enshu-20090604.tgz enshu-20090604/
	echo "20090605"
	rm -fr enshu-20090605
	mkdir -p enshu-20090605/socket
	indent -kr client-nomulti.c server-nomulti.c socketlib.h socketlib-nomulti.c
	cp client-nomulti.c server-nomulti.c socketlib.h socketlib-nomulti.c enshu-20090605/socket
	sed -i s@#define\ PORT\ 1080@#define\ PORT\ 0/***TODO***/@ enshu-20090605/socket/client-nomulti.c
	sed -i s@\(sock\,@\(\ 0/***TODO***/\,@ enshu-20090605/socket/client-nomulti.c
	sed -i s@,\ size\)@,\ \ 0/***TODO***/\)@ enshu-20090605/socket/client-nomulti.c
	sed -i s@,\ BUFSIZE\)@,\ \ 0/***TODO***/\)@ enshu-20090605/socket/client-nomulti.c
	#sed -i s@\=\ accept\ \.*\)\)@/***\ TODO\ ***/\)@ enshu-20090605/socket/server-nomulti.c
	#sed -i s@read\.*\;@read\ \(/***\ TODO\ ***/\)\;@ enshu-20090605/socket/server-nomulti.c
	#sed -i s@write\.*\;@write\ \(/***\ TODO\ ***/\)\;@ enshu-20090605/socket/server-nomulti.c
	cp Makefile.socket enshu-20090605/socket/Makefile
	tar -cvzf enshu-20090605.tgz enshu-20090605/

upload: tgz
	scp *.tgz k-okada@www.jsk.t.u-tokyo.ac.jp:/home/jsk/k-okada/public_html/lecture

###

