open Test_lib
open Report

(* samplers *)
let sample_Palindrome () = 
  let () = Random.self_init () in 
  if ((Random.int 2) = 0)
  then
    let l = (sample_list ~min_size: 5 ~max_size: 20 (fun () -> ((Random.int 1000) - 500)) ()) in
    if ((Random.int 2) = 0)
    then 
      l@(List.rev l)
    else
      ((l@[((Random.int 1000) - 500)])@(List.rev l))
  else
    sample_list ~min_size: 5 ~max_size: 20 (fun () -> ((Random.int 1000) - 500)) ()

let sample_allChar () = 
  let () = Random.self_init () in 
  char_of_int ((Random.int 95) + 32)

let sample_Slist () = 
  let () = Random.self_init () in 
  if ((Random.int 2) = 1)
  then let l = (sample_list ~min_size: 5 ~max_size: 20 (fun () -> ((Random.int 100) - 50))) in ((l()) , compare)
  else let l = (sample_list ~min_size: 5 ~max_size: 20 ~sorted: true (fun () -> ((Random.int 100) - 50))) in ((l()) , compare)

let sample_sorted_dupped_list () = 
  let s = ref (-1) in
  let f = ref (-1) in
  let () = Random.self_init () in
  let rec ranged_list f l = 
    if f > l 
    then []
    else
      match Random.int 4 with
      | 0 -> ranged_list (f+1) l
      | 1 -> f::(ranged_list (f+1) l)
      | 2 -> f::f::(ranged_list (f+1) l)
      | 3 -> f::f::f::(ranged_list (f+1) l) in
  begin
    if ((Random.int 2) = 0)
    then 
      s := -(Random.int 15)
    else
      s := (Random.int 50);
    f := (Random.int 16) + 15;
    ranged_list !s !f;
  end

let sample_dupped_list () = 
  let () = Random.self_init () in
  let size = Random.int(15) + 1 in
  let rec ranged_list pos size = 
    if pos > size 
    then []
    else
      let () =  Random.self_init () in
      ((Random.int 9) + 1)::(ranged_list (pos+1) size) in
    ranged_list 0 size

(* correctores *)
let somaS =
  set_progress "A corrigir pergunta 1" ;
  Section ([ Text "Exercício 1: " ; Code "soma" ],
  test_function_1_against_solution
  [%ty: int list -> int]
  "soma"
  ~sampler: (sample_list ~min_size: 5 ~max_size: 20 (fun () -> let () = Random.self_init () in  (Random.int 500)))
  ~gen: 8
  [([]); [1]])

let contaParesS =
  set_progress "A corrigir pergunta 2" ;
  Section ([ Text "Exercício 2: " ; Code "conta_pares" ],
  test_function_1_against_solution
  [%ty: int list -> int]
  "conta_pares"
  ~sampler: (sample_list ~min_size: 5 ~max_size: 20 (fun () -> let () = Random.self_init () in  ((Random.int 1000) - 500)))
  ~gen: 7
  [([]); [1]; [2]])

let palindromeS =
  set_progress "A corrigir pergunta 3" ;
  Section ([ Text "Exercício 3: " ; Code "palindroma" ],
  test_function_1_against_solution
  [%ty: int list -> bool]
  "palindroma"
  ~sampler: sample_Palindrome
  ~gen: 6
  [([]); [1]; [2; 2]; [2; 1; 2]])

let maiusculasS =
  set_progress "A corrigir pergunta 4" ;
  Section ([ Text "Exercício 4: " ; Code "maiusculas" ],
  test_function_1_against_solution
  [%ty: char list -> char list]
  "maiusculas"
  ~sampler: (sample_list ~min_size: 5 ~max_size: 20 sample_allChar)
  ~gen: 7
  [([]); ['a']; ['%']])

let is_sortedS =
  set_progress "A corrigir pergunta 5" ;
  Section ([ Text "Exercício 5: " ; Code "is_sorted" ],
  test_function_2_against_solution
  [%ty: int list -> (int -> int -> int) -> bool]
  "is_sorted"
  ~sampler: (sample_Slist)
  ~gen: 8
  [([], compare); ([-1;0;0;1], compare)])

let remove_sorted_dupsS =
  set_progress "A corrigir pergunta 6" ;
  Section ([ Text "Exercício 6: " ; Code "remove_duplicate_sorted" ],
  test_function_1_against_solution
  [%ty: int list -> int list]
  "remove_duplicate_sorted"
  ~sampler: sample_sorted_dupped_list
  ~gen: 8
  [([]); ([-1;0;0;1])])
  
let remove_dupsS =
  set_progress "A corrigir pergunta 7" ;
  Section ([ Text "Exercício 7: " ; Code "remove_duplicate" ],
  test_function_1_against_solution
  [%ty: int list -> int list]
  "remove_duplicate"
  ~sampler: sample_dupped_list
  ~gen: 8
  [([]); ([-1;0;0;1])])
  
let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ somaS; contaParesS; palindromeS; maiusculasS; is_sortedS; remove_sorted_dupsS; remove_dupsS ]
