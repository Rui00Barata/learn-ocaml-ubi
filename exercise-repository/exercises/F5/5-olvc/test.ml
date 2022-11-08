open Test_lib
open Report
open List
open Random


let sort1T = Section (
  [Text "Teste da funcao sort1"],
  test_function_1_against_solution
  [%ty: int array -> int array]
  "sort1"
  ~sampler: (sample_array ~min_size: 15 ~max_size: 45 ~dups: true (fun () -> let () = Random.self_init () in Random.int(100)))
  ~gen: 10
  [])

let sort2T = Section (
  [Text "Teste da funcao sort2"],
  test_function_1_against_solution
  [%ty: int list -> int list]
  "sort2"
  ~sampler: (sample_list ~min_size: 15 ~max_size: 45 ~dups: true (fun () -> let () = Random.self_init () in Random.int(100)))
  ~gen: 10
  [])

let sort3T = Section (
  [Text "Teste da funcao sort3"],
  test_function_1_against_solution
  [%ty: int array -> int array]
  "sort3"
  ~sampler: (sample_array ~min_size: 15 ~max_size: 45 ~dups: true (fun () ->  let () = Random.self_init () in Random.int(100)))
  ~gen: 10
  [])

let sort4T = Section (
  [Text "Teste da funcao sort4"],
  test_function_1_against_solution
  [%ty: int list -> int list]
  "sort4"
  ~sampler: (sample_list ~min_size: 15 ~max_size: 45 ~dups: true (fun () -> let () = Random.self_init () in Random.int(200)))
  ~gen: 10
  [])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [sort1T; sort2T; sort3T; sort4T]