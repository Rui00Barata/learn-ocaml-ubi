1. Is it possible to declare a function `f` of type `(int * int * int) -> bool` in at least two different ways?

    A) `True`<br />
    B) `False`<br /><br />

    ```ocaml
    // In C
    int f1 (int x, int y) {
	     if (x == 1) { return 1;}
   	     else if (x == 2) { return 2;}
   	     else if (x == y) { return y;}
   	     else {return x+2;}
   	    }
   	
    (* In OCaml *)
    let f2 x y =
     match x with
     | 1 -> 1
     | 2 -> 2 
     | y -> y
     | _ -> x+2
    ```
    
2. The two previous functions `f1` and `f2`, are equivalent:

    A) `True`<br />
    B) `False`<br /><br />

**Note:** If you believe the correct option is `A`, then you should answer as follows: `let answer = A`.