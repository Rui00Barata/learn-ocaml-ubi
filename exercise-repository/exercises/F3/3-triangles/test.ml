open Test_lib
open Report

let samplerInts () = 
  let () = Random.self_init () in
  Random.int 51

let triangulosS () = 
  test_function_1_against_solution
    [%ty: int -> int ]
    "triangulos"
    ~sampler: samplerInts
    ~gen: 9
    [0]

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  triangulosS ()
