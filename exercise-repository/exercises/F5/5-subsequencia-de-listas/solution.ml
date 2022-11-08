let subseq l1 l2 = 
  let rec iter_list l1 l2 =
    try
      match l2 with
      | []   -> l1
      | h::t -> 
          iter_list (if h=(List.hd l1) then (List.tl l1) else l1) t
    with _ -> l1 in
  [] = (iter_list l1 l2)