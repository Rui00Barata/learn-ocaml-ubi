open Test_lib
open Report

let ex1 =
  test_variable_against_solution
    [%ty: escolha ] 
    "resposta"

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  ex1
