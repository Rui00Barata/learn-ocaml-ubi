let rec valid n = 
  match n with 
  | 1 -> true
  | _ -> match (n mod 2) with 0 -> valid (n/2) | _ -> false

let rec estrelinhas n =
  let rec  estrelinhas_aux left length = 

    if length = 0 
    then ()
    else
      begin
        
        estrelinhas_aux left (length/2);

        for i=0 to (left-1) do Printf.printf "  " done;
        for i=0 to (length-1) do Printf.printf "* " done;
        Printf.printf "\n";

        estrelinhas_aux (left + (length/2)) (length/2)
      end in
    if (valid n) then estrelinhas_aux 0 n else raise (Invalid_argument "estrelinhas")