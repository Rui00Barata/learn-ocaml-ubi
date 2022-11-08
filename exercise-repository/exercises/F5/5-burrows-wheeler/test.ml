open Test_lib
open Report
open List
open Solution

let generate_word n = 
  let word = ref ([]) in
  let () = Random.self_init () in
  for i = 1 to n do
    word := Char.chr (97 + Random.int(25)) :: !word
  done; listachar_para_string (!word);;

let bwtT = Section (
[Text "Teste funcao bwt"],
test_function_1_against_solution
[%ty: string -> int * string]
"bwt"
~sampler: (fun () -> generate_word (Random.int(4)+5))
~gen: 10
["anagrama";"abraca";"yokohama";"tototo";"mosaissova"])

let debwtT = Section (
[Text "Teste funcao debwt"],
test_function_1_against_solution
[%ty: int * string -> string]
"debwt"
~sampler: (fun () -> (bwt (generate_word (Random.int(4)+5))))
~gen: 10
[(2,"caraab");(8,"hmooakya");(4,"tttooo");(4,"svaamsosio")])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [bwtT;debwtT]
