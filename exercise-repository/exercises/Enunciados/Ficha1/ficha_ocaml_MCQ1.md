

# Ficha OCaml: tipagem, avaliação, erros



------



##### Ex. tipagem

Dê o tipo das expressões seguintes:

- `let f x =  x * 2`
- `let f x y = x +. (float y)`
- `let x = sin 5. in 2.*. x`
- `let x = 3. in let y = 2 in if x > 1. then 3. ** 9. else cos 1.`
- `let f  x (y,z) = if x then y else not z`
- `let f x y z = (x <= y, z)`
- `fun x y z -> (x <= y,  if z <= x then x else y)`
- `let f x y z  = (x <= y,  if z <= x then x else y)`

------



##### Ex.

Para cada uma das alíneas  seguintes, dar o tipo da expressão e se não houver tipo por causa de um erro, explique a razão do erro :

- `let f1 x g z = if x then g x else g z `
- `let f2 f g x = if f x then g x `
- `let f3 g x y = if g x then g y `
- `let rec f4 x y = f4 y ([]::x)`
- `let f5 g f x = if x<0 then  f (g x) else g (f x)` 
- `let f6 g f x y1 = if x<y then  f (g x) else g (f y) `
- `let f7 x y = if x > 0 || y < 0. then x else y`

------



##### Ex.

Considere  a seguinte função `mistery`:

````ocaml
let rec mistery x y z = 
  if y <= 0 then z else mistery x ( y - 1) (x * z)
````

1. Dê o seu tipo.
2. Qual é o valor devolvido por  `mistery 2 3 1`?
3. Assumindo que os parâmetros todos são inteiros naturais,  e que na chamada inicial `z` é um,  explique o que calcula esta função.
4. Assumindo que os parâmetros todos são inteiros naturais,  e que na chamada inicial z é um,  demonstre a afirmação do ponto anterior.

------



##### Ex.

Considere  a seguinte função `misterio`:

```` ocaml
let rec misterio d r=
    if d = 0 then r 
    else 
      let a = (d lsr 1) in  
      let b = (string_of_int (d land 1)) in
        misterio  a  (b ^ r) 
````



   	1. Dê o tipo da função ` misterio`.
            	2. Qual é o valor devolvido por  `misterio 13 ""`?
         	3. Assumindo que na chamada inicial  o parâmetro `d`  é  um inteiro  natural e que `r` é a _string_ vazia `""`,   explique o que calcula esta função.

------



##### Ex.

Avalie cada uma das expressões seguintes, observe as mensagens de erro resultantes e:

1.  Explique cada uma delas.

2. Proponha uma correção, i.e. uma expressão correta que resolva o problema detetado.  

   Tenha em atenção que o local assinalado para o erro é o local em que esse é detetado. Nem é sempre o local onde o erro tem origem! 

   

- `let quarto_pi = 3.14 / 4.`
- `let na_ordem = 1 < 2 < 3` 
- `let positivo = let a = 42 in if a >= 0 then true`
- `let duplo_positivo = let x = cos 5. in (if (x < 0) then x else -x) *. 2`

------



##### Ex.

Dê o tipo e o valor das seguintes expressões OCaml. No caso de erro, explique a origem e dê uma possível correção. 



- `let r = let x = 7 in 6 * x`
- `let a = (r -6) / 6 - 6`
- `let o = r * r - x * x - 51`
- ``let u = let x = 9 in if (x<9) then 9 / (x-x) else (x+x) / 9` 
- `let  x =   let a = 10 in if a>7 ||  b / (a - a) then "ola" else "tudo bem"`
- `let  x =   let a = 10 in if a>7 ||  b / (a - a) then "ola"` 
- `let  x =   let a = 10 in if a < 7 && b / (a - a) then "ola" else "tudo bem"`

------



##### Ex.

Para cada uma das expressões seguintes, indicar, das escolhas possíveis, qual é o tipo certo.

1.  `let f (x:int) = x + 1`
    - [ ] int -> int
    - [ ] int -> int -> int
    - [ ] int -> unit
    - [ ] unit -> int -> int 

2.  `let x = 1`

    - [ ] int -> int
    - [ ] int   

    - [ ] unit -> int  

    - [ ] ERROR

3.  `let x y = y + 1`
    - [ ] int -> int
    - [ ] int -> int -> int
    - [ ] ERROR

4.  `let f x y = x +. y`
    - [ ] int -> int -> int
    - [ ] unit -> int -> int -> int
    - [ ] float -> float -> float
    - [ ] int -> int -> float

5.  `let f1 x y = Printf.printf "%d" x; y + 3`
    - [ ] int -> int -> unit -> int
    - [ ] int -> int -> int
     - [ ] unit -> int -> unit -> int
     - [ ] unit -> int -> int

------



##### Ex. 

Verdade ou falso, as expressões seguintes estão bem tipificadas.

1. `let s1 = "a" + "b"`
   - [ ] Verdade 
   - [ ] Falso

2. `let s2 = "a" ^ "b"`
   - [ ] Verdade
   - [ ] Falso
3. `let s3 = "a" ^ 'b'`
   - [ ] Verdade
   - [ ] Falso
4. `let s4 = 'a' ^ 'b'`
   - [ ] Verdade
   - [ ] Falso

------



##### Ex.

Dê o tipo das funções seguintes:

1.  `let f x = if x = 2 then Printf.printf "x = 2" else Printf.printf "x <> 2"`

       - [ ] `int -> int -> unit`
       - [ ] `int -> int -> unit -> unit`
       - [ ] `int -> unit`
       - [ ] `unit`
       - [ ] `ERROR`

2.  `let f x y = if x = 2. then x else y+3`
    - [ ] `int -> int -> int`
    - [ ] `float -> int -> float -> int`
    - [ ] `float -> int -> unit` 
    - [ ] `ERROR`

3.  `let f x = let y = x +. 4. /. 10. in if y > 3.1 then y else 3.`

    - [ ] `int -> int`
    - [ ] `float -> unit -> float`
    - [ ] `float -> float`
    - [ ] `ERROR`

4.  `let f = (if 2 > 3 then true else true) || false`

    - [ ] `bool -> bool` 
    - [ ] `bool` 
    - [ ] `int -> int -> bool` 
    - [ ] `ERROR`

------



##### Ex.

Considere a seguinte definição: `let a,b = (10, "hello")`

1.  Dê o tipo e o valor de  `a`?
    - [ ] `int` e `10`
    - [ ] `string` e `"hello"`
    - [ ] `Erro: faltam parêntesis`

2.  Dê o tipo e o valor de `b`?
    - [ ] `int` e `10`
    - [ ] `string` e `"hello"`
    - [ ] `Erro: faltam parêntesis`

------



##### Ex.

Considere a seguinte definição: `let n1 = (1,2,3,4,5)`

Como aceder exclusivamente ao quarto elemento de `n1`?			

- [ ] `n1[3]`
- [ ] `n1[4]`
- [ ] `let a,b,c,d,e = n1`
- [ ] `let a,b,c,_,e = n1`
- [ ] `let _,_,_,a,_ = n1`

------



##### Ex.

Seja `f`  uma função do tipo `(string * string) -> string`

Expressão seguinte corresponde a uma chamada correta da função `f`?

- [ ] `f a b c`
- [ ] `f (a,b)`
- [ ] `f "hello" "world"`
- [ ] `f ("hello","world")`

------




