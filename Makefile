FC=gfortran5
FARGS=-Wall -std=f2003
TEST=tests/test.f90
PROG=strings

all: module tests

module:
	$(FC) $(FARGS) -c -o $(PROG).mod src/$(PROG).f90

test: module
	$(FC) $(FARGS) -o $(PROG)test src/$(PROG).f90 $(TEST)

clean:
	rm *.mod
