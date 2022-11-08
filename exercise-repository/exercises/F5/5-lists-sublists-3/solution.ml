open List

let resposta1 = [[]]

let resposta2 = [['c']]

let resposta3 = [['b'; 'c']; ['c'; 'b']]

let rec insertions e l = match l with
    []    -> [[e]]
  | x::xs -> (e::l) :: (map (fun li -> x::li) (insertions e xs))

let rec permutations l = match l with
    []    -> [[]]
  | x::xs ->  flatten (map (fun l -> (insertions x l)) (permutations xs))
