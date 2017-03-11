FC=gfortran
FARGS=-Wall -std=f2003 -fPIC
LD=ld
LDARGS=-G
MAJV=0
MINV=1
TEST=tests/test.f90
PROG=strings
BUILD=build
TOP=/home/tcanich/fortran/stringmod

all: module tests

module:
	cd $(BUILD)
	$(FC) $(FARGS) -c -o $(PROG).o $(TOP)/src/lib/$(PROG).f90
	$(LD) $(LDARGS) $(PROG).o -o lib$(PROG).so.$(MAJV).$(MINV)
	cd $(TOP)

test: module
	cd $(BUILD)
	$(FC) $(FARGS) -o $(PROG)test src/lib/$(PROG).f90 $(TEST)
	cd $(TOP)

clean:
#	rm $(BUILD)/*.mod $(BUILD)/*.o
	rm *.mod *.o 

distclean: clean
	rm $(PROG)test lib$(PROG).so.$(MAJV).$(MINV)
