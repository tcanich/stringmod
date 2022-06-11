FC=gfortran
FARGS=-Wall -std=f2008 -Wl,-rpath=$(TOP)
LD=ld
TOP=$(PWD)
LDFLAGS=-G -fPIC -Bdynamic -L$(TOP) 
MAJV=0
MINV=1
PROG=strings
LIB=lib$(PROG).so

all: liblink 

include:
	$(FC) $(FARGS) -c $(TOP)/src/lib/$(PROG).f90

lib: include
	$(LD) $(LDFLAGS) $(PROG).o -o $(LIB).$(MAJV).$(MINV)

liblink: lib
	ln -s $(LIB).$(MAJV).$(MINV) $(LIB)

test: liblink
	$(FC) $(FARGS) -L$(TOP) -o $(PROG)test $(TOP)/tests/test.f90 -l$(PROG)
	$(TOP)/$(PROG)test

clean:
	rm *.mod *.o 

distclean: clean
	rm $(PROG)test $(LIB).$(MAJV).$(MINV) $(LIB)
