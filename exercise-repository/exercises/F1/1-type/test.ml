open Test_lib
open Report

let correct_answer id name =
 Section ([ Text id ; Code "solution" ],
  [Message ([ Text "Checking that " ; Code name ; Text "is correct "], Informative) ;
    Message ([ Text "Correct answer" ],  Success 5)])

let wrong_answer id name =
 Section ([ Text id ; Code "solution" ],
  [Message ([ Text "Checking that " ; Code name ; Text "is correct "], Informative) ;
    Message ([ Text "Wrong answer" ],  Failure)])

let compatible_type ~expected:exp got =
  match Introspection.compatible_type exp ("Code." ^ got) with
  | Introspection.Absent     -> false
  | Introspection.Incompatible _ -> false
  | Introspection.Present () -> true

type ('a, 'b) correta_p1 = int -> int
type ('a, 'b) errada1_p1  = float -> int
type ('a, 'b) errada2_p1  = int -> float

let ex1 = 
  let r1 = compatible_type "correta_p1" "p1" in
  let r2 = compatible_type "errada1_p1" "p1" in
  let r3 = compatible_type "errada2_p1" "p1" in

  match r1,r2,r3 with
    | true, false, false -> correct_answer "Exercício 1: " "p1"
    | _  -> wrong_answer "Exercício 1: " "p1"


(* 2 *)
type ('a, 'b) correta_p2 = float -> int  -> float
type ('a, 'b) errada1_p2 = bool  -> int   -> float
type ('a, 'b) errada2_p2 = float -> bool -> float
type ('a, 'b) errada3_p2 = float -> int  -> bool

let ex2 = 
  let r1 = compatible_type "correta_p2" "p2" in
  let r2 = compatible_type "errada1_p2" "p2" in
  let r3 = compatible_type "errada2_p2" "p2" in
  let r4 = compatible_type "errada3_p2" "p2" in
  match r1,r2,r3,r4 with
    | true, false, false, false -> correct_answer "Exercício 2: " "p2"
    | _  -> wrong_answer "Exercício 2: " "p2"


(* 3 *)
type ('a, 'b) correta_p3 = float
type ('a, 'b) errada_p3  = int

let ex3 = 
  let r1 = compatible_type "correta_p3" "p3" in
  let r2 = compatible_type "errada_p3" "p3" in
  match r1,r2 with
    | true, false -> correct_answer "Exercício 3: " "p3"
    | _  -> wrong_answer "Exercício 3: " "p3"


(* 4 *)
type ('a, 'b) correta_p4 = float
type ('a, 'b) errada_p4  = int


let ex4 = 
  let r1 = compatible_type "correta_p4" "p4" in
  let r2 = compatible_type "errada_p4" "p4" in
  match r1,r2 with
    | true, false -> correct_answer "Exercício 4: " "p4"
    | _  -> wrong_answer "Exercício 4: " "p4"


(* 5 *)
type ('a, 'b) correta_p5 = bool -> bool * bool -> bool
type ('a, 'b) errada1_p5 = int  -> bool * bool -> bool
type ('a, 'b) errada2_p5 = bool -> int  * bool -> bool
type ('a, 'b) errada3_p5 = bool -> bool * int  -> bool
type ('a, 'b) errada4_p5 = bool -> bool * bool -> int

let ex5 = 
  let r1 = compatible_type "correta_p5" "p5" in
  let r2 = compatible_type "errada1_p5" "p5" in
  let r3 = compatible_type "errada2_p5" "p5" in
  let r4 = compatible_type "errada3_p5" "p5" in
  let r5 = compatible_type "errada4_p5" "p5" in
  match r1,r2,r3,r4,r5 with
    | true, false, false, false, false -> correct_answer "Exercício 5: " "p5"
    | _  -> wrong_answer "Exercício 5: " "p5"


(* 6 *)
type ('a, 'b) correta1_p6 = 'a -> 'a -> 'b -> bool * 'b
type ('a, 'b) correta2_p6 = int -> int -> float -> bool * float
type ('a, 'b) correta3_p6 = float -> float -> int -> bool * int
type ('a, 'b) errada_p6 = 'b -> 'b -> 'b -> int * 'b

let ex6 = 
  let r1 = compatible_type "correta1_p6" "p6" in
  let r2 = compatible_type "correta2_p6" "p6" in
  let r3 = compatible_type "correta3_p6" "p6" in
  let r4 = compatible_type "errada_p6" "p6" in

  match r1,r2,r3,r4 with
    | true, true, true, false -> correct_answer "Exercício 6: " "p6"
    | _  -> wrong_answer "Exercício 6: " "p6"


(* 7 *)
type ('a, 'b) correta1_p7 = 'a -> 'a -> 'a -> bool * 'a
type ('a, 'b) correta2_p7 = int -> int -> int -> bool * int
type ('a, 'b) correta3_p7 = float -> float -> float -> bool * float
type ('a, 'b) errada_p7 = 'b -> 'b -> 'b -> int * 'b

let ex7 = 
  let r1 = compatible_type "correta1_p7" "p7" in
  let r2 = compatible_type "correta2_p7" "p7" in
  let r3 = compatible_type "correta3_p7" "p7" in
  let r4 = compatible_type "errada_p7" "p7" in

  match r1,r2,r3,r4 with
    | true, true, true, false -> correct_answer "Exercício 7: " "p7"
    | _  -> wrong_answer "Exercício 7: " "p7"

(* 8 *)
type ('a, 'b) correta1_p8 = 'a -> 'a -> 'a -> bool * 'a
type ('a, 'b) correta2_p8 = int -> int -> int -> bool * int
type ('a, 'b) correta3_p8 = float -> float -> float -> bool * float
type ('a, 'b) errada_p8 = 'b -> 'b -> 'b -> int * 'b

let ex8 = 
  let r1 = compatible_type "correta1_p8" "p8" in
  let r2 = compatible_type "correta2_p8" "p8" in
  let r3 = compatible_type "correta3_p8" "p8" in
  let r4 = compatible_type "errada_p8" "p8" in

  match r1,r2,r3,r4 with
    | true, true, true, false -> correct_answer "Exercício 8: " "p8"
    | _  -> wrong_answer "Exercício 8: " "p8"

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ ex1; ex2; ex3; ex4; ex5; ex6; ex7; ex8 ]
