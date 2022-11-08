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

Considere a seguinte sequência de triângulos equiláteros:

![](https://t1.daumcdn.net/cfile/tistory/2272113A566FC05815)

Se listarmos o comprimento dos lados dos triângulos desta sequência temos:

<center>$1, 1, 1, 2, 2, 3, 4, 5, 7, 9, 12, 16, \cdots$</center>

# Objetivo

Define uma função `triangulos  : int -> int` que devolve o n-ésimo elemento desta sequência (que começa no índice 0).

Por exemplo `triangulos 0 = 1`, `triangulos 3 = 2` e `triangulos 9 = 9`  