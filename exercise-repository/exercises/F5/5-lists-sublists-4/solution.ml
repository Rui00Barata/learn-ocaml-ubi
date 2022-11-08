open List
    
let rec sublists l = match l with
    []    -> [[]]
  | x::xs ->
    let subl = (sublists xs) in
    subl @  (map (fun l -> x::l) subl)
            
let rec insertions e l = match l with
    []    -> [[e]]
  | x::xs -> (e::l) :: (map (fun li -> x::li) (insertions e xs))
                       
let rec permutations l = match l with
    []    -> [[]]
  | x::xs ->  flatten (map (fun l -> (insertions x l)) (permutations xs))
                

let subbag l =
  sort compare
    (flatten
       (map (permutations) (sublists l)));;
