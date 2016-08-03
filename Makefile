# skeleton Makefile for cross compiling windows for SWI
# alot of the work is done by a prolog script that
# uses includes and R dlls in my disk space and includes those ala
# buildenv.sh (on the fly)
#

SOBJ=	$(PACKSODIR)/space.$(SOEXT)
LIBS=	-lspatialindex -lgeos
LD=g++
OBJ=    c/space.o c/globals.o c/Index.o c/Search.o \
        c/Shapes.o c/lock.o c/debug.o

all:	$(SOBJ)


$(SOBJ): $(OBJ)
	mkdir -p $(PACKSODIR)
	$(LD) $(ARCH) $(LDSOFLAGS) -o $@ $< $(OBJ) $(LIBS) $(SWISOLIB)

$(OBJ):
	$(CC) $(ARCH) $(CFLAGS) -c -o $@ $<

check::
install::
clean:
	rm -f c/*.o *~
distclean: clean
	rm -f $(SOBJ)
