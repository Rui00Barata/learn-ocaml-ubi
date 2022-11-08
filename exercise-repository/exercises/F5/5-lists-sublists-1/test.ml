open Test_lib
open Report

let testAnswer1 = 
  set_progress "A corrigir exercício 1" ;
  Section ([ Text "Exercício 1: " ; Code "" ],
           test_variable_against_solution
            [%ty: 'a list list] 
            "resposta1")

let testAnswer2 = 
  set_progress "A corrigir exercício 2" ;
  Section ([ Text "Exercício 2: " ; Code "" ],
            test_variable_against_solution
            [%ty: char list list] 
            "resposta2")

let testAnswer3 = 
  set_progress "A corrigir exercício 3" ;
  Section ([ Text "Exercício 3: " ; Code "" ],
            test_variable_against_solution
            [%ty: char list list] 
            "resposta3")


let testSublista = 
  set_progress "A corrigir exercício 4" ;
  Section (
            [ Text "Exercício 4: " ; Code "" ],
            test_function_1_against_solution
              [%ty: char list -> char list list] 
              "sublista"
              ~sampler: (sample_list ~min_size: 3 ~max_size: 10 sample_char)
              ~gen: 7
              []
          )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ testAnswer1 ; testAnswer2 ; testAnswer3 ; testSublista ]
