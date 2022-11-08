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

Wilhelm Friedrich Ackermann, matemático alemão, contribuiu ao estudo das funções computáveis apresentando uma função com propriedades inéditas: uma função total computável que fugia, na data da sua descoberta, à classificação que se pensava ser a das funções com estas características.

Em parte porque a função... tem um comportamento explosivo!

A função originalmente proposta tinha 3 parâmetros, mas a que ficou registada para a história contempla dois parâmetros e é definida da seguinte forma:

<center>
$A(0,n) = n + 1$ <br />
$A(m+1,0) = A(m,1)$ <br />
$A(m+1,n+1) = A(m,A(m+1,n))$
</center>

Calcule no papel o resultado de A(4,4).

Se ler esta frase, fique sabendo que A(4,2) tem como resultado um número com mais do que 19 mil dígitos ($2^{2^{2^{2^{2}}}}-3$) e que a alínea anterior resulta de uma piada de mau gosto que não se espere, claro, que resolva! 

# Objetivo

Defina a função recursiva `ackermann int -> int -> int` que calcula esta função.

Por exemplo `ackermann 3 4 = 125`
