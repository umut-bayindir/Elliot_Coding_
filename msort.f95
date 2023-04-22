
    recursive subroutine meansort(m,n,mean,k)
        integer, dimension(2000), intent(inout) :: k
        integer, intent(in) :: m, n, mean
        integer :: i, j, left_sum, right_sum, temp, pmean

        IF (m < n) THEN
            left_sum = 0 
            right_sum = 0
            i = m
            j = n
        do 
            do while(k(i) <= mean .and. i /= j) 
                left_sum = left_sum + k(i)
                i = i + 1
            end do
            do while(k(j) > mean .and. i /= j) 
                right_sum = right_sum + k(j)
                j = j - 1
            end do
            IF (i /= j) THEN
                temp = k(i)
                k(i) = k(j)
                k(j) = temp
            ELSE
                exit
            END IF 
        end do
        IF (i == m) THEN
            RETURN 
        END IF
        right_sum = right_sum + k(j)
        pmean = left_sum / (i-m)
        call meansort(m, i - 1, pmean, k)
        pmean = (right_sum / (n - j + 1))
        call meansort(j, n, pmean, k)

    END IF

    end subroutine 

    PROGRAM msort 
       
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
        m=1
        n=2000
        IF (array_for_sorting(m) <= array_for_sorting(n)) THEN
            mean = array_for_sorting(m) + 1
        ELSE 
            mean = array_for_sorting(m)
        END IF
        call cpu_time(startT)
        call meansort(m,n,mean,array_for_sorting)
        call cpu_time(endT)
        execTime = (endT - startT)

        write(*,*) 'Elapsed time in seconds: ', execTime
       
            


do counter = 1, 2000    
   write(2,*) array_for_sorting(counter)  
end do    
end program 