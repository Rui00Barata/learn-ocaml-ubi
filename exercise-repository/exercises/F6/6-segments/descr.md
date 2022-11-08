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

Este exercício é uma adaptação de um exercício proposto por R. Sedgewick e K. Wayne. O seu objetivo é o seguinte: dado um conjunto de $n$ pontos distintos no plano, encontre cada segmento de linha máximo que conecta um subconjunto de **4 ou mais** pontos colineares. Os segmentos são máximos no sentido que agrupam o maior numero de pontos possíveis.



Por exemplo, se tivermos a nuvem de pontos seguintes:



<img src="point_cloud1.png" style="zoom:75%;" />



Então a função pretendida deverá devolver os 5 segmentos seguintes:

<img src="point_cloud2.png" style="zoom:75%;" />

Vamos agora apresentar três soluções, implementando só a última.

- Uma solução possível pode passar por verificar cada conjunto possível de $4$ pontos e ver se estes são co-lineares. Caso o sejam então considera-se  o segmento correspondente (caracterizado pelo ponto mais a esquerda e o ponto mais a direita).  Caso este segmento  esteja alinhado com outro segmento já considerado (i.e. dois segmentos que estão na mesma reta) então funde-se estes dois segmentos e é esta junção que fica arquivada. Senão arquiva-se o segmento considerado originalmente.

  Este processo repete-se até termos considerado todas as combinações possíveis de 4 pontos. 

  No final, temos uma solução que é dita $\mathcal{O}(n^4)$ sendo $n$ o numero total de pontos. Até termos definido com rigor esta notação, podemos assumir que o número de passos executados para chegar a solução é dependente do numero de combinações de $4$ pontos consideradas e que assim é _proporcional a_ ou _é da ordem de_ $n^4$.

- Uma outra solução, bem mais *esperta*, proposta no exercício original de K. Wayne e R. Sedgewick é a seguinte:

  Olhemos para um ponto particular, `p` da nuvem de pontos.  Para todos os restantes pontos podemos calcular que declive formam com `p`. É certo é que cada par de pontos colineares com `p` tem o mesmo declive com `p` ou formam a mesma reta. O passo seguinte é ordenar os pontos pelo declive que formam com `p`. Os que formam o mesmo declive ficarão vizinhos uns dos outros. Se forem mais do que 3 (i.e. 4 ou mais...), são pontos que formam um segmento que queremos considerar.  Juntamos estes segmentos aos segmentos já considerados da mesma forma do que no algoritmo anterior. 

  Depois de percorrer cada ponto, obtemos o conjunto de todos os segmentos que envolvem 4 pontos ou mais.

  Esta solução é significativamente mais eficiente do que a anterior: para cada ponto possível em `n` pontos explora `n` pontos calculando um declive e ordena adequadamente os resultados. Ou seja , no pior caso a ordem de complexidade é $n \times (n + \mbox{custo de uma ordenação})$. Veremos mais adiante que o melhor que podemos esperar de uma ordenação de $n$ valores é $n\times log_2 (n)$. Logo o numero de operações  que este algoritmo realiza no pior cenário é $n^2log_2(n)$.

- Mas podemos fazer ainda melhor. Vamos aproveitar-nos de dois factos suplementares. No lugar de calcular declives, vamos calcular retas que passam entre os pontos considerados.  

  1. Qualquer que seja um conjunto de pontos colineares, a reta formada por qualquer par de pontos deste conjunto  é a mesma. 
  2.  Se percorrer os pontos ordenadamente da esquerda para a direita e de baixo para cima, então a primeira vez que detetar que um conjunto de  pontos são colineares então este conjunto é máximo (contempla todos os pontos possíveis do segmento).  

  Assim, o analisar um ponto determinado e a colinearidade com os restantes pontos,  basta considerar os pontos que ainda não foram analisados individualmente (os que estão acima ou à direita), porque se o ponto está alinhado com outros pontos anteriores então a reta já terá sido detetada no primeiro destes pontos.  Mais, se detetarmos uma reta pela primeira vez e que esta agrupa 4 ou mais pontos, então o número de pontos envolvidos é o maior. Basta registar a reta e os pontos envolvidos. detetamos a reta a partir do seu ponto mais extremo (a esquerda, em baixo).

  Finalmente, para este processo ser eficiente, é importante conseguir detetar eficientemente se uma reta já foi considerada ou não. Vamos usar uma tabela de hash para esse efeito. Veremos mais adiante na matéria os detalhes desta excelente estrutura de dados. Só importa aqui saber que  as tabelas de _hash_ se comportam como dicionários e podem ser alteradas, questionadas pelas funções seguintes (ver [Hashtbl reference manual](https://caml.inria.fr/pub/docs/manual-ocaml/libref/Hashtbl.html)) :

  ```ocaml
  val add : ('a, 'b) t -> 'a -> 'b -> unit
  Hashtbl.add tbl x y adds a binding of x to y in table tbl. Previous bindings for x are not removed, but simply hidden. That is, after performing Hashtbl.remove tbl x, the previous binding for x, if any, is restored. (Same behavior as with association lists.)
  
  val find : ('a, 'b) t -> 'a -> 'b
  Hashtbl.find tbl x returns the current binding of x in tbl, or raises Not_found if no such binding exists.
  
  val mem : ('a, 'b) t -> 'a -> bool
  Hashtbl.mem tbl x checks if x is bound in tbl.
  
  val remove : ('a, 'b) t -> 'a -> unit
  Hashtbl.remove tbl x removes the current binding of x in tbl, restoring the previous binding if it exists. It does nothing if x is not bound in tbl.
  
  val replace : ('a, 'b) t -> 'a -> 'b -> unit
  Hashtbl.replace tbl x y replaces the current binding of x in tbl by a binding of x to y. If x is unbound in tbl, a binding of x to y is added to tbl. This is functionally equivalent to Hashtbl.remove tbl x followed by Hashtbl.add tbl x y.
  ```

# Objetivos

É essa  a via que vamos explorar na solução por implementar aqui.

Considere os tipos seguintes:

```ocaml
type ponto    = {cx : float; cy : float}
type pontos   = ponto array
type segmento = {mutable quantos : int; mutable ini : ponto; mutable fim : ponto}
type reta     = V of float | E of float * float
```

e, a título de exemplo,  a tabela de _hash_ seguinte: 

```ocaml
let retas : (reta,segmento) Hashtbl.t = Hashtbl.create 97 
(* o valor 97 é pouco importante, é uma estimativa de tamanho *)
```

Assim sendo o algoritmo pode formular-se como:

```pseudocode
entrada: v, o vetor de pontos  
saída: o vetor de segmentos
variáveis locais: retas e B, conjuntos de retas e respectivos pontos

1 - ordenar os pontos de v por ordem lexicográfica (da esquerda para a direira de baixo para cima) 
2 - retas = {} 
3 - para todo o elemento i de v, do primeiro ao último 
     a - B = {}
     b - para todo o elemento j de v que segue i no vetor v,  
         - calcular a reta r formada pelos pontos i e j  
         - se r está em retas então ignorar esta reta   
           senão 
            - se r está em B 
              então atualizar osdados dos pontos da reta arquivada em B com j
              senão criar a associação r com o segmento  i,j em B   
     c - juntar em retas todas as retas de B que envolvem mais do que 3 pontos.     
4 - devolver todos os segmentos de reta arquivados em retas      
```



Com esta solução obtemos uma complexidade quadrática.



Definir a função `segmentos : pontos array -> segmento array` que recebe um vetor de pontos e implemente o algoritmo acima descrito , devolvendo todos os segmentos com 4 ou mais pontos co-lineares que a nuvem os pontos em parâmetro contém.
