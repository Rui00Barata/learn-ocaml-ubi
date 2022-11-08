open Random 
let knuth_shuffle a =
  Array.iteri (fun i e ->
    let j = Random.int (i+1) in 
    a.(i) <- a.(j);
    a.(j) <- e;
  ) a;
  a