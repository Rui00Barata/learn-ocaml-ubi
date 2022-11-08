let score (n : int) (pizza : int list)  = 
  let best_sum = ref (List.hd pizza) in
  let current_sum = ref 0 in
  let score_aux x = 
    current_sum := max x (!current_sum + x);
    best_sum := max !best_sum !current_sum in
  let () = List.iter score_aux pizza in
  !best_sum