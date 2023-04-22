with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- with Ada.Numerics.Generic_Elementary_Functions; use Ada.Numerics;
with Ada.Calendar; use Ada.Calendar;
with Ada.Directories; use Ada.Directories;
procedure msort is 
    num : constant := 2000;
    type MyArray is array (1..num) of integer; 
   
   
    Procedure meansort(m, n, mean : in Integer; k : in out myArray) is
       left_sum, right_sum, temp, pmean, i, j : Integer;
   begin
      if m < n then
         left_sum := 0;
         right_sum := 0;
         i := m;
         j := n;
         loop
            while k(i) <= mean and i /= j loop
               left_sum := left_sum + k(i);
               i := i + 1;
            end loop;
            
            while k(j) > mean and i /= j loop
               right_sum := right_sum + k(j);
               j := j - 1;
            end loop;
            
            if i /= j then
               temp := k(i);
               k(i) := k(j);
               k(j) := temp;
            else
               exit;
            end if;
         end loop;
         
         if i = m then
            return;
         end if;
         
         right_sum := right_sum + k(j);
         pmean := Integer((left_sum / Integer(i - m)));
         meansort(m, i - 1, pmean, k);
         pmean := Integer((right_sum / Integer(n - j + 1)));
         meansort(j, n, pmean, k);
      end if;

        end meansort;
        
        mean : integer;
        startTime, endTime : Time;
        milliS : Duration;
        k : myArray;
     
        input : file_type;
        output : file_type;

        
        begin
        put_line("enter the file name");
      declare
                filename : constant String := Get_Line;
        begin
      --   put(filename);
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
        if k(1) <= k(num) then
            mean := k(1) + 1;
        else
            mean := k(1);
        end if;
        startTime := Clock;
        meansort(1,num,mean,k);
        endTime := Clock;
        milliS := (endTime - startTime) * 1000;
         for i in 1 .. num loop
        Ada.Integer_Text_IO.Put(output, k(i));
        Ada.Text_IO.New_Line(output);
        end loop;
        put_line("Runtime = " & Duration'Image(milliS) & " milliseconds.");




        end msort;

