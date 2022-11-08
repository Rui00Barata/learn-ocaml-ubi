open Test_lib
open Report
open Learnocaml_report

let samplePoints () = 
  let () = Random.self_init () in
  let x1 = if (Random.int 2 = 1) then -.(Random.float 50.0) else (Random.float 50.0) and
  y1 = if (Random.int 2 = 1) then -.(Random.float 50.0) else (Random.float 50.0) and
  x2 = if (Random.int 2 = 1) then -.(Random.float 50.0) else (Random.float 50.0) and
  y2 = if (Random.int 2 = 1) then -.(Random.float 50.0) else (Random.float 50.0) in 
  ((x1, y1), (x2, y2))

let testDistancia =
  set_progress "A corrigir pergunta 1" ;
  Section ([ Text "Exercicio 1: " ; Code "distancia" ],
  test_function_2_against_solution
    [%ty: (float * float) -> (float * float) -> float] 
    "distancia"
    ~sampler: samplePoints
    ~gen: 8
    [((0.0,0.0), (2.0,2.0));  ((2.0,2.0), (2.0,2.0))])

let epsilon = 1.e-10
let (=.) a b =  (if a>b then a-.b else b -.a) < epsilon

let areaS = 
  let test = ref [] in
  set_progress "A corrigir pergunta 2";
  let t = test_function_1_against_solution
    [%ty: float -> float] 
    "area"
    ~sampler: (fun () ->  let () = Random.self_init () in Random.float(35.) +. 5.)
    ~gen: 8
    ~after: (fun a (b,c,d) (e,f,g) -> if b =. e then test := Message ([Text "Correct value"; Code (string_of_float b)], Success 1)::Message ([Text "Computing area "; Code (string_of_float a)], Informative)::!test else test := Message ([Text "Wrong value"; Code (string_of_float b)], Failure)::Message ([Text "Computing area "; Code (string_of_float a)], Informative)::!test; !test) 
    [0.; 100.] in
    Section ([ Text "Exercicio 2: " ; Code "area" ], ((List.hd t)::(List.rev !test)))

let sin2xS = 
  set_progress "A corrigir pergunta 3";
  Section ([ Text "Exercicio 3: " ; Code "sin2x" ],
  test_function_1_against_solution
    [%ty: float -> float] 
    "sin2x"
    ~sampler: (fun () -> (sample_float() +. 5.))
    ~gen: 8
    [0.; 100.])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ testDistancia; areaS; sin2xS ]
