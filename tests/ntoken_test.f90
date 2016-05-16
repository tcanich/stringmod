	PROGRAM ntoken_test
	USE strings
	IMPLICIT none

!	test ntoken function from string_module
!	ntoken takes three arguments: str, strlen, delim
!	ntoken returns an integer: the number of tokens
!	in string.

	CHARACTER(:),allocatable	:: string1,string2,string3,string4,delim
	INTEGER			:: strlen,i

	string1 = 'Foo:Bar:Baz'
	delim = ':'
	strlen = len(string1)

	i = ntoken(string1,strlen,delim)

	write (*,*) 'There are ',i,' tokens in the string: ',string1,'.'

	string2 = ' Foo,  Bar, Baz, Bat '
	delim = ', '

	i = ntoken(string2,len(string2),delim)

	write (*,*) 'There are ',i,' tokens in the string: ',string2,'.'

	string3 = 'Foo:Bar:Baz:::Bat'
	delim = ':'
	
	i = ntoken(string3,len(string3),delim)
	
	write (*,*) 'There are ',i,' tokens in the string: ',string3,'.'

	string4 = 'Foo:Bar:Baz:::'
	delim = ':'
	
	i = ntoken(string4,len(string4),delim)
	
	write (*,*) 'There are ',i,' tokens in the string: ',string4,'.'

	STOP
	END PROGRAM ntoken_test
