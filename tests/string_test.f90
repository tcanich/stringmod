program stringtest
use strings
implicit none

character(:),allocatable :: string1
character(len=1) :: tok
character(len=11) :: words(3)
integer :: i,n=0


string1 = 'Foo,Bar,Baz'
tok = ','

! count number of tokens in str, to pass to strtok
n = ntoken(string1,tok)

!write (*,*) string1,tok,n

!write (*,*) ntoken(string1,tok)

!allocate(character(len=len(string1)) :: words(n))
!write (*,*) size(words),shape(words),len(words)
words = strtok(string1,tok)

write (*,*) words(1),words(2),words(3)

do i=1,size(words)
  write (*,*) '.',words(i),'.'
end do
	
end program stringtest
	
