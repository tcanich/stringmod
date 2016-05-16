	PROGRAM stringtest
	USE	strings
	IMPLICIT none

	CHARACTER*11	:: string = 'Foo,Bar,Baz'
	CHARACTER*1		:: tok = ','
	CHARACTER(LEN=3)	:: words(3)
	INTEGER			:: i,strlen,n=0

	strlen = len(string)

!	count number of tokens in str, to pass to strtok
	DO i=0,strlen
		IF ( string(i) == tok ) THEN
			n = n + 1
		END IF
	END DO

	write (*,*) ntoken(string,strlen,tok)

!	words = strtok(string,strlen,tok,3)

	DO i=0,len(words)
		write (*,*) words(i)
	END DO
	
	END PROGRAM stringtest
	
