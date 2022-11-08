open Test_lib
open Report

let sample_verificar_right () = 
  ([], [])
let sample_verificar_wrong () =
  ([], [])

let sample_verificar () = 
  let () = Random.self_init () in
  if (Random.int 2) = 0
  then sample_verificar_right ()
  else sample_verificar_wrong ()

let verificarS () =
  test_function_2_against_solution
  [%ty: char list -> char list -> bool ]
  "verificar"
  ~sampler: sample_verificar
  ~gen: 0
  [(['a';'(';'a';'b';'(';'b';')';'c';'(';'o';'k';'a';')';'n';')';'h'], []); (['a';'(';'a';'b';'(';'b';')';'c';'(';'o';'k';'a';'n';')';'h'], [])]

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  verificarS ()
