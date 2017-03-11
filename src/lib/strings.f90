module strings
  implicit none
  private
  public :: strtok, ntoken, to_upper, to_lower


! String processing functions:
!
! strtok: tokenize a string on a delimeter, return array of tokens, 
! length 0 when delimiter not found.
!
! ntoken: count number of tokens in string on a delimiter.  
! Return 0 if delimiter not found.
!
! to_upper: translate all lower case characters in string to upper case.
!
! to_lower: translate all upper case characters in string to lower case. 
!
!
! Tom Canich <tom@canich.net>  1 Jan 2016

contains

!
!	Tokenize a string (str) on a supplied delimiter (delim).
!	Return an array of tokenized words, of length 0 when no
!	substrings present. 
!
  pure function strtok (str,delim)
    integer :: pos1, pos2, n, i
    character(len=:),allocatable,intent(in) :: str
    character(1),intent(in) :: delim
    character(len=:),allocatable :: strtok(:)
  
    pos1 = 1
    pos2 = 0
    n = 0
  
    if (.not. allocated(strtok)) then
      allocate(character(len=len(str)) :: strtok(ntoken(str,delim)))
    end if
  
    do n=1,size(strtok)
      do i=pos1,len(str)
        pos2 = i
        if (str(i:i) == delim) then
          exit
        end if
      end do
      if (n == size(strtok)) then
        strtok(n) = str(pos1:pos2)
      else
        strtok(n) = str(pos1:pos2-len(delim))
      end if
      pos1 = pos2+len(delim)
    end do
  end function
  
! Calculate the number of tokens in a string, by delimiter
  
  pure function ntoken (str,delim)
    integer :: ntoken, i
    character(:),allocatable,intent(in) :: str
    character(1),intent(in) :: delim
  
    ntoken = 0
  
    do i=1,len(str)
    	! If this character is our delimiter, and the next character
    	! is also a delimiter, skip ahead to the next character.
      if ((str(i:i) == delim) .and. (str(i+1:i+1) == delim)) then
        cycle
      end if
    	! If this character isn't the end of the string, and isn't
    	! our delimiter, go to the next character.  Otherwise,
    	! increment ntoken.
      if ((str(i:i) /= delim) .and. (i /=len(str))) then
        cycle
      else
        ntoken = ntoken + 1
      end if
    end do
  end function
  

! Convert a string to upper case
  pure function to_upper (str) Result (string)
      implicit none
      character(*), intent(in) :: str
      character(len(str)) :: string
  
      integer :: ic, i
  
      character(26), parameter :: cap = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      character(26), parameter :: low = 'abcdefghijklmnopqrstuvwxyz'
  
  !   Capitalize each letter if it is lowecase
      string = str
      do i = 1, len_trim(str)
          ic = index(low, str(i:i))
          if (ic > 0) string(i:i) = cap(ic:ic)
      end do
  
  end function to_upper

! Convert a string to lower case
  pure function to_lower (str) Result (string)
      implicit none
      character(*), intent(in) :: str
      character(len(str)) :: string
  
      integer :: ic, i
  
      character(26), parameter :: cap = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      character(26), parameter :: low = 'abcdefghijklmnopqrstuvwxyz'
  
  !   Capitalize each letter if it is lowecase
      string = str
      do i = 1, len_trim(str)
          ic = index(cap, str(i:i))
          if (ic > 0) string(i:i) = low(ic:ic)
      end do
  
  end function to_lower

end module strings
