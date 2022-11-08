open Test_lib
open Report


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


let genRandomLetterString () = 
  let length = (Random.int(5) + 2) in (* tamanho entre 2 a 6 *)
  let genChar () =
    int_of_char 'a' + Random.int(26) in
  let genChar _ =  String.make 1 (char_of_int(genChar())) in 
  String.concat "" (Array.to_list (Array.init length genChar))

let genRandomLetterStringRec () = 
  let length = (Random.int(5) + 2) in (* tamanho entre 2 a 6 *)
  let genChar () =
    int_of_char 'a' + Random.int(26) in
  let genChar _ =  String.make 1 (char_of_int(genChar())) in 
  (String.concat "" (Array.to_list (Array.init length genChar)), 0, 0, 1)

let hash_test = 
  set_progress "A corrigir pergunta 1" ;
  Section ([ Text "Exercício 1: " ; Code "solution" ],
            test_function_1_against_solution
              [%ty: string -> int] 
              "rolling_hash"
              ~sampler: (genRandomLetterString)
              ~gen: 8
              ["za"; "aaa"])

let hash_rec_test = 
  set_progress "A corrigir pergunta 2" ;
  Section ([ Text "Exercício 2: " ; Code "solution" ],
            (check_recursion "rolling_hash_rec") @@ fun () -> test_function_4_against_solution
              [%ty: string -> int -> int -> int -> int] 
              "rolling_hash_rec"
              ~sampler: (genRandomLetterStringRec)
              ~gen: 8
              [("za", 0, 0, 1); ("aaa", 0, 0, 1)])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ hash_test; hash_rec_test ]
