Considere o código seguinte :

```ocaml
let rec f x =
  match x with
  | 0 -> 1
  | 1 -> 1
  | n -> f(n-1) + f(n-2)
```

1. A função termina sempre?

    A) Verdade<br />	
    B) Falso<br /><br />
   
2. A função está devidamente tipificada?

    A) `int -> int`<br />	
    B) `int -> int -> int`<br />	
    C) `int`<br />	
    D) `ERROR`<br />
