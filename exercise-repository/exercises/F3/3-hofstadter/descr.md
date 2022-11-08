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

Em "Hofstadter, D. R. *[Gödel, Escher, Bach: An Eternal Golden Braid.](https://pt.wikipedia.org/wiki/G%C3%B6del,_Escher,_Bach)* New York: Vintage Books, p. 137, 1989.",  Hofstadter definiu várias sequências numérias, uma delas é o par de sequencias fêmeas e machos seguintes: 


<center>$F(n) = {(1,se\ n=0), (n - M(F(n-1)),se\ n>0):}$</center>

<br />
<center>$M(n) = {(0, se\ n=0), (n - F(M(n-1)),se\ n>0):}$</center>

# Objetivo

Define  a função `hfm : int  -> int*int` que, para um parâmetro inteiro positivo n devolve o par (f(n),m(n)).

No caso de um argumento inválido ou da deteção de qualquer situação anómala, a exceção `Failure "hfm"` é lançada. 

Assim, `hfm 7 = (5,4)`.