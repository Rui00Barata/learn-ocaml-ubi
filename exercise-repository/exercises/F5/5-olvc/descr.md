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

Pretendemos trabalhar com listas ou vetores  de inteiros. Neste contexto queremos ordenar uma lista de inteiros  com recurso às funções `List.sort`  ou `Array.sort` e usando vários critérios:

1. Escrever a função `sort1 : int array -> int array` que ordena o vetor em parâmetro de forma decrescente usando a função `Array.sort`.

2. Escrever a função `sort2 : int list -> int list` que ordena a lista em parâmetro usando a função `List.sort` e o critério de ordenação seguinte:

    - primeiros os inteiros impares (são considerados menores do que  os inteiros pares), seguem os pares;
    - nos inteiros impares, a regra de comparação é a ordem decrescentes;
    - no inteiros pares a ordem é crescente. 

3. Escrever a função `sort3 : int array -> int array`	que ordena o vetor em parâmetro usando o critério da alínea anterior mas com recurso, claro, à função `Array.sort`.

4. Escrever uma função `sort4 : int list -> int list` que ordena os inteiros da lista em parâmetro por ordem  lexicográfica dos seus valores lidos ao contrário. Por exemplo  consideremos $19$ e $111$.  Lidos da direita para a esquerda temos de comparar $9$ com $1$. Como $9$ é maior,  $19 > 111$ nesta ordem particular.

   Assim `sort4 [121;17;191;32;19;91]` devolve `[121;91;191;32;17;19]` .
