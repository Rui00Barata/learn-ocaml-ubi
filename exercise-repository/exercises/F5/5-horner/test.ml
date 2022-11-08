open Test_lib
open Report
open List
open Random

exception SeenLoops

let polinomio_gen () = 
  let lista = (sample_list ~min_size:3 ~max_size:10 (fun () -> let () = Random.self_init () in Random.float(10.)) ()) in
  let n = List.length lista in 
  (n,(lista))

let hornerR = Section ( 
  [Text "Testes da função horner"],
  test_function_2_against_solution
  [%ty: float -> (int * (float list)) -> float]
  "horner"
  ~sampler: (fun () -> (Random.float(10.),polinomio_gen ()))
  ~gen: 10
  [])

let derivaA = Section ( 
  [Text "Testes da função deriva"],
  test_function_1_against_solution
  [%ty: (int * (float list)) ->  (int * (float list))]
  "deriva"
  ~sampler:  (polinomio_gen)
  ~gen: 10
  [])

let failWith msg =
  [Message ([Text msg], Failure)]

let checkForLoops cb =
  find_binding code_ast "deriva_rt" @@ fun expr ->

  let contains_loops = Parsetree.(function
    | { pexp_desc = Pexp_for _ } | { pexp_desc = Pexp_while _ } -> raise SeenLoops
    | _ -> [])
  in
  try
    ast_check_expr ~on_expression:contains_loops expr;
    cb ()
  with SeenLoops ->
  failWith "Loops não são permitidos neste exercício! Proponha uma versão recursiva"          
    
let deriva_rtT = Section ( 
  [Text "Testes da função deriva_rt"],
  test_function_1_against_solution
  [%ty: (int*(float list)) -> (int*(float list))] 
  "deriva_rt"
  ~sampler: (polinomio_gen)
  ~gen: 10
  [])

let alineaT = Section(
  [Text "Testes da variavel resposta"],
  test_variable_against_solution
  [%ty: escolha]
  "resposta")

let () =
  set_result                @@
  ast_sanity_check code_ast @@  fun () ->
  checkForLoops             @@  fun () -> 
  [hornerR; derivaA; deriva_rtT;alineaT]