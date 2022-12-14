open Test_lib
open Report

let multipleChoice1_test =
  set_progress "A corrigir pergunta 1" ;
  Section ([ Text "Exercício 1: " ; Code "solution" ],
            test_variable_against_solution
              [%ty: escolha] 
              "mc1")

let multipleChoice2_test =
  set_progress "A corrigir pergunta 2" ;
  Section ([ Text "Exercício 2: " ; Code "solution" ],
            test_variable_against_solution
              [%ty: escolha] 
              "p2")

let babbageS =
  set_progress "A corrigir pergunta 3" ;
  Section ([ Text "Exercício 3: " ; Code "babbage" ],
            test_function_1_against_solution
            [%ty: unit -> int] 
            ~sampler: (fun () -> ())
            ~gen: 0
            "babbage"
            [ () ])

let valueS =
  set_progress "A corrigir pergunta 4" ;
  Section ([ Text "Exercício 4: " ; Code "solution" ],
            test_variable_against_solution
              [%ty: int] 
              "p4")

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ multipleChoice1_test; multipleChoice2_test; babbageS; valueS ]
