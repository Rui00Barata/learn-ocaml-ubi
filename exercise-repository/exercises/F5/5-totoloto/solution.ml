(* 1 *)
let make_grelha n = Array.make_matrix n n false

(* 2 *)
let grelha = make_grelha 7 
    
(* 3 *)
let fill l = 
  let grelha = make_grelha 7 in
  let rec go_trough_list l = 
    match l with 
    | [] -> ()
    | h::t -> let i = (h-1)/7 in grelha.(i).((h-1)-(i*7)) <- true; go_trough_list t in
  go_trough_list l;
  grelha

(* 4 *)
let sorteio g l c = 
  let get_value n = 
    let i = (n-1)/7 in
    g.(i).((n-1)-(i*7)) in
  let rec get_output g l = 
    match l with
    | []   -> []
    | h::t -> if get_value h then h::(get_output g t) else get_output g t in
  (get_output g l, get_value c)