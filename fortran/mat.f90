program mat
	implicit none
	
	integer :: i,j,k,q, MAT_SIZE=250, ITER=10
	real :: rand, start, finish
	character(len=32) :: arg
	integer, dimension(250,250) :: mat1, mat2, ans
	
	call get_command_argument(1,arg)
	100 format (f15.9)
	open(unit=1,file=arg)

	do q=1, ITER
		do i=1, MAT_SIZE
			do j=1, MAT_SIZE
				call random_number(rand)
				mat1(i,j) = INT(FLOOR(2*rand))
				call random_number(rand)
				mat2(i,j) = INT(FLOOR(2*rand))
				ans(i,j) = 0
			end do
		end do
	
		call CPU_TIME(start)
		do i=1, MAT_SIZE
			do j=1, MAT_SIZE
				do k=1, MAT_SIZE
					ans(i,j) = ans(i,j) + mat1(i,k) * mat2(k,j)
				end do
			end do
		end do
		call CPU_TIME(finish)
		write(unit=1,fmt=100) finish-start
	end do
end program mat
