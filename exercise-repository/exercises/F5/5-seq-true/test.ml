open Test_lib
open Report
open List
open Random


let max_seqQ = Section (
  [Text "max_seq"], 
  test_function_1_against_solution
  [%ty: bool list -> int]
  "max_seq"
  ~sampler: (sample_list ~min_size: 5 ~max_size: 20 ~dups: true (fun () -> let () = Random.self_init () in Random.bool()))
  ~gen: 10
  [])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [max_seqQ]