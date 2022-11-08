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

(* 1 *)
type ('a, 'b, 'c) correta1_p1 = int list
type ('a, 'b, 'c) errada1_p1 = float list
type ('a, 'b, 'c) errada2_p1 = bool

let ex1 =
  let long_name, short_name = "Exercício 1: ", "p1" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in
  let r3 = compatible_type ("errada2_"^short_name) short_name in


  match r1,r2,r3 with
    | true,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

let ex2 =
  set_progress "A corrigir pergunta 2" ;
  Section ([ Text "Exercício 2: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p2")

let ex3 =
  set_progress "A corrigir pergunta 3" ;
  Section ([ Text "Exercício 3: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p3")


(* 4 *)
type ('a, 'b, 'c) correta1_p4 = ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c
type ('a, 'b, 'c) correta2_p4 = (int -> bool -> char) -> (int -> bool) -> int -> char
type ('a, 'b, 'c) correta3_p4 = (float -> int -> string) -> (float -> int) -> float -> string

let ex4 =
  let long_name, short_name = "Exercício 4: ", "p4" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("correta2_"^short_name) short_name in
  let r3 = compatible_type ("correta3_"^short_name) short_name in

  match r1,r2,r3 with
    | true,true,true -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name


(* 5 *)
type ('a, 'b, 'c) correta1_p5 = int list
type ('a, 'b, 'c) errada1_p5 = float list
type ('a, 'b, 'c) errada2_p5 = char

let ex5 =
  let long_name, short_name = "Exercício 5: ", "p5" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in
  let r3 = compatible_type ("errada2_"^short_name) short_name in

  match r1,r2,r3 with
    | true,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

let ex6 =
  set_progress "A corrigir pergunta 6" ;
  Section ([ Text "Exercício 6: " ; Code "solution" ],
            test_variable_against_solution
             [%ty: escolha ] 
             "p6")


(* 7 *)
type ('a, 'b, 'c) correta1_p7 = _weak1 -> _weak2 -> _weak1
type ('a, 'b, 'c) errada1_p7 = int -> _weak2 -> _weak1
type ('a, 'b, 'c) errada2_p7 = _weak1 -> int -> _weak1
type ('a, 'b, 'c) errada3_p7 = _weak1 -> _weak2 -> int

let ex7 =
  let long_name, short_name = "Exercício 7: ", "p7" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in
  let r3 = compatible_type ("errada2_"^short_name) short_name in
  let r4 = compatible_type ("errada3_"^short_name) short_name in

  match r1,r2,r3,r4 with
    | true,false,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name


(* 8 *)
type ('a, 'b, 'c) correta1_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada1_p8 = ((((float -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada2_p8 = ((((int -> float) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada3_p8 = ((((int -> int) -> float -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada4_p8 = ((((int -> int) -> int -> float) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada5_p8 = ((((int -> int) -> int -> int) -> (float -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada6_p8 = ((((int -> int) -> int -> int) -> (int -> float) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada7_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> float -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada8_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> float) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada9_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((float -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada10_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> float) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada11_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> float -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada12_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> float) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada13_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (float -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada14_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> float) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada15_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> float -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada16_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> float) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada17_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((float -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada18_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> float) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada19_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> float -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada20_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> float) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada21_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (float -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada22_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> float) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada23_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> float -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada24_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> float) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada25_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((float -> int) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada26_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> float) -> int -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada27_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> float -> int) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada28_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> float) -> (int -> int) -> int -> int
type ('a, 'b, 'c) errada29_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (float -> int) -> int -> int
type ('a, 'b, 'c) errada30_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> float) -> int -> int
type ('a, 'b, 'c) errada31_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> float -> int
type ('a, 'b, 'c) errada32_p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> float

let ex8 =
  let long_name, short_name = "Exercício 8: ", "p8" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in
  let r3 = compatible_type ("errada2_"^short_name) short_name in
  let r4 = compatible_type ("errada3_"^short_name) short_name in
  let r5 = compatible_type ("errada4_"^short_name) short_name in
  let r6 = compatible_type ("errada5_"^short_name) short_name in
  let r7 = compatible_type ("errada6_"^short_name) short_name in
  let r8 = compatible_type ("errada7_"^short_name) short_name in
  let r9 = compatible_type ("errada8_"^short_name) short_name in
  let r10 = compatible_type ("errada9_"^short_name) short_name in
  let r11 = compatible_type ("errada10_"^short_name) short_name in
  let r12 = compatible_type ("errada11_"^short_name) short_name in
  let r13 = compatible_type ("errada12_"^short_name) short_name in
  let r14 = compatible_type ("errada13_"^short_name) short_name in
  let r15 = compatible_type ("errada14_"^short_name) short_name in
  let r16 = compatible_type ("errada15_"^short_name) short_name in
  let r17 = compatible_type ("errada16_"^short_name) short_name in
  let r18 = compatible_type ("errada17_"^short_name) short_name in
  let r19 = compatible_type ("errada18_"^short_name) short_name in
  let r20 = compatible_type ("errada19_"^short_name) short_name in
  let r21 = compatible_type ("errada20_"^short_name) short_name in
  let r22 = compatible_type ("errada21_"^short_name) short_name in
  let r23 = compatible_type ("errada22_"^short_name) short_name in
  let r24 = compatible_type ("errada23_"^short_name) short_name in
  let r25 = compatible_type ("errada24_"^short_name) short_name in
  let r26 = compatible_type ("errada25_"^short_name) short_name in
  let r27 = compatible_type ("errada26_"^short_name) short_name in
  let r28 = compatible_type ("errada27_"^short_name) short_name in
  let r29 = compatible_type ("errada28_"^short_name) short_name in
  let r30 = compatible_type ("errada29_"^short_name) short_name in
  let r31 = compatible_type ("errada30_"^short_name) short_name in
  let r32 = compatible_type ("errada31_"^short_name) short_name in
  let r33 = compatible_type ("errada32_"^short_name) short_name in

  match r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31,r32,r33 with
    | true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ ex1; ex2; ex3; ex4; ex5; ex6; ex7; ex8 ]
