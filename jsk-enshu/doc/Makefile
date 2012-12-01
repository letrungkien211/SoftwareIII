ARCH=	$(shell uname | cut -d'_' -f1)

RAWTARGET=	robot-programming-1 robot-programming-2 robot-programming-3 robot-programming-4

TARGET    =	$(addsuffix -fix, $(RAWTARGET))
TARGET.TEX=	$(addsuffix .tex, $(TARGET))
TARGET.DVI=	$(addsuffix .dvi, $(TARGET))
TARGET.SHOW=	$(addsuffix .show, $(TARGET))
TARGET.PDF=	$(addsuffix .pdf, $(TARGET))

DOCINFO = docinfo

ifeq ($(ARCH), CYGWIN)
QKC   = nkf --sjis
LATEX = platex
BIBTEX=	jbibtex
XDVI=	cygstart
else
QKC   = nkf --euc
LATEX =	platex
BIBTEX=	jbibtex
XDVI=	xpdf
endif

.SUFFIXES:	.tex .dvi .show .ps .pdf

all: convert $(TARGET.PDF)

show: $(TARGET.SHOW)

pdf: $(TARGET.PDF)

.tex.dvi:
	(cd fig/; ebb ./*)
	$(LATEX) $*
	$(LATEX) $*
	grep War $*.log | cat
.dvi.show:
	$(XDVI) $< &
.dvi.ps:
ifeq ($(ARCHDIR), Cygwin)
	dvipsk -P dl $<
else
	dvi2ps $< > $@
endif
.ps.pdf:
	acrodist $<
.dvi.pdf:
#	out2uni -e $*
	$(LATEX) $*
	dvipdfmx $<
#	pdffonts $@

sjis:
	for f in ${CONVFILES}; do \
	echo $${f}; \
	nkf -s $${f} > $${f}.tmp; \
	mv $${f}.tmp $${f}; \
	done

$(TARGET.DVI): $(DOCINFO).out

convert:
	for file in $(addsuffix .tex, $(RAWTARGET)); do echo $$file; $(QKC) $$file > `basename $$file .tex`-fix.tex; done

clean:
	-rm -f *.aux *.log *.blg *.bbl *.bmc *.pbm *-fix.tex
	-rm -f $(TARGET.DVI) *.out
	find . \( -iname '*~' -o -iname '*#*' -o -iname '*.aux' -o -iname '*.blg' -o -iname '*.bbl' -o -iname '*.log' -o -iname core -o -iname '*.bb' \) -print -exec rm {} \;


$(DOCINFO).out: $(DOCINFO).txt
	cp -f $< $@
	#out2uni -e $@

