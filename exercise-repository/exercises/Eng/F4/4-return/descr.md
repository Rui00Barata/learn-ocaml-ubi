Consider the function `f`:

```ocaml
let f x y z = 
  match x with
  | 1 -> z - 1
  | 2 -> z + 20
  | y -> y
  | 10 -> z + 5
  | _ -> x
```

What value is returned by the expression `f 10 9 0`?

A) `5` <br />
B) `9` <br />
C) `10` <br />
D) `0` <br /><br />

**Note:** If you believe the correct option is `A`, then you should answer as follows: `let answer = A`.