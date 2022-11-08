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

Neste exercício vamos simular um sorteio do totoloto.

1. Define uma função `make_grelha` que dado um inteiro `n` devolve uma grelha de tamanho $n\times n$ inicializada com o valor `false`.

2. Define uma variável global `grelha` a partir da função definida em cima com tamanho $7 \times 7$.

3.  Define uma função `fill: int list -> grelhas` que, dada uma lista de $7$ inteiros distintos compreendidos entre $1$ e $49$, cria e preencha uma grelha  que é no final devolvida. Na grelha, um valor do sorteio encontra-se com o valor `true`. É imporante notar que as posições da grelha correspondem ao número do sorteio.<br/>
<br/>
Por exemplo, a posição da grelha 7, grelha.(0).(6), diz respeito ao número 7 do sorteio.


4. Definir uma função `sorteio : grelhas -> int list -> int -> (int list * bool)` que dado um sorteio (lista de $6$ números  inteiros complementado com um inteiro -- o complementar) diz em quantos números se acertou, complementar incluído. 

Por exemplo se o sorteio for $1$, $5$, $23$, $30$, $31$ e $45$  e o número complementar for $17$, e se a `grelha` em parâmetro contemplar $1$, $17$  e $30$, então a resposta a `sorteio grelha [1;5;23;30;31;45] 17` deverá ser `([1;30],true)` que significa  "acertou no $1$ e no $30$, e também no complementar".