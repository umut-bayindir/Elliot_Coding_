with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- with ada.strings.unbounded; use ada.strings.unbounded;
-- with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;
-- with Ada.Strings.Unbounded.Unbounded_String; use Ada.Strings.Unbounded.Unbounded_String;


package body polylink is


 procedure append_Node(coefficient: Integer; exponent: Integer; new_Node: in out term_Ptr) is
    begin
      if new_Node = null then
        new_Node := new term'(coefficient,exponent,null);

      else
        if new_Node.next /= null then
          append_Node(coefficient, exponent, new_Node.next);
        else
        
         new_Node.next := new term'(coefficient,exponent,null);
        end if;
      end if;
    end append_Node;


    procedure readPOLY(Head : in out term_Ptr) is
    
    coefficient : integer;
    degree : integer;
    continue : integer;
     
    begin
     Put("Write the polynomial  ");
      loop 
       
        Put("Enter the coefficient");
        get(coefficient);
        Put("Enter the degree");
        get(degree);
        append_Node(coefficient, degree, Head);
        Put("do you want to continue - 0 for yes or 1 for no");
        get(continue);
        exit when continue = 1;


        end loop; 



    end readPOLY;



    procedure writePOLY(term: in term_Ptr) is
    begin
      if term /= null then
        -- put(term.coefficient); put("x^"); put(term.exponent);
        if term.next = null then
           Put(integer'image(term.coefficient)); put(" x ^"); Put(integer'image(term.exponent));
        else
        Put(integer'image(term.coefficient)); put(" x ^"); Put(integer'image(term.exponent)); put(" + ");
        end if; 

        writePOLY(term.next); 
      end if;
    end writePOLY;

   



    procedure hello_world is 
        begin
        Put_Line("hello World");

    end hello_world;

end polylink;