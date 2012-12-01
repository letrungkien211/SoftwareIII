ARCH=	$(shell uname | cut -d'_' -f1)

TARGET = sample1 sample2 sample3 sample4 sample5 sample6 sample7 sample8 capture 20110609-opencv.pdf 

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

sample1: sample1.c
	gcc -o $@ $< `pkg-config opencv --cflags` `pkg-config opencv --libs`
sample2: sample2.c
	gcc -o $@ $< `pkg-config opencv --cflags` `pkg-config opencv --libs`
sample3: sample3.c
	gcc -o $@ $< `pkg-config opencv --cflags` `pkg-config opencv --libs`
sample4: sample4.c
	gcc -o $@ $< `pkg-config opencv --cflags` `pkg-config opencv --libs`
sample5: sample5.c
	gcc -o $@ $< `pkg-config opencv --cflags` `pkg-config opencv --libs`
sample6: sample6.c
	gcc -o $@ $< `pkg-config opencv --cflags` `pkg-config opencv --libs`
sample7: sample7.c
	gcc -o $@ $< `pkg-config opencv --cflags` `pkg-config opencv --libs`
sample8: sample8.c
	gcc -o $@ $< `pkg-config opencv --cflags` `pkg-config opencv --libs`
capture: capture.c
	gcc -o $@ $<

