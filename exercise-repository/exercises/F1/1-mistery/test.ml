open Test_lib
open Report

let correct_answer name =
 Section ([ Text "Exercício 1: " ; Code "solution" ],
  [Message ([ Text "Checking that " ; Code name ; Text "is correct "], Informative) ;
    Message ([ Text "Correct answer" ],  Success 5)])

let wrong_answer name =
 Section ([ Text "Exercício 1: " ; Code "solution" ],
  [Message ([ Text "Checking that " ; Code name ; Text "is correct "], Informative) ;
    Message ([ Text "Wrong answer" ],  Failure)])

let compatible_type ~expected:exp got =
  match Introspection.compatible_type exp ("Code." ^ got) with
  | Introspection.Absent     -> false
  | Introspection.Incompatible _ -> false
  | Introspection.Present () -> true

type correta = int   -> int   -> int   -> int
type errada1 = float -> int   -> int   -> int
type errada2 = int   -> float -> int   -> int
type errada3 = int   -> int   -> float -> int
type errada4 = int   -> int   -> int   -> float


let ex1 = 
  let r1 = compatible_type "correta" "p1" in
  let r2 = compatible_type "errada1" "p1" in
  let r3 = compatible_type "errada2" "p1" in
  let r4 = compatible_type "errada3" "p1" in
  let r5 = compatible_type "errada4" "p1" in

  match r1,r2,r3,r4,r5 with
    | true, false, false, false, false -> correct_answer "p1"
    | _  -> wrong_answer "p1"

let ex2 =
  set_progress "A corrigir pergunta 2" ;
  Section ([ Text "Exercício 2: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: int ] 
             "p2")

let ex3 =
  set_progress "A corrigir pergunta 3" ;
  Section ([ Text "Exercício 3: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p3")
            
let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ ex1; ex2; ex3]
