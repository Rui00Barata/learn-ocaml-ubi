open Test_lib
open Report
open List
open Random


let gray_listT = Section (
  [Text "Teste funcao gray_list"],
  test_function_1_against_solution
  [%ty: int -> string list]
  "gray_list"
  ~sampler: (fun () -> let () = Random.self_init () in Random.int(7))
  ~gen: 10
  [(-1);10;(-10)])

let gray_codeT = Section (
  [Text "Teste funcao gray_code"],
  test_function_1_against_solution
  [%ty: int -> string]
  "gray_code"
  ~sampler: (fun () -> let () = Random.self_init () in Random.int(115))
  ~gen: 10
  [])

let grayT = Section (
  [Text "Teste funcao gray"],
  test_function_1_against_solution
  [%ty: int -> int]
  "gray"
  ~sampler: (fun () -> let () = Random.self_init () in Random.int(15))
  ~gen: 10
  [(-1);10;(-10)])

let de_grayT = Section (
  [Text "Teste funcao de_gray"],
  test_function_1_against_solution
  [%ty: int -> int]
  "de_gray"
  ~sampler: (fun () -> let () = Random.self_init () in Random.int(15))
  ~gen: 10
  [(-1);10;(-10)])
  
let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [gray_listT; gray_codeT; grayT; de_grayT]