
let zero   = Z.zero
let one    = Z.one
let two    = Z.succ one
let three  = Z.succ two
let ( +> ) = Z.add
let ( *> ) = Z.mul       
let ( /> ) = Z.div
let ( %> ) = Z.rem               

let is_even x = x %> two = zero

 let rec collatz n = print_endline (Z.to_string n) ;
  if n = one
  then ()
  else collatz  (if is_even n then n /> two else ((three *>  n) +> one))
      

let () = collatz (Z.of_string Sys.argv.(1))
    
 
