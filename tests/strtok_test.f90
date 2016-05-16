program strtok_test
use strings
implicit none

! Unit test for strtok function.
! strtok takes four arguments: str, strlen, token, ntoken
! Returns character array of tokenized elements of str
!
! Tom Canich <tom@canich.net> 1 Jan 2016

character(len=:),allocatable :: str,delim,words(:)
integer :: n,i

str = 'Foo,Bar,Baz'
delim = ','

n = ntoken(str,len(str),delim)

if ( .not. allocated(words)) then
	allocate(character(len=len(str)) :: words(n+1))
end if

write (*,'(A,A,I3)') str,delim,n

words = strtok(str,len(str),delim,n)

write (*,*) words

end program 
