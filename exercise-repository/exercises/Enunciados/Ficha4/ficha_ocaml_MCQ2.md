

# Ficha OCaml: tipagem, avaliação, erros, Parte 2



------



##### Ex.

Para cada uma das expressões seguintes, indicar se são corretamente tipificadas. No caso positivo, dar o referido tipo.

1. `let f1 x = !x` 
2. `let f2 g x y = if g x then y x else g` 
3. `let f3 h = let x = ref true in if h x then x:= false; !x`

------



##### Ex. 

Considere o código seguinte :



```ocaml
let rec f x =
  match x with
     | 0 -> 1
     | 1 -> 1
  | n -> f(n-1) + f(n-2)
```

1. A função termina sempre?	
   - [ ] Verdade
   - [ ] Falso
2. A função está devidamente tipificada?
    - [ ] `int -> int`
    - [ ] `int -> int -> int`
    - [ ] `int`
    - [ ] `ERROR`
------



##### Ex.

Considere o código seguinte :

```ocaml
let rec f x y =
    match x with
       | 0 -> y
       | 2 -> Printf.printf "Caso 2\n"; f y 2
    | n -> Printf.printf "Caso n\n"; f y 0
```

1. A função termina sempre?	
   - [ ] Verdade
   - [ ] Falso
2. A função está devidamente tipificada com qual dos tipos ?
   - [ ] `int -> int -> int`
   - [ ] `int -> int -> unit`
   - [ ] `unit -> unit -> unit`
   - [ ] `ERROR`

------





##### Ex.

Considere o código seguinte : 

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
   - [ ] Verdade 
   - [ ] Falso
2. A função está devidamente tipificada com qual dos tipos ?

   - [ ] `int`
   - [ ] `int -> int`
   - [ ] `ERROR`

------



##### Ex. Verdade ou Falso?

1. É possível declarar uma função `f`  de tipo `(int * int * int) -> bool`  de pelo menos duas formas diferentes?
   - [ ]  `Verdade` 
   - [ ] `Falso`

2. As funções seguintes `f1` e `f2` são equivalentes:

```ocaml
int f1 (int x, int y) { // em C
	 if (x == 1) { return 1;}
   	 else if (x == 2) { return 2;}
   	 else if (x == y) { return y;}
   	 else {return x+2;}
   	}
   	
let f2 x y =  (* em OCaml *)
     match x with
   	  | 1 -> 1
	  | 2 -> 2 
	  | y -> y
	  | _ -> x+2
```

- [ ]  `Verdade` 
- [ ] `Falso`

------



##### Ex.

Considere a função `f`

```
	let f x y z = 
	 match x with
	  | 1 -> z - 1
 	  | 2 -> z + 20
 	  | y -> y
	  | 10 -> z + 5
	  | _ -> x
```

Que valor devolve as expressão `f 10 9 0` ?

- [ ]  `5`
- [ ]  `9`
- [ ]  `10`
- [ ]  `0`

------



##### Ex. tipagem

Dê o tipo das expressões seguintes:

- `let x = read_int () in let y = read_float () in (x+1,y)`
- `let f a b c = b (c + a)`
- `let f a b c = b c`
- `let f a (b: int -> int) c = a (b c)`
- `let f a b c = a  (b c)`
- `let f a b c = c (b a)`
- `let o = ref (List.tl [1])`
- `let x = ref []`
- `let x = [ ( + ) 3 ; succ ; (fun x y -> List.length  x+ y) [1;5] ]`
- `let x y = y 1 in x (fun z -> z + 1) `
- `let f x y = function z -> y (List.map x z)`

------



##### Ex.

Para cada uma das alíneas  seguintes, dar o tipo da expressão e se não houver tipo por causa de um erro, explique a razão do erro :

- `let rec ones = 1::ones`

- Assumindo a declaração anterior, analise  `List.length ones`

- `fun x -> fun y -> fun z -> x z (y z)`

- `let x = (List.tl ['c']) in 1::x`

- Assuma a declaração `let l = ref []`

  e a declaração `let nl = 1::!l`,

  analise esta expressão:  `let nll = 'c':: !l`

-  `(fun x y -> (fun z -> y z) (fun x -> x y) x)`

- `let k = fun x y -> x in let i = fun x -> x in k k i`

- Considere o seguinte código:

  ```ocaml
  let b = true
  let f0 = fun x -> x+1
  let f = fun x -> if b then f0 else fun y -> x y
  let f = fun x -> if b then f else fun y -> x y
  let f = fun x -> if b then f else fun y -> x y
  let f = fun x -> if b then f else fun y -> x y
  ```

  Qual é o tipo de do último `f`?

------

