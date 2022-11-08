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

1. Define uma função `distancia :  (float * float) -> (float * float) -> float`  que calcula a distancia entre dois pontos dados em parâmetros.

2. Defina uma função `area: float  -> float` que calcula a área de um círculo cujo o raio é dado em parâmetro.

3. Defina uma função `sin2x : float -> float` que, dado um parâmetro flutuante x, calcula a seguinte expressão:

<center>
$\frac{2 \times tanx}{1+tan^2x}$
</center>
