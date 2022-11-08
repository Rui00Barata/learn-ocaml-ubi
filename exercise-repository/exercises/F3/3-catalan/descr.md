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

Uma famosa sequência de números inteiros conhecida por *Números de Catalan* (do matemático belga Eugène Charles Catalan, 1814–1894) é definida por:

<center>$
Catalan(n) = {
(1, se\ n=0 vv n=1),
(\sum_{(p,q)\ tais\ que\ p+q=n-1} Catalan(p)*Catalan(q), se\ n>1
):}
$</center>

Esta sequência está envolvida na contagem de variadíssimos fenómenos combinatórios.

# Objetivo

Escreva um programa `catalan : int -> int` que recebe um inteiro natural $n$ e que calcule recursivamente o valor de $Catalan(n)$.

No caso de um argumento inválido, a exceção `Invalid_argument "catalan"` é lançada.

Assim, `catalan 6 = 132`.