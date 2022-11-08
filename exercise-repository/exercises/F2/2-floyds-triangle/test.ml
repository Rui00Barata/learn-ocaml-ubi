open Test_lib
open Report

let print_triangle_Test () =
  test_function_1_against_solution
    [%ty: int -> unit] 
    "print_triangle"
    ~sampler: (fun () -> (Random.int 51))
    ~gen: 3
    ~test_stdout: (io_test_equals ~drop: [' '; '\t'])
    [0; 1; 100]

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  print_triangle_Test ()