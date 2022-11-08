(* Solution for 1 *)
let dragon_size n = 
  if n >= 0 then (1 lsl n) - 1
  else raise (Invalid_argument "dragon_size")

(* Solution for 2 *)
let append l1 l2 =
  let rec aux acc = function
    | [], [] -> List.rev acc
    | [], h :: t -> aux (h :: acc) ([], t)
    | h :: t, l -> aux (h :: acc) (t, l)
  in
  aux [] (l1, l2)

let rec dragon_aux n t =
  if n <= 1 then t
  else
    let tnew = append t [false] in
    let t = List.fold_left(fun acc e -> (not e)::acc) [] t in
    dragon_aux (n-1) (append tnew t)

let dragon = function
  | 0 -> []
  | n when n > 0 -> dragon_aux n [false]
  | _ -> raise (Invalid_argument "dragon")

(* Solution for 3 *)
let closest_pow2 v =
  let v = v - 1 in
  let v = v lor (v lsr 1) in
  let v = v lor (v lsr 2) in
  let v = v lor (v lsr 4) in
  let v = v lor (v lsr 8) in
  let v = v lor (v lsr 16) in
  v + 1

let dragon_bit = function
  | n when n > 0 -> 
    let v = closest_pow2 n in
    List.nth (dragon v) (n-1)
  | _ -> raise (Invalid_argument "dragon_bit")
  
