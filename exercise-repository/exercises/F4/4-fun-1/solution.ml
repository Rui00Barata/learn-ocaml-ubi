type ('a, 'b, 'c) p1 = int * float

type ('a, 'b, 'c) p2 = int -> (int -> 'a) -> int -> 'a

type ('a, 'b, 'c) p3 = 'a -> ('b -> 'c) -> 'b -> 'c

type ('a, 'b, 'c) p4 = (int -> 'a) -> (int -> int) -> int -> 'a

type ('a, 'b, 'c) p5 = ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b

type ('a, 'b, 'c) p6 = 'a -> ('a -> 'b) -> ('b -> 'c) -> 'c

type ('a, 'b, 'c) p7 = int list ref

type ('a, 'b, 'c) p8 = _weak1 list ref

type ('a, 'b, 'c) p9 = (int -> int) list

type ('a, 'b, 'c) p10 = int

type ('a, 'b, 'c) p11 = ('a -> 'b) -> ('b list -> 'c) -> 'a list -> 'c