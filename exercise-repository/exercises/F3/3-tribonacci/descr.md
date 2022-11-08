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

Considere a função _tribonacci_ seguinte, sobre inteiros naturais:

<center>$"tribonacci"(n) = {
(1, se\ n=0),
(1, se\ n=1),
(1, se\ n=2),
(\Sigma_{i=1}^3 "tribonacci"\ (n-i),para\ n>2)
:}$</center>


# Objetivos

1. Define a função recursiva `tribonacci : int -> int`, que calcule o valor de tribonacci para um dado valor.

2. Define a versão iterativa `tribonacci_iter : int -> int`, com ciclos e referências, que calcule o valor de tribonacci para um dado valor.

3. Defina a função recursiva terminal `tribonacci_tail : int -> int -> int -> int`. Assuma que na chamada da função `tribonacci_tail n a b c`, os valores de a,b e c serão 1.

Exemplo de um teste: 
 Chamada: `tribonacci_tail 6 1 1 1`
 Output: `17`