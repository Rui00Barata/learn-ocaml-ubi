let halve l =
  let len = List.length l in
  let rec split1 l m pos = 
    if (pos <= m/2)
    then
      match l with 
      | [] -> []
      | h::t -> h::(split1 t m (pos+1))
    else
      [] in
  let rec split2 l m pos = 
    match l with 
    | [] -> []
    | h::t when (pos > m/2) -> h::(split2 t m (pos+1))
    | h::t when (pos <= m/2) -> split2 t m (pos+1) in
  (split1 l len 1, split2 l len 1)

