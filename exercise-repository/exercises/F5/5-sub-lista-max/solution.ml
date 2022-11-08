(* 1 *)
let rec max_liste l =
  match l with
  | [] -> assert false
  | [x] -> x
  | x :: s -> max x (max_liste s)

let max_kadane l = 
  let rec kad_rec l m =
  match l, m with
  | [], _ -> max_liste m
  | x :: r, y :: _ ->
      let z = max x (x+y) in
      kad_rec r (z::m)
  | _ -> assert false
  in
  kad_rec l [0]

(* 2 *)
let rec loop sum lista seq maxsum maxseq = 
  match lista with 
  | [] -> List.rev maxseq
  | x::xs ->
      let sum = sum + x and seq = x :: seq in
        if sum < 0 then
          loop 0 xs [] maxsum maxseq 
        else if sum > maxsum then
          loop sum xs seq sum seq
        else
          loop sum xs seq maxsum maxseq 


let kadane lista_inteiros =
    loop 0 lista_inteiros [] 0 []
