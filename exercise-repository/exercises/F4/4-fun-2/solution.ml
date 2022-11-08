type ('a, 'b, 'c) p1 = int list

let p2 = A

let p3 = D

type ('a, 'b, 'c) p4 = ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c

type ('a, 'b, 'c) p5 = int list

let p6 = D

type ('a, 'b, 'c) p7 = _weak1 -> _weak2 -> _weak1

type ('a, 'b, 'c) p8 = ((((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> (((int -> int) -> int -> int) -> (int -> int) -> int -> int) -> ((int -> int) -> int -> int) -> (int -> int) -> int -> int