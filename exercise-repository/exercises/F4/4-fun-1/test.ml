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


type ('a, 'b, 'c) correta_p1 = int * float
type ('a, 'b, 'c) errada1_p1  = bool -> float
type ('a, 'b, 'c) errada2_p1  = int -> bool

let ex1 = 
  let r1 = compatible_type "correta_p1" "p1" in
  let r2 = compatible_type "errada1_p1" "p1" in
  let r3 = compatible_type "errada2_p1" "p1" in

  match r1,r2,r3 with
    | true, false, false -> correct_answer "Exercício 1: " "p1"
    | _  -> wrong_answer "Exercício 1: " "p1"

(* 2 *)
type ('a, 'b, 'c) correta1_p2 = int -> (int -> 'a) -> int -> 'a
type ('a, 'b, 'c) correta2_p2 = int -> (int -> int) -> int -> int
type ('a, 'b, 'c) correta3_p2 = int -> (int -> float) -> int -> float
type ('a, 'b, 'c) errada1_p2  = float -> (int -> 'a) -> int -> 'a
type ('a, 'b, 'c) errada2_p2  = int -> (float -> 'a) -> int -> 'a
type ('a, 'b, 'c) errada3_p2  = int -> (int -> 'a) -> float -> 'a

let ex2 = 
  let r1 = compatible_type "correta1_p2" "p2" in
  let r2 = compatible_type "correta2_p2" "p2" in
  let r3 = compatible_type "correta3_p2" "p2" in
  let r4 = compatible_type "errada1_p2" "p2" in
  let r5 = compatible_type "errada2_p2" "p2" in
  let r6 = compatible_type "errada3_p2" "p2" in

  match r1,r2,r3,r4,r5,r6 with
    | true, true, true, false, false, false -> correct_answer "Exercício 2: " "p2"
    | _  -> wrong_answer "Exercício 2: " "p2"

(* 3 *)
type ('a, 'b, 'c) correta1_p3 = 'a -> ('b -> 'c) -> 'b -> 'c
type ('a, 'b, 'c) correta2_p3 = int -> (float -> bool) -> float -> bool
type ('a, 'b, 'c) correta3_p3 = float -> (string -> int) -> string -> int

let ex3 =
  let r1 = compatible_type "correta1_p3" "p3" in
  let r2 = compatible_type "correta2_p3" "p3" in
  let r3 = compatible_type "correta3_p3" "p3" in

  match r1,r2,r3 with
    | true, true, true -> correct_answer "Exercício 3: " "p3"
    | _  -> wrong_answer "Exercício 3: " "p3"

(* 4 *)
type ('a, 'b, 'c) correta1_p4 = (int -> 'a) -> (int -> int) -> int -> 'a
type ('a, 'b, 'c) correta2_p4 = (int -> string) -> (int -> int) -> int -> string
type ('a, 'b, 'c) correta3_p4 = (int -> bool) -> (int -> int) -> int -> bool
type ('a, 'b, 'c) errada1_p4 = (float -> 'a) -> (int -> int) -> int -> 'a
type ('a, 'b, 'c) errada2_p4 = (int -> 'a) -> (float -> int) -> int -> 'a
type ('a, 'b, 'c) errada3_p4 = (int -> 'a) -> (int -> float) -> int -> 'a
type ('a, 'b, 'c) errada4_p4 = (int -> 'a) -> (int -> int) -> float -> 'a


let ex4 =
  let long_name, short_name = "Exercício 4: ", "p4" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("correta2_"^short_name) short_name in
  let r3 = compatible_type ("correta3_"^short_name) short_name in
  let r4 = compatible_type ("errada1_"^short_name) short_name in
  let r5 = compatible_type ("errada2_"^short_name) short_name in
  let r6 = compatible_type ("errada3_"^short_name) short_name in
  let r7 = compatible_type ("errada4_"^short_name) short_name in

  match r1,r2,r3,r4,r5,r6,r7 with
    | true,true,true,false,false,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

(* 5 *)
type ('a, 'b, 'c) correta1_p5 = ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b
type ('a, 'b, 'c) correta2_p5 = (int -> float) -> (bool -> int) -> bool -> float
type ('a, 'b, 'c) correta3_p5 = (string -> bool) -> (char -> string) -> char -> bool

let ex5 =
  let long_name, short_name = "Exercício 5: ", "p5" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("correta2_"^short_name) short_name in
  let r3 = compatible_type ("correta3_"^short_name) short_name in

  match r1,r2,r3 with
    | true,true,true -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

(* 6 *)
type ('a, 'b, 'c) correta1_p6 = 'a -> ('a -> 'b) -> ('b -> 'c) -> 'c
type ('a, 'b, 'c) correta2_p6 = int -> (int -> bool) -> (bool -> char) -> char
type ('a, 'b, 'c) correta3_p6 = float -> (float -> string) -> (string -> int) -> int

let ex6 =
  let long_name, short_name = "Exercício 6: ", "p6" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("correta2_"^short_name) short_name in
  let r3 = compatible_type ("correta3_"^short_name) short_name in

  match r1,r2,r3 with
    | true,true,true -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name


(* 7 *)
type ('a, 'b, 'c) correta1_p7 = int list ref
type ('a, 'b, 'c) errada1_p7 = float list ref
type ('a, 'b, 'c) errada2_p7 = string ref

let ex7 =
  let long_name, short_name = "Exercício 7: ", "p7" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in
  let r3 = compatible_type ("errada2_"^short_name) short_name in

  match r1,r2,r3 with
    | true,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

(* 8 *)
type ('a, 'b, 'c) correta1_p8 = _weak1 list ref
type ('a, 'b, 'c) errada1_p8 = float list ref
type ('a, 'b, 'c) errada2_p8 = string ref

let ex8 =
  let long_name, short_name = "Exercício 8: ", "p8" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in
  let r3 = compatible_type ("errada2_"^short_name) short_name in

  match r1,r2,r3 with
    | true,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

(* 9 *)
type ('a, 'b, 'c) correta1_p9 = (int -> int) list
type ('a, 'b, 'c) errada1_p9 = (float -> int) list
type ('a, 'b, 'c) errada2_p9 = (int -> float) list
type ('a, 'b, 'c) errada3_p9 = float

let ex9 =
  let long_name, short_name = "Exercício 9: ", "p9" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in
  let r3 = compatible_type ("errada2_"^short_name) short_name in
  let r4 = compatible_type ("errada3_"^short_name) short_name in

  match r1,r2,r3,r4 with
    | true,false,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

(* 10 *)
type ('a, 'b, 'c) correta1_p10 = int
type ('a, 'b, 'c) errada1_p10 = float

let ex10 =
  let long_name, short_name = "Exercício 10: ", "p10" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("errada1_"^short_name) short_name in

  match r1,r2 with
    | true,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name

(* 11 *)
type ('a, 'b, 'c) correta1_p11 = ('a -> 'b) -> ('b list -> 'c) -> 'a list -> 'c
type ('a, 'b, 'c) correta2_p11 = (int -> float) -> (float list -> string) -> int list -> string
type ('a, 'b, 'c) correta3_p11 = (bool -> char) -> (char list -> int) -> bool list -> int
type ('a, 'b, 'c) errada1_p11 = ('a -> 'b) -> (int -> 'c) -> 'a list -> 'c
type ('a, 'b, 'c) errada1_p11 = ('a -> 'b) -> ('b list -> 'c) -> float -> 'c


let ex11 =
  let long_name, short_name = "Exercício 11: ", "p11" in
  let r1 = compatible_type ("correta1_"^short_name) short_name in
  let r2 = compatible_type ("correta2_"^short_name) short_name in
  let r3 = compatible_type ("correta3_"^short_name) short_name in
  let r4 = compatible_type ("errada1_"^short_name) short_name in
  let r5 = compatible_type ("errada2_"^short_name) short_name in

  match r1,r2,r3,r4,r5 with
    | true,true,true,false,false -> correct_answer long_name short_name
    | _  -> wrong_answer long_name short_name


let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  [ex1; ex2; ex3; ex4; ex5; ex6; ex7; ex8; ex9; ex10; ex11]
