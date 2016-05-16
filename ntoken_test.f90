	PROGRAM ntoken_test
	USE strings
	IMPLICIT none

!	test ntoken function from string_module
!	ntoken takes three arguments: str, strlen, token
!	ntoken returns an integer: the number of token
!	in string.

	CHARACTER*11	:: string1,string2*21,token*3
	INTEGER			:: strlen,ntoken,i

	string1 = 'Foo:Bar:Baz'
	token = ':'
	strlen = len(string1)

	i = ntoken(string1,strlen,token)

	write (*,*) 'There are ',i,' tokens in the string: ',string1,'.'

	string2 = ' Foo,  Bar, Baz, Bat '
	token = ', '

	i = ntoken(string2,len(string2),token)

	write (*,*) 'There are ',i,' tokens in the string: ',string2,'.'

	STOP
	END PROGRAM ntoken_test
