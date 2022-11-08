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

Escreva uma função `algarismos : int -> int -> int*int*int` que recebe um inteiro $n$ e um algarismo $i$ e devolva o número de vezes que este algarismo $i$ aparece em $n$, a soma dos algarismos de $n$ e finalmente o número de algarismos de $n$.

Por exemplo, `algarismos 1073741823 3` retornaria o tuplo `(2,36,10)`.
