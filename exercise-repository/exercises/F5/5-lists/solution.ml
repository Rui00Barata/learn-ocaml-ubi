let soma lista = 
  List.fold_left (+) 0 lista

let rec conta_pares l = 
  match l with
  | [] -> 0
  | h::t -> if (h mod 2) = 0 then 1 + (conta_pares t) else (conta_pares t)

let palindroma l =
  l = List.rev l

let maiusculas l = 
  List.map (fun x -> if (x >= 'a' && x <= 'z') then char_of_int((int_of_char x) - 32) else x) l

let rec is_sorted (l : int list) f =
  match l with 
  | [] -> true
  | h1::[] -> true
  | h1::h2::t -> if ((f h1 h2) = (-1) || (f h1 h2) = 0) then (true && is_sorted (h2::t) f) else false

let rec remove_duplicate_sorted l = 
  match l with
  | [] -> []
  | h::t -> h::(remove_duplicate_sorted (List.filter (fun x -> x<>h) t))

let rec remove_duplicate l = 
  match (List.sort compare l) with
  | [] -> []
  | h::t -> h::(remove_duplicate (List.filter (fun x -> x<>h) t))