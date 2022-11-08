let dutch_flag a = 
  let l = Array.to_list a in
  let b = ref [] in
  let w = ref [] in
  let r = ref [] in
  let rec dutch_flag_aux a =
    match a with
    | h::t -> (match (cor h) with | Blue ->  (b := !b@[h]; dutch_flag_aux t) | White -> (w := !w@[h]; dutch_flag_aux t) | Red -> (r := !r@[h]; dutch_flag_aux t))
    | [] -> () in
  begin
    dutch_flag_aux l;
    Array.of_list ((!b @ !w) @ !r)
  end