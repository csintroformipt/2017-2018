program using_randomzer
implicit none
real x(100)             !initialize array for random numbers
integer x_int(100)      !initializr array for random integers

!try running this program without lines 6-21
integer :: n, un, istat 
integer, allocatable ::seed
call random_seed(size = n)
allocate(seed(n))
open(un, file="/dev/urandom", access="stream", &
          form="unformatted", action="read", status="old", iostat=istat)
if (istat == 0) then
    read(un) seed
    close(un)
else
    write (*,*) 'canr read urandom"
    stop 1
end if

call random_seed(put=seed)

call random_number(x)   !initialize x with random numbers 0<=x(i)<1
x_int=int(11*x)         !initialize x_int with random integers {0,1,2,3,4,5,6,7,8,9,10}

write(*,*) "real_rnd=", x
write(*,*) "integer_rnd=", x_int
end program