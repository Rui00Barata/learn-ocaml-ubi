let resposta1 = [['e']]

let resposta2 = [['e'; 'c']; ['c'; 'e']]

let resposta3 = [['e'; 'b'; 'c']; ['b'; 'e'; 'c']; ['b'; 'c'; 'e']]

let rec insertions e l = match l with
    []    -> [[e]]
  | x::xs -> (e::l) :: (List.map (fun li -> x::li) (insertions e xs))
