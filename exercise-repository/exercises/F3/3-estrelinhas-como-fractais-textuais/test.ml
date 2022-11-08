open Test_lib
open Report

let test_estrelinhas () = 
    test_function_1_against_solution
    [%ty: int -> unit] 
    "estrelinhas"
    ~test_stdout: io_test_equals
    ~sampler:  (fun () -> let () = Random.self_init () in  if (Random.int 4) = 3 then int_of_float (2. ** (float_of_int (Random.int 7))) else ((Random.int 100) + 1))
    ~gen:5
    [8]

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  test_estrelinhas ()
