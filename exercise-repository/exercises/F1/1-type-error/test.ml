open Test_lib
open Report

let ex1 =
  set_progress "A corrigir pergunta 1" ;
  Section ([ Text "Exercício 1: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p1")

let ex2 =
  set_progress "A corrigir pergunta 2" ;
  Section ([ Text "Exercício 2: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p2")

let ex3 =
  set_progress "A corrigir pergunta 3" ;
  Section ([ Text "Exercício 3: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p3")

let ex4 =
  set_progress "A corrigir pergunta 4" ;
  Section ([ Text "Exercício 4: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p4")
            
let ex5 =
  set_progress "A corrigir pergunta 5" ;
  Section ([ Text "Exercício 5: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p5")

let ex6 =
  set_progress "A corrigir pergunta 6" ;
  Section ([ Text "Exercício 6: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p6")

let ex7 =
  set_progress "A corrigir pergunta 7" ;
  Section ([ Text "Exercício 7: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p7")

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ ex1; ex2; ex3; ex4; ex5; ex6; ex7]
