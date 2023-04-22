with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- with Ada.Numerics.Generic_Elementary_Functions; use Ada.Numerics;
with Ada.Calendar; use Ada.Calendar;
with Ada.Directories; use Ada.Directories;
procedure qsort is 
    num : constant := 2000;
    type MyArray is array (1..num) of integer; 
   
   
    Procedure quicksort(left, right : in Integer; k : in out myArray) is
       pivot, temp, i, j : Integer;
   begin
      if left < right then
         pivot := left;
         i := left;
         j := right;
       while (i < j) loop
            while (k(i) <= k(pivot) and i < right) loop
            i := i +1;
            end loop; 
            while (k(j) > k(pivot)) loop
            j := j - 1;
            end loop;
            if i < j then
               temp := k(i);
               k(i) := k(j);
               k(j) := temp;
            end if;
        end loop;
        temp := k(pivot);
        k(pivot) := k(j);
        k(j) := temp;

        quicksort(left, j-1, k);
        quicksort(j+1, right, k);
        end if;
        end quicksort;

        
      
        k : myArray;
        startTime, endTime : Time;
        milliS : Duration;
     
        input : file_type;
        output : file_type;
     
        
        begin
        put_line("enter the file name");
      declare
                filename : constant String := Get_Line;
        begin
        -- put(filename);
        if (not exists(filename)) then
        Put_Line("Error opening file.");
        return;
        
        end if;
        open(input,in_file,filename);
        for i in 1 .. num loop
        Get(input, k(i));
        end loop;
         create(output,out_file,"sortedA.txt");
    end;
       
         startTime := Clock;
        quicksort(1,num,k);
         endTime := Clock;
        milliS := (endTime - startTime) * 1000;
         for i in 1 .. num loop
        Put(output, k(i));
        New_Line(output);
        end loop;
        put_line("Runtime = " & Duration'Image(milliS) & " milliseconds.");




        end qsort;

