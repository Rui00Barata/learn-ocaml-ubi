let resposta1 = [[]]

let resposta2 = [[]; ['c']]

let resposta3 = [[]; ['c']; ['b']; ['b'; 'c']]

let rec sublista l = 
  match l with
  [] -> [[]]
  | h::t -> let sl = (sublista t) in sl @  (List.map (fun l -> h::l) sl)