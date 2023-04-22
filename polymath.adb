with ada.Text_IO; use Ada.Text_IO;
package body polymath is

    function addpoly(polynomial_a:  term_Ptr;polynomial_b:  term_Ptr) return term_Ptr is
    
    
    polynomial_addsolution : term_Ptr := null;
    a : term_Ptr := polynomial_a;
    b : term_Ptr := polynomial_b;
    -- new_Node:   term_Ptr;
    --  Head : term_Ptr := null;
    begin
    

    put("po");
   
   while a /= null or b /= null loop
    if a.exponent > b.exponent then
          append_Node(a.coefficient, a.exponent, polynomial_addsolution);
            a := a.next;
          end if; 
    if b.exponent > a.exponent then
          append_Node(b.coefficient, b.exponent, polynomial_addsolution);
            b := b.next;
          end if; 
    if a.exponent = b.exponent then 
        
           
            
        append_Node(a.coefficient + b.coefficient, a.exponent, polynomial_addsolution);
        a := a.next;
        b := b.next;
        end if;     
    end loop;    
     
    

   
    return polynomial_addsolution;
   
    end addpoly;


function subpoly(polynomial_a:  term_Ptr;polynomial_b:  term_Ptr) return term_Ptr is
    polynomial_subsolution : term_Ptr := null;
    a : term_Ptr := polynomial_a;
    b : term_Ptr := polynomial_b;
    begin
    while b /= null loop
    b.coefficient := -1 * b.coefficient;
    b := b.next;
    end loop;
    b := polynomial_b;
    polynomial_subsolution := addpoly(a,b);

    return polynomial_subsolution;

    end subpoly;




end polymath;