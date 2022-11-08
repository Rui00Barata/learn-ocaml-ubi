open Test_lib
open Report

let ex1 =
  set_progress "A corrigir pergunta 1" ;
  Section ([ Text "Exercício 1: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "resposta")

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ ex1 ]
