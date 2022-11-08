1. É possível declarar uma função `f` de tipo `(int * int * int) -> bool`  de pelo menos duas formas diferentes?

    A) `Verdade`<br />
    B) `Falso`<br /><br />


```ocaml
// Em C
int f1 (int x, int y) {
	 if (x == 1) { return 1;}
   	 else if (x == 2) { return 2;}
   	 else if (x == y) { return y;}
   	 else {return x+2;}
   	}
   	
(* Em OCaml *)
let f2 x y =
 match x with
 | 1 -> 1
 | 2 -> 2 
 | y -> y
 | _ -> x+2
```

2. As funções seguintes `f1` e `f2` são equivalentes:

    A) `Verdade`<br />
    B) `Falso`<br /><br />