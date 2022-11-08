open Test_lib
open Report
open List
open Random


let max_kadaneQ = Section ( 
  [Text "Testes da função max_kadane"],
  test_function_1_against_solution
  [%ty: int list -> int]
  "max_kadane"
  ~sampler: (sample_list ~min_size: 5 ~max_size: 20 ~dups: true (fun () -> Random.int(10) - 5))
  ~gen: 10
  [[-3; 6; -3; 4; -1; 2; 2; -5; 4]])

let kadaneQ = Section ( 
  [Text "Testes da função kadane"],
  test_function_1_against_solution
  [%ty: int list -> int list]
  "kadane"
  ~sampler: (sample_list ~min_size: 5 ~max_size: 20 ~dups: true (fun () -> let () = Random.self_init () in Random.int(10) - 5)) 
  ~gen: 10
  [[-3; 6; -3; 4; -1; 2; 2; -5; 4]])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [max_kadaneQ; kadaneQ] 