let abs x  =
  if x < 0 then -x else x

let get_sum_iter n = 
  let n = ref n in
  let sum = ref 0 in
  let () = 
    while !n<>0 do 
      sum := !sum + (!n mod 10);
      n := (!n) / 10
    done in !sum

let rec get_sum_rec n = 
  if (n < 10) && (n>=0)
  then
    n
  else 
    ((n mod 10)  + get_sum_rec (n/10))