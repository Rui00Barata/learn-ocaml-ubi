open Test_lib
open Report

let ex1 =
  set_progress "A corrigir pergunta 1" ;
  Section ([ Text "quarto_pi: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: float ] 
             "quarto_pi")

let ex2 =
  set_progress "A corrigir pergunta 2" ;
  Section ([ Text "na_ordem: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: bool ] 
             "na_ordem")

let ex3 =
  set_progress "A corrigir pergunta 3" ;
  Section ([ Text "positivo: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: bool ] 
             "positivo")

let ex4 =
  set_progress "A corrigir pergunta 4" ;
  Section ([ Text "duplo_positivo: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: float ] 
             "duplo_positivo")

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ ex1; ex2; ex3; ex4 ]
