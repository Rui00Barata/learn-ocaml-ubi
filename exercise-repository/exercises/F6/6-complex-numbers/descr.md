<script>
MathJax = {
  loader: {load: ['input/asciimath', 'output/chtml']},
  asciimath: {
    delimiters: [['$','$'], ['`','`']]
  }
}
</script>

<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/startup.js"></script>

# Introdução

Considere o tipo dos números complexos definidos da seguinte forma:

```ocaml
type complexo = float * float
```

Assim o complexo $3 + i$  é representado pelo par $(3.,1.)$.

As operações básicas sobre complexos são definidos da seguinte forma.

Sejam $u$ = $a + bi$ e $v$ = $c+di$,

- $Re(u) = a$,
- $Im(u) = b$, 
- $u + v = (a + c) + (b + d)i$,
- $u \times v = (a \times c - b \times d) + (a \times d + b \times d)i$

# Objetivos

1.  Defina estas quatro operações pelas funções
    
    1. `re : complexo -> float`;
    2. `im : complexo -> float`;
    3. `soma : complexo -> complexo -> complexo`;
    4. `mult : complexo -> complexo -> complexo`.

Considere agora o tipo 

```ocaml
type complex = {re : float ; im : float}
```

2.  Defina as quatro operações anteriores, mas para o tipo `complex`, desta vez. Ou seja, as funções

    1. `res : complex -> float`;
    2. `ims : complex -> float`;
    3. `add : complex -> complex -> complex`;
    4. `mul : complex -> complex -> complex`.