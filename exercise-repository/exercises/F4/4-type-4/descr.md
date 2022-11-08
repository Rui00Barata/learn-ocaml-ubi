Considere o código seguinte: 

```ocaml
let rec f x =
    match x with
       | 0 -> 0
       | 1 -> f 0
       | 2 -> f (x+1)
       | 3 -> (f 1)+2
       | n -> n+1
```

1. A função termina sempre?

    A) Verdade<br />
    B) Falso<br /><br />

2. A função está devidamente tipificada com qual dos tipos?

    A) `int`<br />
    B) `int -> int`<br />
    C) `ERROR`<br />