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

Nos anos 70, John McCarthy, um dos pais da inteligência artificial, em parceria com o Zohar Manna e Amir Pnueli, procurou definir uma função recursiva que seja um caso de escola para a verificação de programas.

Esta função é a função $m : \mathbb{N} \to \mathbb{N}$ definida da forma seguinte:

<center>$m(n) = {(n-10,se\ n>100), (m(m(n+11)), se\ n\leq 100):}$</center>

# Objetivos

1. Define a função `mccarthy : int -> int` que implemente esta definição recursiva. Por exemplo `maccarthy 200 = 190`, `mccarthy 24 = 91`

2. Implemente agora a função f91 definida da forma seguinte:
<br />
  <center>$f91(n) ={(n-10, se\ n>100\), (91, se\ n\leq 100):}$</center><br />

3. Define uma função recursiva `mccarthy_is_f91 : int -> int -> bool`  que verifica se, no intervalo inteiro definido pelos dois inteiros parâmetros, as duas funções devolvem o mesmo resultado. por exemplo `mccarthy_is_f91 70 120 = mccarthy_is_f91 120 70 = true`.
