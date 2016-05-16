program test
implicit none

real	:: foo
INTEGER :: i, n, clock
INTEGER, DIMENSION(:), ALLOCATABLE :: seed

CALL RANDOM_SEED(size = n)
ALLOCATE(seed(n))

CALL SYSTEM_CLOCK(COUNT=clock)

seed = clock + 37 * (/ (i - 1, i = 1, n) /)
CALL RANDOM_SEED(PUT = seed)

DEALLOCATE(seed)

call random_number(foo)

write(*,*) '0.52 normalized: ',0.52*(1.0/0.52)
write(*,*) foo,' normalized: ',foo*(1.0/foo)

write(*,*) int(52*foo)

end program
