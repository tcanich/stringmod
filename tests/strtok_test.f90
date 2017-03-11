program strtok_test
use strings
implicit none

! Unit test for strtok function.
! strtok takes four arguments: str, strlen, token, ntoken
! Returns character array of tokenized elements of str
!
! Tom Canich <tom@canich.net> 1 Jan 2016

character(len=:),allocatable :: str,words(:)
character(len=1) :: delim
integer :: n

str = 'Foo,Bar,Baz'
delim = ','

n = ntoken(str,delim)

if ( .not. allocated(words)) then
    allocate(character(len=len(str)) :: words(n))
end if

write (*,'(A,A,I3)') str,delim,n

words = strtok(str,delim)

write (*,*) words

end program 
