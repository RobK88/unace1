
OBJ = globals.o uac.o uac_crt.o uac_dcpr.o unace.o
SRC = globals.c uac.c uac_crt.c uac_dcpr.c unace.c

#CFLAGS = -g -Wall -DMDEBUG
#CFLAGS = -O3 -fno-strength-reduce -fomit-frame-pointer # These are for Linux

CFLAGS = -O -g -Wall
CC = gcc

unace$(EXEEXT): $(OBJ) $(LIBS)

clean:
	rm -f *.o a.out core unace unace.exe
	rm -f makefile.dep

makefile.dep: $(SRC)
	$(CPP) $(CPPFLAGS) -MM $(SRC) >$@

-include makefile.dep
