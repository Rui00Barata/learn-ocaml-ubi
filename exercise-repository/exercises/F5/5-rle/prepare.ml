type rle_contents = 
  One of int 
  | Many of (int*int)

type escolha =
  | A | B | C | D | Por_Responder of string