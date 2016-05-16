	PROGRAM stringtest
	USE	strings
	IMPLICIT none

	CHARACTER(:),allocatable :: string1
	CHARACTER(:),allocatable :: tok
	CHARACTER(LEN=3) :: words(3)
	INTEGER :: i,n=0

	string1 = 'Foo,Bar,Baz'
	tok = ','

!	count number of tokens in str, to pass to strtok
	n = ntoken(string1,len(string1),tok)

	write (*,*) string1,tok,n

	write (*,*) ntoken(string1,len(string1),tok)

	words = strtok(string1,len(string1),tok,n)

	DO i=0,len(words)
		write (*,*) words(i)
	END DO
	
	END PROGRAM stringtest
	
