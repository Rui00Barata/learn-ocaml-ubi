open Test_lib
open Report

let sample_value () =
  let () = Random.self_init () in
  ((Random.int 201) - 100)

let sample_score () = 
  let l =  sample_list ~min_size: 25 ~max_size: 75 sample_value () in
  (List.length l, l)

let scoreS () =
  test_function_2_against_solution
  [%ty: int -> int list -> int ]
  "score"
  ~sampler: sample_score
  ~gen: 9
  [(1, [-3])]

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  scoreS ()

