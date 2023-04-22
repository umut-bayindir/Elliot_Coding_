
recursive subroutine quicksort(k,left,right)
    integer, dimension(2000), intent(inout) :: k
    integer, intent(in) :: left,right
    integer :: i, j, pivot, temp


    

    IF (left < right) THEN
        pivot = left;
        i = left;
        j = right;
        do while (i < j)
           do while (k(i) <= k(pivot) .and. i < right)
               i = i + 1
           end do 
            do while (k(j) > k(pivot))
               j = j -1
            end do
            IF (i < j) THEN
                temp = k(i);
                k(i) = k(j);
                k(j) = temp;
            END IF
        end do
        temp = k(pivot);
        k(pivot) = k(j);
        k(j) = temp;
        call quicksort(k, left, j - 1);
        call quicksort(k, j + 1, right);
    END IF



end subroutine 

PROGRAM qsort 

implicit none
integer :: m,n,mean
integer :: input_line
integer :: counter
real :: startT, endT, execTime
integer, dimension(2000) :: array_for_sorting
    character (len=20) :: fname
    write (*,*) 'Enter the file name: '
    read (*,'(A)') fname
  open (unit = 1, file = fname)
  open(unit = 2, file = 'sortedF.txt')
do counter = 1, 2000
    read( 1, *  ) input_line
    ! write(*,*) input_line 
    array_for_sorting(counter) = input_line
    
   
end do
! write (*,*) array_for_sorting(2000)
call cpu_time(startT)
call quicksort(array_for_sorting,1,2000)
call cpu_time(endT)
execTime = (endT - startT)


write(*,*) 'Elapsed time in seconds: ', execTime
    


do counter = 1, 2000    
write(2,*) array_for_sorting(counter)  
end do    
end program 