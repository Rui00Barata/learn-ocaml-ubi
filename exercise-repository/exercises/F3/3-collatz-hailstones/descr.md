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

A conjetura de Collatz (ou Hailstones, ou de Syracuse) é da autoria do matemático alemão Lothar Collatz que desafiou a comunidade científica durante um evento na Universidade de Syracuse em 1928. A conjetura estabelece uma sequência de números (designada também de trajetória ou voo) que a partir de um número natural inicial obedece aos seguintes critérios:

- se *n* é par, então o sucessor de *n* na sequência é *n* divido por dois;
- se *n* é impar, então o sucessor de *n* na sequência é *n* multiplicado por 3 mais 1.
- juntamos o critério de paragem em 1.

Até a data de hoje, ninguém encontrou um numero inicial, *n*, que não gere uma trajetória que termine no número $1$!   (sem o critério de paragem,  obteríamos um ciclo que passaria _ad eternum_ pelo valor 1)

Exemplos:

<center>
$6 \to 3 \to 10 \to 5 \to 16 \to 8 \to 4 \to 2 \to 1$
</center>
<center>
$17 \to 52 \to 26 \to 13 \to 40 \to 20 \to 10 \to 5 \to 16 \to \cdots  \to 1$
</center>

# Objetivo

O seu desafio é escrever a função recursiva `collatz : int  -> int list`  em Ocaml que dado um parâmetro inteiro *n*, devolva a sequência de inteiros que corresponde a trajetória a partir do valor *n*. Obviamente esta sequência termina quando se atinge o valor 1.  Por exemplo 

`collatz 6 = [6; 3; 10; 5; 16; 8; 4; 2; 1]`