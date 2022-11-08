open Test_lib
open Report
open List
open Random
open Solution


let montanhas_sampler () =
  Random.int(15), Random.int(15)
  
let test_montanhas = Section(
  [Text "Teste função"; Code "montanhas"],
  test_function_2_against_solution
  [%ty: int -> int -> int option]
  "montanhas"
  ~sampler: (fun () -> montanhas_sampler ())
  ~gen: 15
  [(4,3);(1,0); (30, 30)])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [test_montanhas]