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
type 'a correta1_p1 = 'a ref -> 'a
type 'a correta2_p1 = int ref -> int
type 'a correta3_p1 = float ref -> float
type 'a errada1_p1 = int -> 'a

let ex1 =
  let long_name, short_name = "Exercício 1 ", "p1" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("correta2_"^short_name) short_name in
  let r3 = compatible_type ("correta3_"^short_name) short_name in
  let r4 = compatible_type ("errada1_"^short_name) short_name in

  match r1,r2,r3,r4 with
    | true,true,true,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

(* 2 *)
type 'a correta1_p2 = ('a -> bool) -> 'a -> ('a -> 'a -> bool) -> 'a -> bool
type 'a correta2_p2 = (int -> bool) -> int -> (int -> int -> bool) -> int -> bool
type 'a correta3_p2 = (float -> bool) -> float -> (float -> float -> bool) -> float -> bool
type 'a errada1_p2 = ('a -> int) -> 'a -> ('a -> 'a -> bool) -> 'a -> bool
type 'a errada2_p2 = ('a -> bool) -> 'a -> ('a -> 'a -> int) -> 'a -> bool
type 'a errada3_p2 = ('a -> bool) -> 'a -> ('a -> 'a -> bool) -> 'a -> int

let ex2 =
  let long_name, short_name = "Exercício 2 ", "p2" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("correta2_"^short_name) short_name in
  let r3 = compatible_type ("correta3_"^short_name) short_name in
  let r4 = compatible_type ("errada1_"^short_name) short_name in
  let r5 = compatible_type ("errada2_"^short_name) short_name in
  let r6 = compatible_type ("errada3_"^short_name) short_name in

  match r1,r2,r3,r4,r5,r6 with
    | true,true,true,false,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

(* 3 *)
type 'a correta1_p3 = (bool ref -> bool) -> bool
type 'a errada1_p3 = (int ref -> bool) -> bool
type 'a errada2_p3 = (bool ref -> int) -> bool
type 'a errada3_p3 = (bool ref -> bool) -> int
type 'a errada4_p3 = (float -> bool) -> bool

let ex3 =
  let long_name, short_name = "Exercício 3 ", "p3" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in
  let r3 = compatible_type ("errada2_"^short_name) short_name in
  let r4 = compatible_type ("errada3_"^short_name) short_name in
  let r5 = compatible_type ("errada4_"^short_name) short_name in

  match r1,r2,r3,r4,r5 with
    | true,false,false,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ ex1; ex2; ex3]
