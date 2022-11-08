(* 1 *)
let rec exp_rapida x n = 
  match n with 
  | 0 -> 1
  | 1 -> x 
  | _ -> 
    let t  = exp_rapida x (n / 2) in
    let tt = t * t in (if n mod 2 = 0 then tt else tt * x)

(* 2 *)
let resposta = D