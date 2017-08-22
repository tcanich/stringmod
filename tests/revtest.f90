program revtest
  use strings, only: rev
  implicit none

!! Test string reverse function

  character(len=:),allocatable :: string

  string = 'Quick Brown Fox!'

  write(*,*) string
  write(*,*) rev(string)

end program
