Considere o código seguinte:

```ocaml
let rec f x y =
    match x with
    | 0 -> y
    | 2 -> Printf.printf "Caso 2\n"; f y 2
    | n -> Printf.printf "Caso n\n"; f y 0
```

1. A função termina sempre?

    A) Verdade<br />
    B) Falso<br /><br />

2. A função está devidamente tipificada com qual dos tipos?

    A) `int -> int -> int`<br />
    B) `int -> int -> unit`<br />
    C) `unit -> unit -> unit`<br />
    D) `ERROR`<br /><br />
