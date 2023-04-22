-- with ada.Text_IO; use Ada.Text_IO;
-- with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package polylink is

    type term;
    
    type term_Ptr is access term;
    type term is record
      coefficient: Integer;
      exponent: Integer;
      next: term_Ptr;
    end record;
    procedure append_Node(coefficient: Integer; exponent: Integer; new_Node: in out term_Ptr);
    procedure writePOLY(term: in term_Ptr);
    procedure readPOLY(Head : in out term_Ptr);
    procedure hello_world;
end polylink;