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

Sejam $r$ e $s$ dois inteiros naturais positivos tais que $s\geq 2$ e $r<s$. Define-se por  sequência de Hofstadter-Huber de família $(r,s)$  a sequência determinada pela fórmula seguinte

<center>$Q_{r,s}(n) = 
{(1, se\ 1 \leq n \leq s),
(Q_{r,s} (n - Q_{r,s} (n-r)) + Q_{r,s} (n - Q_{r,s} (n - s)), se\ n>s
):}$</center>

em que $n$ é um inteiro positivo.

<p>Esta família de valores sofre de irregularidades. Em particular  diz-se que <emph>morre</emph> quando os valores 
$Q_{r,s}(n)$ não estão definidos (i.e. quando $n -  Q_{r,s}(n-r) < 1$  ou  $n -  Q_{r,s}(n-s) < 1$), ou quando qualquer outra condição estabelecida sobre $r$ e $s$ não é respeitada.</p>

# Objetivo

<p>Define a função <code>hhq : int -> int -> int -> int</code> tal que <code>hhq r s n</code> calcule  o valor de $Q_{r,s}(n)$ .</p>

No caso de um argumento inválido ou da deteção de qualquer situação anómala, a exceção `Failure "hhq"` é lançada. Assim, `hhq 1 4 12 = 7`.