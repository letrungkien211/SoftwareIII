CC=g++
LD=g++
LSFX=so
EXESFX=
OBJOPT=-o 
OUTOPT=-o 
LDDOBJS=joy-lnx.o
OBJECTS=joy-main.o joy-lnx.o

CFLAGS=-O2 -c 
SOFLAGS=-shared

.SUFFIXES:.o .obj .cpp .c .res .rc

.cpp.o:
	$(CC) $(CFLAGS) $< $(OBJOPT)$@

all: joy-main$(EXESFX) joy.$(LSFX)

joy-main$(EXESFX): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OUTOPT)$@ $(OBJECTS)

joy.$(LSFX): $(LDDOBJS)
	$(LD) $(SOFLAGS) $(OUTOPT)joy.$(LSFX) $(LDDOBJS)

clean:
	rm -f *~ *.o *.obj *.RES RC* *.pch *.exp *.idb *.exe *.lib *.dll *.a *.so joy-main$(EXESFX)


