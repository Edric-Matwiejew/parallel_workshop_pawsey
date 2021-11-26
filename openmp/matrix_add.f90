program matrix_add                                                                                                                                                                                                                                                                                                                   use, intrinsic :: iso_fortran_env, only: dp => real32                                                                                                                                                                 
	implicit none                                                                                                                                                           
	real(dp), allocatable, dimension(:, :) :: A, B, C                                                                                                                                                                     
	integer :: n, i, j                                                                                                                                                                                                   
	n = 12000                                                                                                                                                       
	allocate(A(n,n), B(n,n), C(n,n))                                                                                                                                                                                      
	A = 1                                                                                                    
	B = 2                                                                                                      
	C = 0                                                                                                                                                                                                                 
	!$omp parallel do                                                                                          
	do i = 1, n                                                                                                   
		do j = 1, n                                                                                                   
			C(i,j) = A(i,j) + B(i,j)                                                                              
		enddo                                                                                                 
	enddo                                                                                                      
	!$omp end parallel do                                                                                                                                                                                                 	
	deallocate(A, B, C)                                                                                                                                                                                               
end program matrix_add                                                                                  
