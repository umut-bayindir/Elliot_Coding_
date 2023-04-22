with ada.Text_IO; use Ada.Text_IO;
-- with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with polylink; use polylink;
with polymath; use polymath;


procedure poly is 
 Head : term_Ptr := null;
second_polynomial : term_Ptr := null;
 test : term_Ptr := null;
 polynomial_addsolution : term_Ptr := null;
--  polynomial_string_to_input : string(1..30);
    begin
    Put_Line("hello World");
    hello_world;
    -- append_Node(3, 5, Head);
    -- append_Node(-2, 3, Head);
    -- append_Node(1, 2, Head);
    -- append_Node(4, 0, Head);
    -- append_Node(polynomial_a.degree : term_Ptr,  polynomial_a.coefficient : term_Ptr, Head);
    readPOLY(Head);
    readPOLY(second_polynomial);
    -- writePOLY(Head);
   
    test := addpoly(Head,second_polynomial);
    test := subpoly(Head,second_polynomial);
    
    writePOLY(test);
  


end poly;
