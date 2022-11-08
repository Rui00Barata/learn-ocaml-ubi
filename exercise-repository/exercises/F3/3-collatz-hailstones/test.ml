open Test_lib
open Report
open Random

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

let test_collatz = Section(
  [Text "Teste funcao"; Code "collatz"], 
    check_recursion "collatz" @@ fun () -> test_function_1_against_solution
      [%ty: int -> int list]
      "collatz"
      ~sampler: (fun () -> let () = Random.self_init () in Random.int(30)+1)
      ~gen: 10
      [])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [test_collatz]