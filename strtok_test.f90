	PROGRAM strtok_test
	USE strings
	IMPLICIT none

!	Unit test for strtok function.
!	strtok takes four arguments: str, strlen, token, ntoken
!	Returns character array of tokenized elements of str

	CHARACTER*11	:: str,token*1
	INTEGER			:: n,i
	CHARACTER(LEN=3)	:: words(4)

	str = 'Foo,Bar,Baz'
	token = ','

	n = ntoken(str,len(str),token)
	
	words = strtok(str,len(str),token,n)
	
	DO i=0,4
		write (*,*) words(i)
	END DO

	STOP
	END PROGRAM strtok_test
