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

O problema que vamos resolver aqui resume-se na questão seguinte:

Tendo um vetor `v` de dimensão `n`  previamente inicializado, como misturar os seus elementos de uma  forma simples (i.e. não _muito_ custosa) e obter uma mistura bem feita ?

Isto é, como obter uma permutação dos seu elementos que pareça realmente aleatória ?

O problema levantado por esta questão parece simples, mas não. Não é _imediato_ calcular de forma simples uma permutação que tenha boas propriedades de aleatoriedade.

Ronald Fisher e Frank Yates descreveram em 1938 no livro _Statistical tables for biological, agricultural and medical research_  um método que foi depois estudado e popularizado pelo próprio Donald Knuth,  _himself_... 

Este método ficou conhecido como o *Knuth shuffle* ou _Fisher-Yates-Knuth shuffle_.

```ocaml
Para misturar um vetor v de n elementos (índices 0..n-1) fazer:
  para i de n - 1 até 1 fazer
       j = inteiro aleatório que verifica 0 <= j <= i
       trocar v[j] e v[i]
```

A propriedade essencial que este método garante é a de que qualquer permutação possível tem a mesma probabilidade em ser obtida por este método, inclusive o próprio vetor original.

# Objetivo

Define a função `knuth_shuffle: 'a array -> 'a array` que  implemente o algoritmo acima apresentado. Tenha em atenção que o argumento é o vetor por misturar. Para esse efeito poderá auxiliar-se da função `Random.int` do módulo OCaml `Random` (ver https://caml.inria.fr/pub/docs/manual-ocaml/libref/Random.html) 

> Random.int : int -> int
> 
> Random.int bound returns a random integer between $0$ (inclusive) 
>   and `bound` (exclusive). `bound` must be greater than $0$ and less than $2^30$.


Tenha em atenção que *não é esperado* que use funções como `Random.init` ou `Random.self_init`.
