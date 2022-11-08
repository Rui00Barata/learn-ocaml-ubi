Para cada uma das expressões seguintes, indicar, das escolhas possíveis, qual é o tipo certo.

**Nota:** Se achar que a opção correta é a `A` então deverá responder da seguinte forma: `let resposta = A`

1. `let f x = if x = 2 then Printf.printf "x = 2" else Printf.printf "x <> 2"`

    A) `int -> int -> unit`<br />
    B) `int -> int -> unit -> unit`<br />
    C) `int -> unit`<br />
    D) `unit`<br />
    E) `ERROR`<br /><br />

2. `let f x y = if x = 2. then x else y+3`

    A) `int -> int -> int`<br />
    B) `float -> int -> float -> int`<br />
    C) `float -> int -> unit`<br />
    D) `ERROR`<br /><br />

3. `let f x = let y = x +. 4. /. 10. in if y > 3.1 then y else 3.`

    A) `int -> int`<br />
    B) `float -> unit -> float`<br />
    C) `float -> float`<br />
    D) `ERROR`<br /><br />

4. `let f = (if 2 > 3 then true else true) || false`

    A) `bool -> bool` <br />
    B) `bool`<br /> 
    C) `int -> int -> bool`<br />
    D) `ERROR`<br /><br />