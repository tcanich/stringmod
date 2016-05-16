	MODULE strings
	IMPLICIT none

	CONTAINS

!
!	Tokenize a string (str) on a supplied delimiter (token).
!	Return an array of tokenized words, of length 0 when no
!	substrings present. 
!
	FUNCTION strtok (str,strlen,token,ntoken)
		INTEGER	:: pos1 = 1, pos2, 	n = 0, i, strlen, ntoken
		CHARACTER(LEN=strlen)		:: str
		CHARACTER(LEN=strlen)		:: strtok(ntoken+1)
		CHARACTER(1)			:: token

		DO 
			pos2 = INDEX(str(pos1:), token)
			IF (pos2 == 0) THEN
				n = n + 1
				strtok(n:strlen-pos1+1) = str(pos1:strlen)
				EXIT
			END IF
			n = n + 1
			strtok(n:n+pos1+pos2-2) = str(pos1:pos1+pos2-2)
			pos1 = pos2+pos1
		 END DO

	END FUNCTION strtok 

!	Calculate the number of tokens in a string, by delimiter token

	FUNCTION ntoken (str,strlen,token)
		INTEGER	:: strlen, ntoken, i
		CHARACTER*(*)	:: str
		CHARACTER(1)		:: token

		ntoken = 0

!       count number of tokens in str, to pass to strtok
        DO i=0,strlen
			IF (str(i:i) == token) THEN
				ntoken = ntoken + 1
			END IF
        END DO
	END FUNCTION ntoken


	END MODULE strings
