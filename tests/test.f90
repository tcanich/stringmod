program teststrings
  use strings, only : strtok, ntoken, to_upper, to_lower
  implicit none

  integer,parameter :: ntoken_result=3,strtok_result=0
  character(:),allocatable :: to_upper_result,to_lower_result
  character(:),allocatable :: input_str,input_delim,tou_tol_input_str
  character(len=:),allocatable :: string_output
  integer :: output
  logical :: ntoken_test,strtok_test,to_upper_test,to_lower_test

! Set logical to control test execution
  ntoken_test = .true.
  strtok_test = .true.
  to_upper_test = .true.
  to_lower_test = .true.  


! Initialize some test values
  input_str = 'Foo:Bar:Baz'
  input_delim = ':'
  tou_tol_input_str = 'FooBArBaZ'
  to_upper_result="FOOBARBAZ"
  to_lower_result="foobarbaz"

!
! ntoken test
!
  if (ntoken_test) then
    output = ntoken(input_str,input_delim)

    if (output .ne. ntoken_result) then
      write(*,*) 'ntoken_test: left /= right: ', output, ntoken_result
      stop 
    else
      write(*,*) 'ntoken: OK'
    end if
  end if

!
! strtok test
!
!  if (strtok_test) then
!    string_output = strtok(input_str,input_delim)
!    if (len(string_output) .ne. strtok_result

!
! to_upper test
!
  if (to_upper_test) then
    string_output = to_upper(tou_tol_input_str)
    if (string_output .ne. to_upper_result) then
      write(*,*) 'to_upper: left /= right: ',string_output, to_upper_result
      stop
    else
      write(*,*) 'to_upper: OK'
    end if
  end if

!
! to_lower test
!
  if (to_lower_test) then
    string_output = to_lower(tou_tol_input_str)
    if (string_output .ne. to_lower_result) then
      write(*,*) 'to_lower: left /= right: ',string_output, to_lower_result
      stop
    else
      write(*,*) 'to_lower: OK'
    end if
  end if

end program
