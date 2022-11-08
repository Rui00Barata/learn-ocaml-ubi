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

Considere a expressão matemática

<center>$underset(i=0)(sum^n) 3^i$</center>

<ol type="1">
  <li>Defina a função <code>sum3 : int -> int</code> tal que <code>sum3 n</code> devolva o valor $underset(i=0)(sum^n) 3^i$.</li>
  <li>Dê uma versão recursiva terminal <code>sum3_terminal : int -> int -> int</code>.</li>
</ol> 