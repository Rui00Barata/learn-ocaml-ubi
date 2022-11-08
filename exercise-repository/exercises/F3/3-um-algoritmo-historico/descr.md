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

Vamos implementar neste exercício um algoritmo histórico, foi formulado pelo próprio Euclides 300 AC.
Em particular, interessa-nos a versão recursiva:

<center>
$mdc(a, b) ={(a,se\ b=0), (mdc(b,mod(a,b)), sen\tilde{a}o):}$
</center>


# Objetivos

Defina uma função `euclides : int -> int -> int` que calcula o maior divisor comum com base no algoritmo acima descrito. Assim, `euclides 36 45 = 9`. No caso de um argumento inválido, a exceção `Invalid_argument "euclides"` é lançada.
