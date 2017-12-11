FC=gfortran
FARGS=-Wall -std=f2003 -fPIC
LD=ld
LDARGS=-G
LDFLAGS=-L$(TOP)/$(BUILD) -R$(TOP)/$(BUILD)
MAJV=0
MINV=1
TEST=tests/test.f90
PROG=strings
BUILD=build
TOP=/home/tcanich/fortran/stringmod

all: include lib tests

include:
	$(FC) $(FARGS) -c $(TOP)/src/lib/$(PROG).f90

lib:
	$(LD) $(LDARGS) $(PROG).o -o lib$(PROG).so.$(MAJV).$(MINV)

test: include lib
	$(FC) $(FARGS) $(LDFLAGS) -o $(PROG)test $(TOP)/$(TEST) -l$(PROG)

clean:
#	rm $(BUILD)/*.mod $(BUILD)/lib$(PROG)*
	rm *.mod *.o lib$(PROG).so.$(MAJV).$(MINV)

distclean: clean
	rm $(PROG)test lib$(PROG).so.$(MAJV).$(MINV)
