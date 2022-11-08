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

Vamos aqui considerar um problema clássico de combinatória (de contagem).

Dada um valor $n$, imagine uma paisagem de montanha inscrita numa grelha $(0,0)$ até $(2n,0)$. 

No nosso cenário, uma paisagem é constituída exclusivamente de montanhas cujo declive é uma diagonal _um por um_ ascendente ou descendente, que começa em $(0,0)$ e acaba em $(2n,0)$. 

Não se consideram também perfis de montanha que descem por baixo do eixo dos $x$.

O problema por resolver é: dado $n$ (que define o tamanho da paisagem) e o número $k$ de picos ($k$ sempre menor ou igual a $n$), quantos perfis montanhosos válidos existem?

Por exemplo para $n=4$ e $k=3$, a resposta é $6$. Graficamente podemos visualizar as soluções da seguinte forma:

![](https://i.imgur.com/lIZsgHT.png)


Damos igualmente dois valores limites para $N=4$, que são $k=1$ e $k=4$

![](https://i.imgur.com/NwVI8wo.png)


Assumimos igualmente que $1\leq n \leq 30$  e  $1\leq k \leq n$.

# Objetivo

Define uma função `montanhas int -> int -> int option` que calcula precisamente  o número de perfis possíveis. Assim o resultado de `montanhas 4 3` é `Some 6`. Quando as regras sobre o `n` e o `k` não são cumpridas, ou por uma razão qualquer não é possível calcular o valor,  a função montanhas devolve `None`.  Assim, o resultado  `montanha 3 4` é `None`.

Dica:  considere os casos iniciais  ($n=1$ e $k=1$, seguido de  $n=2$ e $k=1$ ou $k=2$, etc. ) e veja se um padrão emerge a medida que calcula os casos seguintes.