Dê o tipo das expressões seguintes:

1. `let rec ones = 1::ones`

2. Assumindo a declaração anterior, o que devolve `List.length ones`:

    A) A lista é infinita logo corre até chegar ao _stack overflow_<br />
    B) A lista é infinita logo corre infinitamente<br />
    C) Sendo a lista infinita devolve um valor arbitrário<br />
    D) Sendo a lista infinita a execução gasta a memória toda até provocar um `BSOD`<br /><br />

3. Assumindo a declaração anterior, o que devolve `List.hd ones`:

    A) A função devolve `Failure "hd"`<br />
    B) A lista é infinita logo corre infinitamente<br />
    C) Devolve uma lista infinita de 1s menos o primeiro<br />
    D) 1<br /><br />

4. `fun x -> fun y -> fun z -> x z (y z)`

5. `let x = (List.tl [3]) in 1::x`

6. Assuma as seguintes declarações `let l = ref []` e `let nl = 1::!l`, o que faz a seguinte declaração `let nll = 'c':: !l`:

    A) `nll` fica igual a `['c'; 1]`<br />
    B) `nll` fica igual a `[1; 'c']`<br />
    C) `nll` fica igual a `[99; 1]`, sendo `99` o código ASCII de `c`<br />
    D) Dá um erro de tipo<br /><br />

7. `let k = fun x y -> x in let i = fun x -> x in k k i`

8. Considere o seguinte código:

    ```ocaml
    let b = true
    let f0 = fun x -> x+1
    let f = fun x -> if b then f0 else fun y -> x y
    let f = fun x -> if b then f else fun y -> x y
    let f = fun x -> if b then f else fun y -> x y
    let f = fun x -> if b then f else fun y -> x y
    ```

    Qual o tipo do último `f`?


**Nota:** Caso seja necessário utilizar o tipo `'_weak1` deverá fazê-lo da seguinte forma:<br />
  `type resposta = _weak1`, ou seja, sem o apóstrofe.