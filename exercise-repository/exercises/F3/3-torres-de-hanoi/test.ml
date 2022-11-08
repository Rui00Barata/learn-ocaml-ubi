open Test_lib
open Report
open List
open Random

let test_hanoi = Section (
  [Text "Teste função"; Code "hanoi"], 
  test_function_1_against_solution
    [%ty: int -> unit]
    "hanoi"
    ~gen: 0
    ~test_stdout: (io_test_equals)
    [1;2;3;4;5;6;7;8])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [test_hanoi]