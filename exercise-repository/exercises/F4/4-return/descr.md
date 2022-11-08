Considere a função `f`:

```ocaml
let f x y z = 
  match x with
  | 1 -> z - 1
  | 2 -> z + 20
  | y -> y
  | 10 -> z + 5
  | _ -> x
```

Que valor devolve a expressão `f 10 9 0`?

A) `5` <br />
B) `9` <br />
C) `10` <br />
D) `0` <br /><br />
