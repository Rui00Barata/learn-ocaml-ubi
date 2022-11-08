open Test_lib
open Report

let multipleChoice1_test =
  set_progress "Grading exercise 1" ;
  Section ([ Text "Exercise 1: " ; Code "solution" ],
            test_variable_against_solution
              [%ty: choice] 
              "p1")

let multipleChoice2_test =
  set_progress "Grading exercise 2" ;
  Section ([ Text "Exercise 2: " ; Code "solution" ],
            test_variable_against_solution
              [%ty: choice] 
              "p2")

let babbageS =
  set_progress "Grading exercise 3" ;
  Section ([ Text "Exercise 3: " ; Code "babbage" ],
            test_function_1_against_solution
            [%ty: unit -> int] 
            ~sampler: (fun () -> ())
            ~gen: 0
            "babbage"
            [ () ])

let valueS =
  set_progress "Grading exercise 4" ;
  Section ([ Text "Exercise 4: " ; Code "solution" ],
            test_variable_against_solution
              [%ty: int] 
              "p4")

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ multipleChoice1_test; multipleChoice2_test; babbageS; valueS ]
