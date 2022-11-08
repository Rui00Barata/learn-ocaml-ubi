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

Seja `v` um vetor de inteiros *ordenado de forma crescente* de tamanho `n​`, e `x` um inteiro. 

Vamos definir uma função de pesquisa *eficiente* que tire proveito da ordenação do vetor.

Considere dois índices `i`, `j` do vetor `v` tal que $i\leq j$.  Vamos procurar x no vetor `v` entre os índices i e j, (notação $v[i \ldots j]$)



- Se  $i=j$ então $x\in v[i\ldots j]$ se e só se  $x = v[i]$. Senão:

- Se  $v[i] > x$ então sabemos que $x$ não está no segmento $[i,j]$ do vetor $v$. No melhor caso, está algures no segmento $[0,i[$ do vetor $v$.

- Se   $x < v[j]$ então sabemos que $x$ não está no segmento $[i,j]$ do vetor $v$. No melhor caso, está algures no segmento $]j,n[$ do vetor $v$.

- Se $v[i] \leq x \leq v[j]$ então sabemos que $x$ está possivelmente no segmento $[i,j]$ do vetor $v$. O que sabemos com toda a certeza é que x não está nem em $v[0 \ldots i-1]$  nem em $v[j \ldots n]$. Por isso a procura deve concentrar-se no segmento  $[i,j]$.  

  Temos $i<j$ , então, seja $m$ o índice "no meio", ou seja o maior inteiro que é menor ou igual à média de i e j.

  -  Se $x=v[m]$,  encontramos $x$.
  -  Se $x > v[m]$, então o segmento $v[i\ldots m]$  do vetor $v$ não contém x. Possivelmente estará em $v[m+1\ldots j]$
  -  Se $x< v[m]$, então o segmento $v[m \ldots j]$  do vetor v não contém x. Possivelmente estará em $v[i\ldots m-1]$

  Este médio é designado de *procura/pesquisa binária* ou *procura dicotómica* 

# Objetivos

1. Defina uma função recursiva de pesquisa binária `binsearch_aux : 'a -> 'a array -> int -> int -> int` . `binsearch_aux x v low high` procure  o valor `x`  no vetor ordenado  `v` entre os índices `low` e `high`. Esta função devolve o índice onde o valor `x` se encontra em `v` (no intervalo `low..high`) ou então a exceção `Not_found` em qualquer outra situação. 

    Por exemplo `binsearch_aux 12 [|1;2;5;7;12;16;23;33;78|] 2 6` devolve `4`.

2. Defina uma função `binsearch : 'a -> 'a array -> int` que procura um valor x em todo o vetor ordenado `v`. Esta função devolve o índice onde o valor `x`se encontra em `v` ou então a exceção `Not_found`.  É aconselhado que use a função do ponto anterior.

    De notar que esta pesquisa divide o espaço de procura por dois de cada vez que refina a sua pesquisa.  Esta característica melhora em muito os tempos de resposta.  O pior caso é quando o elemento procurado não está no vetor. Mesmo assim, o número de comparações realizadas pelo algoritmo nunca ultrapassa a ordem de $log_2(n)$ sendo $n$ o tamanho do vetor.