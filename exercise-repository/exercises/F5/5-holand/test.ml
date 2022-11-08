open Test_lib
open Report

let index = ref (-1)

let sample_element () = 
  let () = Random.self_init () in
  match Random.int 3 with
  | 0 -> (index := !index+1; (Blue, !index))
  | 1 -> (index := !index+1; (White, !index))
  | 2 -> (index := !index+1; (Red, !index))

let sample_dutch_flag () =
  begin 
    index := -1; 
    sample_array ~min_size: 5 ~max_size: 15 (sample_element) ()
  end

let dutch_FlagS () =
  test_function_1_against_solution
  [%ty: bola array -> bola array]
  "dutch_flag"
  ~sampler: sample_dutch_flag
  ~gen: 9
  [([||])]

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  dutch_FlagS ()
