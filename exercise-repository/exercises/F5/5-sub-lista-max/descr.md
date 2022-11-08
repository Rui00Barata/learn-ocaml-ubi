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

O problema da sublista máxima consiste em encontrar  numa lista de inteiros positivos ou negativos a maior soma dos elementos de uma sublista (contíguos) da lista dada.

Por exemplo,  na lista `[ -3, 6, -3, 4, -1, 2, 2, -5, 4 ]`, a sublista de maior soma é [4, -1, 2, 2] cuja soma é 7. Esta lista pode não ser única. Assim `[ -3, 7, -3, 4, -1, 2, 2, -5, 4 ]`  tem duas sublistas de soma máxima 7. Mas a maior soma, sim.

Para resolver este problema de forma eficaz Jay Kadane (Carnegie Mellon University) propôs em 1984 um algoritmo que resolve este problema percorrendo uma só vez a lista.

O algoritmo é descrito recursivamente da forma seguinte:
- se a lista l é vazia, então a soma máxima é $0$
- se a lista l é da forma $[v_1; v_2; \ldots ; v_ {i−1}; v_i; \ldots ; v_n]$ e $m$ é a maior soma possível  para a sublista que termina em $i-1$, então a maior soma de $[v_1; v_2; \ldots ; v_ {i−1}; v_i]$ é $max(v_i, m+v_i)$.

# Objetivos

1. Defina uma função `max_kadane : int list -> int`que implementa o algoritmo de Kadane acima descritas e que assim devolve o valor da maior soma possível para uma sublista contígua da lista em parâmetro.   Poderá usar, se necessário, uma lista auxiliar para memorizar as maiores somas previamente calculados.

2. Escreva uma função  `kadane : int list -> int list` que devolve a lista ( localizada o mais a esquerda, no caso de não ser a única) de soma máxima.
