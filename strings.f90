module strings
implicit none

! String processing functions:
!
! strtok: tokenize a string on a delimeter, return array of tokens, 
! length 0 when delimiter not found.
!
! ntoken: count number of tokens in string on a delimiter.  
! Return 0 if delimiter not found.
!
! Tom Canich <tom@canich.net>  1 Jan 2016

contains

!
!	Tokenize a string (str) on a supplied delimiter (delim).
!	Return an array of tokenized words, of length 0 when no
!	substrings present. 
!
pure function strtok (str,strlen,delim,ndelim)
	integer	:: pos1, pos2, 	n, i
	integer,intent(in) :: strlen, ndelim
	character(len=strlen),intent(in) :: str
	character(1),intent(in)	:: delim
	character(len=strlen) :: strtok(ndelim+1)

	pos1 = 1
	n = 0

	do 
		pos2 = index(str(pos1:), delim)
		if (pos2 == 0) then
			n = n + 1
			strtok(n:strlen-pos1+1) = str(pos1:strlen)
			exit
		end if
		n = n + 1
		strtok(n:n+pos1+pos2-2) = str(pos1:pos1+pos2-2)
		pos1 = pos2+pos1
	 end do

end function

!	Calculate the number of tokens in a string, by delimiter

pure function ntoken (str,strlen,delim)
	integer,intent(in)	:: strlen
	integer :: ntoken, i
	character(:),allocatable,intent(in)	:: str
	character(1),intent(in)	:: delim

	ntoken = 0

    do i=1,strlen
		! If this character is our delimiter, and the next character
		! is also a delimiter, skip ahead to the next character.
		if ((str(i:i) == delim) .and. (str(i+1:i+1) == delim)) then
			cycle
		end if
		! If this character isn't the end of the string, and isn't
		! our delimiter, go to the next character.  Otherwise,
		! increment ntoken.
		if ((str(i:i) /= delim) .and. (i /=strlen)) then
			cycle
		else
			ntoken = ntoken + 1
		end if
    end do
end function


end module strings
