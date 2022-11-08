(* 1 *) (* Escolha Multipla *)
let resposta = B

(* 2 *)
let horner x_value polynomial =
  let result = ref(0.0) in 
    match polynomial with
    |(a,b) -> List.iter (fun y -> result := !result *. x_value +. y) b;
  !result
(* 3 *)
let deriva polynomial = 
  let polinomio_resultante = ref [] in
  match polynomial with
  |(a,b)->(let i = ref (List.length b - 1) in  
            List.iter (fun y -> (if !i <> 0 then (polinomio_resultante := !polinomio_resultante @ [(float_of_int !i) *. y]; i := !i - 1;))) b;
          ((List.length !polinomio_resultante - 1),!polinomio_resultante))

(* 4 *)
let polinomio_derivado = ref [] 

let rec deriva_rt polinomio =                 
  match polinomio with
  |(a,b) -> if a = 0 then ((List.length !polinomio_derivado - 1),!polinomio_derivado)
            else match b with 
                |h::t -> (polinomio_derivado := !polinomio_derivado @ [h *. float_of_int a];
                          deriva_rt (a-1,t))

    