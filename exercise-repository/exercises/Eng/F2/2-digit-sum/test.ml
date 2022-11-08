open Test_lib
open Report

(* auxiliary functions *)
let genNumber () = 
  let () = Random.self_init () in
  (Random.int 180000) - 90000

(* testing/grading functions *)
let getSumS =
  set_progress "Correcting question 1" ;
  Section ([ Text "Exercise 1: " ; Code "solution" ],
            test_function_1_against_solution
              [%ty: int -> int] 
              "get_sum_iter"
              ~sampler: (genNumber)
              ~gen: 7
              [0; -1; 999999])

(* 
 check_recursion name cb

   val name: string

 Checks if function name is recursive. Check_recursion checks 
   if there's a function call to name inside the function name.
*)
let check_recursion name cb =
  let module Error = struct exception RecursionCall end in

  find_binding code_ast name @@ fun expr ->
    let contains_recursion_call = Parsetree.(function
      | {pexp_desc = Pexp_apply ({pexp_desc = Pexp_ident {txt = id}}, _)} -> 
        if (Longident.last id) = name then raise Error.RecursionCall else []
      | _ -> []) in
    try
      ast_check_expr ~on_expression:contains_recursion_call expr;
      [Message ([Text "The function"; Code name; Text "does not contain a recursive call"], Failure)]
    with Error.RecursionCall -> cb ()

let getSumRecS =
  set_progress "Correcting question 2" ;
  Section ([ Text "Exercise 2: " ; Code "solution" ],
           check_recursion "get_sum_rec" @@ fun () -> test_function_1_against_solution
              [%ty: int -> int] 
              "get_sum_rec"
              ~sampler: (genNumber)
              ~gen: 7
              [0; -1; 999999])
              
let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [getSumS; getSumRecS]