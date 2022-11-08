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

Este problema  de programação foi originalmente proposto pelo  [Edsger Dijkstra](https://en.wikipedia.org/wiki/Edsger_Dijkstra) para ilustrar e evidenciar algumas propriedades esperadas de um algoritmo de ordenação, como a estabilidade.

Dada uma sequência arbitrária de bolas de 3 cores  de comprimento também arbitrário. Como ordenar esta sequência por forma  a que a sequência fique ordenada (as bolas azuis primeiro, seguido das bolas brancas e finalmente as bolas vermelhas)?  Mais, pretende-se que a ordem original das bolas de mesma cor seja respeitada ! 

Por exemplo, na sequência por ordenar , se uma bola azul particular está numa posição mais a esquerda de que uma outra bola de cor azul, então na sequência ordenada esta ordem se mantém (continua numa posição mais a esquerda do que a outra).  Diz-se desta ordenação que é *estável*.  

O algoritmo proposto por Dijkstra para este problema mostra que é possível ordenar uma coleção  de $n$ objetos coloridos usando um número *linear* de comparações de cores, embora os algoritmos de ordenação clássica (a família dos algoritmos de  ordenação que não usa a informação particular sobre os objetos por ordenar, por exemplo aqui o conhecimento de que só há três cores, azul, branco e vermelho)  precisam  em média (e no pior caso nos melhores algoritmos) de um número maior de comparações, na ordem de $n.log(n)$ .

Vamos assumir o tipo OCaml para representar as cores e as funções utilitárias seguintes:

```ocaml
type color = Blue | White | Red
type bola = (color*int)
let cor ((c,_) : bola) = c 
let indice ((_,i) : bola) = i
```

Propomos então um pseudocódigo para a ordenação desejada. Tenha em atenção que este pseudocódigo *tem propositadamente erros "subtis"* !

```pseudocode
entreada: a: um vetor de elementos de tipo bola

b := 0
i := 0
r := comprimento de a

Enquanto i < r fazer
 se cor a[i] = Blue então 
    trocar os valores de a[b] e a[i]
    incrementar b 
 senão se cor a[i] = White então 
    incrementar i
 senão // cor a[i] = Red
    incrementar r
    trocar os valores de a[r] e a[i]
 fim fazer    
```

# Objetivo

Após executar este pseudocódigo no papel e corrigido os erros que este contém, defina a função  `dutch_flag : bola array -> bola array` que ordena o vetor parâmetro usando este algoritmo. Com o par `(color * int)`  associamos um índice a cada cor, o que permitirá verificar facilmente que o algoritmo proposto é estável.

Assim: `dutch_flag [|(Red,0);(White,1);(Blue,2);(Red,3);(Blue,4);(White,5);(Blue,6);(Red,7);(White,8);(Blue,9)|] = [(Blue,2);(Blue,4);(Blue,6);(Blue,9);(White,1);(White,5);(White,8);(Red,0);(Red,3);(Red,7)|] `