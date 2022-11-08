# Ficha OCaml: Listas e vetores



### Nível Básico

------





##### Ex.  Utilitários sobre listas

Define as seguintes funções sobre listas:

1. a função `soma : int list -> int` que devolve a soma dos inteiros contidos na lista em parâmetro.

   Por exemplo, `soma [1;5;3]` devolve `9`;                    

2. a função `conta_pares : int list -> int` que devolve a quantidades de pares presentes na lista de inteiros em parâmetro.  Por exemplo `conta_pares [1;-6;3;17;4;80;-18]` devolve `4`; 

3. a função booleana `palindroma : 'a list -> bool `, que devolve `true` se a lista em parâmetro é um palíndroma, `false` senão.  Por exemplo `palindroma ['a';'t';'d';'d';'t';'a']`, ou `palindroma [1;5;3;5;1]` devolvem `true`;

4. a função `maiusculas : char list -> char list` que transforma cada caracter da lista que seja uma letra minúscula para uma letra maiúscula. Por exemplo `maiusculas ['a';'9';'T';'%';'z';'-']`devolve  `['A';'9';'T';%';'Z';'-']`;

5. a função booleana `is sorted : 'a list -> ('a -> 'a -> int) -> bool`, que devolve `true` se a lista em parâmetro é ordenada conforme critério de ordenação  indicado pelo segundo parâmetro.

   Assim,  `is_sorted [1;3;7;9] compare`  devolve `true`,  `is_sorted [1;3;7;9] (fun a b -> compare b a)` devolve `false`. Relembramos que a função compare da biblioteca standard OCaml é definida como:

   ​	- `compare a b = -1` se a<b 

   ​	- `compare a b = 1`   se a>b  

   ​	- `compare a b = 0`   se a=b  

6.  a função `remove_duplicate_sorted :'a list -> 'a list` que remove os elementos duplicados de uma lista que se *assume estar ordenada*.  Por exemplo  `remove_duplicate_sorted [1;1;2;2;3,5;5;6;7;8;8;8;9] = [1;2;3;5,6;7;8;9]`.
7. a função `remove_ duplicate : 'a list -> 'a list` que remove os elementos duplicados de uma lista. Não se assume que esta esteja ordenada.`remove_duplicate [9;1;7;6;6;7;8;1;2;6;2;3,5;5;1;9] = [1;2;3;5,6;7;8;9]`.

Tente, o quanto possível, usar os combinadores sobre listas (`fold_left`, `map`, `for_all`, `iter`, `exists`, `filter`,   etc. ) 

------



##### Ex. Brilhar em sociedade

Afinal, brilhar num jantar é fácil, ser a estrela de um _vernissage_ é tão fácil como comer um _canapé_. Basta aplicar esta receita infalível.  Selecionar ao acaso um elemento de cada coluna aqui listada e juntar na ordem dos conjuntos para formar uma frase... _et voilá_.

Por exemplo, **"O diagnóstico identifica os bloqueios institucionais da prática comum"**. 

 

|     Conjunto 1      |  Conjunto 2  |        Conjunto 3        |      Conjunto 4      |     Conjunto 5      |
| :-----------------: | :----------: | :----------------------: | :------------------: | :-----------------: |
|   "A excelência"    |  "reforça"   |       "os fatores"       |   "institucionais"   |  "do desempenho";   |
|   "A intervenção"   |  "mobiliza"  |      "os processos"      |  "organizacionais"   |  "do dispositivo"   |
|    "O objetivo"     |   "revela"   |     "os parâmetros"      |    "qualitativos"    |    "da empresa"     |
|   "O diagnóstico"   |  "estimula"  |     "os progressos"      |     "analíticos"     |     "do grupo"      |
| "A experimentação"  |  "modifica"  |      "os conceitos"      |  "característicos"   | "dos beneficiários" |
|    "A formação"     | "clarifica"  | "os diferentes know-how" |   "motivacionais"    |   "da hierarquia"   |
|    "A avaliação"    |   "renova"   |      "os problemas"      |    "pedagógicos"     | "da prática comum"  |
|   "A finalidade"    | "identifica" |     "os indicadores"     |  "representativos"   | "dos procedimentos" |
|    "A expressão"    | "aperfeiçoa" |     "os resultados"      |   "contributivos"    |    "dos atores"     |
|   "O management"    | "desenvolve" |      "os efeitos";       |    "cumulativos";    |  "da problemática"  |
|     "O método"      |  "dinamiza"  |      "os bloqueios"      |    "estratégicos"    |  "das estruturas"   |
|    "A vivência"     |  "programa"  |   "os pré-requisitos"    | "neuro-linguísticos" | "do meta-contexto"  |
| "O reenquadramento" |   "pontua"   |      "os paradoxos"      |     "sistémicos"     |  "da organização"   |



Assuma que cada conjunto está organizado na forma de um vetor declarado como global, concretamente  `v1`, `v2`, `v3`, `v4` e `v5`.

1. Implemente uma função `falar_vacuosamente : unit -> string`  que produz uma tal frase aleatoriamente. 

   Para esse efeito poderá auxiliar-se da função `Random.int` do módulo OCaml `Random` (ver https://caml.inria.fr/pub/docs/manual-ocaml/libref/Random.html) :

   > `Random.int : int -> int`  
   >
   > `Random.int bound` returns a random integer between $0$ (inclusive) and `bound` (exclusive). `bound` must be greater than $0$ and less than $2^{30}$.

   Com o recurso desta função poderá sortear inteiros pertencentes ao intervalo $\{0..12\}$. Tenha em atenção que *não é esperado* que use funções como `Random.init` ou `Random.self_init` .  

------






##### Ex. totoloto


Neste exercício vamos simular um sorteio do totoloto.

1. Define o tipo `grelhas` como sendo o tipo das matrizes de booleanos.

2. Define uma função `make_grelha` que dado um inteiro `n` devolve uma grelha de tamanho $n\times n$  inicializada com o valor `False`.

3. Define uma variável global `grelha` de tipo `grelhas` como sendo uma grelha $7 \times 7$ .

4.  Define uma função `fill: int list -> grelha ` que, dada uma lista de $7$ inteiros distintos compreendidos entre $1$ e $49$, cria e preencha uma grelha  que é no final devolvida.  Na grelha, um valor do sorteio encontra-se com o valor `true`.

5. Definir uma função `sorteio : grelha -> int list -> int -> (int list * bool)` que dado um sorteio (lista de $6$ números  inteiros complementado com um inteiro -- o complementar) diz em quantos números se acertou, complementar incluído. 

   Por exemplo se o sorteio for $1$, $5$, $23$, $30$, $31$ e $45$  e o número complementar for $17$, e se a `grelha` em parâmetro contemplar $1$, $17$  e $30$, então a resposta a `sorteio grelha [1;5;23;30;31;45] 17` deverá ser `([1;30],true)` que significa  "acertou no $1$ e no $30$, e também no complementar".

   

------







### Nível Intermédio

------





##### Ex. Cálculos sobre Polinómios de uma variável - Método de Horner e derivação

 Podemos representar um polinómio $P$ de grau $n$ por uma lista $p$  de reais em o $i$-ésimo elemento da lista representa o coeficiente associado à potência de grau $i$. 

Assim, a título de exemplo, o polinómio $3x^4+5x^2+1$ é dado pela lista `[3;0;5;0;1]` (ou `[1;0;5;0;3]`, se preferirmos que o polinómio seja listado do grau mais fraco ao grau mais forte). Vamos assumir neste exercício que preferimos o grau mais forte à esquerda.

1.  Define o tipo `polinonio` como sendo uma lista de reais em par com um inteiro que representa o grau máximo deste polinómio.   Usando o exemplo acima descrito,  um valor de tipo `polinómio` é  `(4,[3;0;5;0;1])`.
2. Escreva uma função `horner : float -> polinomio -> float` que dado um $x$, calcule $P(x)$ usando o método de Horner, i.e.

$$
P_n(x)=(\cdots((a_n x + a_{n-1})x + a_{n-2})x + \cdots + a_1)x + a_0
$$

​		Assim  `horner 3.0 (4,[3;0;5;0;1])` devolve `289.0`.

3. Escreva uma função `deriva : polinomio -> polinomio` que, dado um polinómio $P(x)$ dado na forma de  uma lista, calcula o polinómio derivada de $P$ em $x$.  

   `deriva (4,[3;0;5;0;1])`  devolve `(3,[12;0;10;0])`.

4. Proponha nesta alínea uma versão recursiva terminal `deriva_rt : polinomio -> polinomio -> polinomio` da função `deriva`. 

------



##### Ex. RLE

Propomos neste exercício programar um método de compactação clássica e simples, designado de _run-length encoder_ (RLE).

Este método permite compactar sequências de elementos atuando sobre as subsequências que são repetições do mesmo elemento.  

É eficaz quando as sequências consideradas têm tendências em conter muitas ocorrências repetidas. Por exemplo é usada com conjunto com outros métodos de compactação que originam tais repetições (o método de _Burrows-Wheeler_) , na compactação de imagens, nalguns FAX, etc.

Para exemplificar utilizaremos  listas de caracteres, mas o método funciona para sequências de qualquer tipo.  

Assim ` aaiojanbeeebbaffssjjjjdreghsrf`  pode ser compactado  em `a2iojanbe3b2af2s2j4dreghsrf`.

A regra simples é  que cada subsequência de um caracter, digamos `x`, de comprimento `y` é substituída por `xy` que significa "`x`, `y` vezes".  A codificação RLE é a simples aplicação desta regra básica. A descodificação, que permite obter o texto original, reverte trivialmente este processo.

1.  Dado um elemento `x` de uma lista por compactar,  pretendemos definir a sua imagem pela codificação RLE. Se for uma ocorrência única então pretendemos que a codificação retorne `One x`, se for o primeiro elemento de uma repetição de comprimento `y ` , então pretendemos que a codificação devolva `Many (x,y)`. 

    Defina o tipo `rle_contents` do conteúdo de uma lista proveniente de uma codificação RLE, sabendo que a lista por codificar é uma lista qualquer (de tipo `'a list`). 	

2. Defina a função `rle_encode : 'a list -> 'a rle_contents list ` que  calcula a codificação da lista em parâmetro.  Por exemplo `rle_encode [1;1;3;3,3;2;5;5]` devolve `[Many (1,2); Many (3,3); One 2; Many (5,2)]`.

3. Define a função inversa, `rle_decode :  'a rle_contents list -> 'a list`.

------



##### Ex. Sequência máxima de `true`

Usando um _iterador_ (e.g. `fold_left`, `map`, `for_all`, `iter`, `exists`, `filter`,   etc. )  definir uma função `max_seq : bool list -> int`   que devolve o comprimento da maior sequência de valores `true` de uma lista de booleanos dada em parâmetro. Por exemplo  `max_seq [true;true; false ; true; false; true ; true; true: true; false;false;true]` devolve $4$.

------

##### Ex.  listas e sub-listas

1. Pretendemos definir a função `subslita: 'a list -> 'a list list` que permite calcular a lista de todas as sublistas de uma lista `l`  com os elementos apresentados na ordem da lista original`l`.

   Por exemplo  `sublista [a;b;c]` = `[[];[c];[b];[b;c];[a];[a;c];[a;b];[a;b;c]]` ou ainda,  `[a;c]` é  sublista de `[a;b;c]` mas não `[c;a]`.

   1. Qual é o resultado esperado para `sublista []`?
   2. Qual é o resultado esperado para `sublista [c]`?
   3. Qual é o resultado esperado para `sublista [b;c]`?
   4. Que padrão recursivo para a função `sublista` podemos inferir destes exemplos anteriores?
   5. Define a função `sublista : 'a list -> 'a list list`.

2. Pretendemos definir a função `subslita: 'a -> 'a list -> 'a list list` que permite calcular todas as formas de inserir um elemento `e` numa lista `l`. Assim inserir `e` na lista `[a;b;c]` pode resultar nas listas seguintes: 

   -   `[e;a;b;c]`
   -   `[a;e;b;c]` 
   -   `[a;b;e;c]`
   -   `[a;b;c;e]`

   1. Qual é o resultado esperado para `insertion e []`?
   2. Qual é o resultado esperado para `insertion e [c]`?
   3. Qual é o resultado esperado para `insertion e [b;c]`?
   4. Que padrão recursivo para a função `insertion` podemos inferir destes exemplos anteriores?
   5. Define a função `insertion e : 'a -> 'a list -> 'a list list`.

3. Vamos agora definir a função `permutation` que calcula  a lista de todas as permutações do seu parâmetro lista `l`. Por exemplo `permutation [a;b;c] = [[a;b;c];[b;a;c];[b;c;a];[a;c;b];[c;a;b]; [c;b;a]]`

   1. Qual é o resultado esperado para `permutation []`?
   2. Qual é o resultado esperado para `permutation [c]`?
   3. Qual é o resultado esperado para `permutation [b;c]`?
   4. Que padrão recursivo para a função `permutation` podemos inferir destes exemplos anteriores?
   5. Define a função `permutation : a list -> 'a list list`.

4. Finalmente queremos definir `subbag l` que calcula a lista de todas as permutações de todas as
   sublistas de `l`. Por exemplo, `subbag [a;b;c]= [[]; [a]; [b]; [c]; [a;b]; [a;c] ; [b;a] ; [b;c] ; [c;a] ; [c;b] ; [a;b;c]; [a;c;b] ; [b;a;c] ; [b;c;a]; [c;b;a] ; [c;a;b]]`.

   O que esta função calcula é algo de mais "explosivo" do que o conjunto de todos os subconjuntos de uma determinado conjunto (ou lista), tendo em conta que a ordem é relevante (`[a;b]` $\not =$ `[b;a]`).

   1. Define a função `subbag : a list -> 'a list list` tendo em conta as funções da alíneas anteriores.
   2. Não haverá forma de definir a função `subbag` diretamente, sem recorrer às funções das alíneas anteriores? Para tal Use a metodologia incremental sugerida nas alíneas anteriores para extrair um padrão que se possa programar.

------



##### Ex. _Randomness is hard!_

O problema que vamos resolver aqui resume-se na questão seguinte:

Tendo um vetor `v` de dimensão `n`  previamente inicializado, como misturar os seus elementos de uma  forma simples (i.e. não _muito_ custosa) e obter um uma mistura bem feita ?

Isto é, como obter uma permutação dos seu elementos que pareça realmente aleatória ?

O problema levantado por esta questão parece simples, mas não. Não é _imediato_ calcular de forma simples uma permutação que tenha boas propriedades de aleatoriedade.

Ronald Fisher e Frank Yates descreveram em 1938 no livro _Statistical tables for biological, agricultural and medical research_  um método que foi depois estudado e popularizado pelo próprio Donald Knuth,  _himself_... 

Este método ficou conhecido como o *Knuth shuffle* ou _Fisher-Yates-Knuth shuffle_.

```pseudocode
Para misturar um vetor v de n elementos (índices 0..n-1) fazer:
  para i de n - 1 até 1 fazer
       j = inteiro aleatório que verifica 0 <= j <= i
       trocar v[j] e v[i]
```

A propriedade essencial que este método garante é a de que qualquer permutação possível tem a mesma probabilidade em ser obtida por este método, inclusive o próprio vetor original.

Define a função `knuth_shuffle: 'a array -> unit` que  implemente o algoritmo acima apresentado. Tenha em atenção que o argumento é o vetor por misturar.  Os valores aleatórios poderão ser obtidos com o recurso à função `Random.int` do módulo OCaml `Random` (ver https://caml.inria.fr/pub/docs/manual-ocaml/libref/Random.html) :

> `Random.int : int -> int`  
>
> `Random.int bound` returns a random integer between $0$ (inclusive) and `bound` (exclusive). `bound` must be greater than $0$ and less than $2^{30}$.

Tenha em atenção que *não é esperado* que use funções como `Random.init` ou `Random.self_init` . 

------



#####   Ex. Zombie Attack!

O seu bairro sofreu uma invasões de zombies. Não fossem os gatos, naturalmente imunes a doença e predadores dos zombies, o seu bairro estava condenado.

O bairro tem a forma de um tabuleiro de *n* por *n* e cada célula do tabuleiro tem alternativamente uma pessoa, um gato ou um zombie.

Um zombie ataca os seus vizinhos de cima, de baixo, da direita e da esquerda. Quando um homem é atacado por um zombie, este transforma-se em zombie e ataca de seguida os seus vizinhos (mais uma vez, os de cima, baixo, esquerda e direita). Quando um gato é atacado, este simplesmente anula o ataque e fica como tal, um gato. Quando um zombie é atacado por outro zombie, estes dois olham-se com o que resta dos olhos deles e cancelam o ataque com um grunhido de desculpa.

A sua tarefa é, dado um tabuleiro preenchido com uma configuração inicial encontrar a configuração final. Haverá sobreviventes?

Um exemplo de configuração inicial pode ser:

![zombie-0](zombie-0.png) 

neste caso a configuração final é:

![zombie-11](zombie-11.png)


###### Tarefa por realizar:

Defina a função `zombie_attack : char array array -> char array array` que recebe a configuração inicial na forma de uma matriz quadrada de caracteres, e que calcula e devolve a configuração final.

Os caracteres que compõem a matriz são alternativamente a caracter * ("asterisco", que representa uma célula que alberga um zombie), ou a caracter X (que representa uma célula que contém um corajoso gato), ou finalmente a caracter . (“ponto”, que representa uma célula que contém um inocente transeunte).

A matriz não terá tamanho maior do que 1000.


###### Exemplos de entrada

```
*...*..
..XX...
.X..X..
..X..X.
X.X.X..
.X.X...
X.....*
```

###### Exemplo de saída 

```
*******
**XX***
*X..X**
**X..X*
X*X.X**
.X*X***
X******
```

------

 

##### Ex. Maioria absoluta!

Imagine um processo eleitoral que os candidatos são designados por um identificador inteiro (1,2,3 etc..).

Um voto, nesta configuração, é um inteiro que representa o candidato escolhido pelo votante.  Por exemplo o voto $3$, para designar que se votou no candidato $3$.

Os votos são  recolhidos num vetor e pretendemos então saber se existe maioria absoluta numa determinada votação. Neste caso o candidato com a maioria dos votos é vitorioso.

1. Define a função `maioria : int array -> int` que devolve o identificador do candidato vitorioso caso este tenha a maioria dos votos. Caso não haja maioria absoluta, a exceção `Not_found`  é lançada.
2. Analise o comportamento da solução proposta.  Assuma que a eleição tem $M$ candidatos e que se recolheu $N$ votos. No pior caso, quantas células do vetor teve de comparar para calcular a resposta? Qual é o tamanho da informação suplementar que teve de declarar para poder calcular a resposta (quantas variáveis auxiliares, quantos vetores  auxiliares e de que tamanho)?

Existe um algoritmo, designado de  *Algoritmo MJRTY*  da autoria de R. Boyer e  J. Moore, definido em 1980  e que permite determinar  se há vencedor por maioria no máximo em $2\times N$  comparações e que precisa de somente de $3$ variáveis para além do vetor dos votos. Outra vantagem é este não precisar de conhecer com quantos candidatos a votação conta.

A referência é 

>Robert S. Boyer, J. Strother Moore.  *MJRTY - A Fast Majority Vote Algorithm*.  In R.S. Boyer (ed.), Automated Reasoning: Essays in Honor of Woody Bledsoe, Automated Reasoning Series, Kluwer Academic Publishers, Dordrecht, The Netherlands, 1991, pp. 105-117.  http://www.cs.utexas.edu/users/boyer/mjrty.ps.Z
>
>

O algoritmo é

```pseudocode
Prelúdio: Os candidatos são designados por inteiros.
          a é o vetor dos votos  

seja m uma variável inteira  e i um contador inicializado a 0

para cada elemento x de a
  se i = 0  então m:=x e i:=1
  senão se m = x então incrementar i
  senão decrementar i

se i=0 então lançar Not_found
se i > ⌊|a|/2⌋ então retornar m

reinicializar i para 0
para cada elemento x de a
  se x = m então incrementar i
  
se i > ⌊|a|/2⌋ então retornar m
senão lançar Not_found
```

O primeiro ciclo do algoritmo pode ser graficamente apresentado da seguinte forma:





![](C:\Users\desousa\OneDrive - Universidade da Beira Interior\Aulas\PF\Laboratory\600px-Boyer-Moore_MJRTY.svg.png)

(retirado da wikipedia)



e serve para propor um candidato vencedor.  Sabe-se que será com certeza vitorioso por maioria absoluta se a vantagem que tem pelo valor de $i$ for de facto maior do que metade dos votos. Sabemos que a votação não discriminou nenhum vencedor se este mesmo valor for 0. Em qualquer outro caso, não se consegue apurar nada. Precisamos de uma nova contagem esclarecedora, desta vez dos votos do candidato proposto à vitória. 

No exemplo da imagem, se a votação só tivesse os 7 primeiros votos, então o candidato amarelo teria sido desmentido como vencedor no segundo ciclo.

3. Implemente a função `mjrty :int list -> int` que implementa este algoritmo. 

   Por exemplo `mjrty [1; 1; 2; 1; 2; 3; 3; 2; 2; 2; 1; 2; 2; 3; 2; 2] = 2`

   No caso de não haver vencedor por maioria absoluta, a função deverá lançar a exceção `Not_found`.

------



##### Ex. O problema da bandeira holandesa

Este problema  de programação foi originalmente proposto pelo  [Edsger Dijkstra](https://en.wikipedia.org/wiki/Edsger_Dijkstra) para ilustrar e evidenciar algumas propriedades esperadas de um algoritmo de ordenação, como a estabilidade.



Dada uma sequência arbitrária de bolas de 3 cores  de comprimento também arbitrário. Como ordenar esta sequência por forma  a que a sequência fique ordenada (as bolas azuis primeiro, seguido das bolsas brancas e finalmente as bolas vermelhas)?  Mais, pretende-se que a ordem original das bolsas de mesma cor seja respeitada ! 

Por exemplo, na sequência por ordenar , se uma bola azul particular está numa posição mais a esquerda de que uma outra bola de cor azul, então na sequência ordenada esta ordem se mantém (continua numa posição mais a esquerda do que a outra).  Diz-se desta ordenação que é *estável*.  

O algoritmo proposto por Dijkstra para este problema mostra que é possível ordenar uma coleção  de $n$ objetos coloridos usando um número *linear* de comparações de cores, embora os algoritmos de ordenação clássica (a família dos algoritmos de  ordenação que não usa a informação particular sobre os objetos por ordenar, por exemplo aqui o conhecimento de que só há três cores, azul, branco e vermelho)  precisam  em média (e no pior caso nos melhores algoritmos) de um número maior de comparações, na ordem de $n.log(n)$ .

Vamos assumir o tipo OCaml para representar as cores e as funções utilitárias seguintes:

 

```ocaml
type color = Blue | White | Red
type bola = (color*int)
let cor (c,_):bola = c 
let indice (_,i):bola = i
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



- Após executar este pseudocódigo no papel e corrigido os erros que este contém, defina a função  `dutch_flag : bola array -> bola array` que ordena o vetor parâmetro usando este algoritmo. Com o par `color * int`  associamos um índice a cada cor, o que permitirá verificar facilmente que o algoritmo proposto é estável.

  Assim `dutch_flag [(Red,0);(White,1);(Blue,2);(Red,3);(Blue,4);(White,5);(Blue,6);(Red,7);(White,8);(Blue,9)] = [(Blue,2);(Blue,4);(Blue,6);(Blue,9);(White,1);(White,5);(White,8);(Red,0);(Red,3);(Red,7)] `

------



##### Ex. Códigos de Gray

 Os códigos de Gray permitam uma codificação binária cómoda em que um só bit difere entre elementos consecutivos. 

Para simplificar, iremos  nos restringir ao caso dos inteiros. Neste caso, a codificação de $0$ é $0$ e a codificação de $1$ é $1$. A codificação de $17$ é   $11001$, a codificação de 18 é $11011$ e a
codificação de $19$ é $11010$. 

Uma forma simples de gerar os códigos de gray dos valores inteiros até ao tamanho $n$ (por exemplo $19$ tem uma codificação de tamanho $5$) é designada de método *reflex-and-prefix*.

Este método pode ser ilustrado pela figura seguinte.

```pseudocode
Base   espelho/prefixo n.1    espelho/prefixo n.2    espelho/prefixo n.3       
0 0      0  *0     0  00       0  *00     0  000      0  *000    0  0000
1 1      1  *1     1  01       1  *01     1  001      1  *001    1  0001 
        espelho   prefixo      2  *11     2  011      2  *011    2  0011
         2  *1     2  11       3  *10     3  010      3  *010    3  0010
         3  *0     3  10       espelho    prefixo     4  *110    4  0110
                               4  *10     4  110      5  *111    5  0111
                               5  *11     5  111      6  *101    6  0101
                               6  *01     6  101      7  *100    7  0100
                               7  *00     7  100      espelho    prefixo
                                                      8  *100    8  1100
                                                      9  *101    9  1101
                                                      10 *111    10 1111
                                                      11 *110    11 1110
                                                      12 *010    12 1010       
                                                      13 *011    13 1011
                                                      14 *001    14 1001 
                                                      15 *000    15 1000
```



- Define uma função `gray_list int -> string list` que dado um $n$ calcula todos os códigos de  gray  de tamanho $n$. Estes código são devolvidos na forma de uma lista de strings.

  Caso o argumento seja inválido, a exceção `Invalid_argument "gray_list"` é lançada.

  Por exemplo `gray_list 2 = ["000";"001";"011";"010";"110";"111";"101";"100"]` 

-  Define uma função `gray_code : int -> string` que dê o código de gray de um determinado inteiro $n$ em parâmetro, na forma de uma string.



O método *reflex-and-prefix* é de implementação simples mas não é eficiente. É possível calcular as codificações e descodificações de forma direta.

O algoritmo de codificação de um número `b` num código de Gray `g`  é muito simples, se usarmos operadores _bitwise_:

```
  g = b ^ (b >> 1)
```

Descodificação rápida para palavras de 64 bits (para 32, basta substituir o valor 32 por 16 no código)  em C:

```C
long grayInverse(long n) {
  long ish, ans, idiv;
  ish = 1;
  ans = n;
  while(1) {
   idiv = ans >> ish;
   ans ^= idiv;
   if (idiv <= 1 || ish == 32) // trocar 32 por 16 no caso duma representação 32 bits
     return ans;
   ish <<= 1; // duplica o número de shifts da próxima vez
   }
 }
```

- Define uma função `gray : int -> int` que calcula a codificação gray do seu parâmetro inteiro positivo. 

  Caso o argumento seja inválido, a exceção `Invalid_argument "gray"` é lançada.

  Por exemplo `gray 9 = 13`  (13 = 1101 em binário).

- Define a função `de_gray : int -> int` que faz a operação inversa, o da descodificação.

  Caso o argumento seja inválido, a exceção `Invalid_argument "de_gray"` é lançada.

  Assim, `de_gray 13 = de_gray 0b1101 = 9`   (`0b1101`  é 13 em notação binária ).

------



##### Ex.  Problema da sublista máxima

O problema da sublista máxima consiste em encontrar  numa lista de inteiros positivos ou negativos a maior soma dos elementos de uma sublista (contíguos) da lista dada.

Por exemplo,  na lista `[ -3, 6, -3, 4, -1, 2, 2, -5, 4 ]`, a sublista de maior soma é [4, -1, 2, 2] cuja soma é 7. Esta lista pode não ser única. Assim `[ -3, 7, -3, 4, -1, 2, 2, -5, 4 ]`  tem duas sublistas de soma máxima 7. Mas a maior soma, sim.

Para resolver este problema de forma eficaz Jay Kadane (Carnegie Mellon University) propôs em 1984 um algoritmo que resolve este problema percorrendo uma só vez a lista.

O algoritmo é descrito recursivamente da forma seguinte  : 

- se a lista l é vazia, então a soma máxima é $0$ 
- se a lista l é da forma $[v_1; v_2; \ldots ; v_ {i−1}; v_i; \ldots ; v_n]$ e $m$ é a maior soma possível  para a sublista que termina em $i-1$, então a maior soma de $[v_1; v_2; \ldots ; v_ {i−1}; v_i]$ é $max(v_i, m+v_i)$.

1.  Defina uma função `max_kadane : int list -> int`que implementa o algoritmo de _Kadane_ acima descritas e que assim devolve o valor da maior soma possível para uma sublista contígua da lista em parâmetro.   Poderá usar, se necessário, uma lista auxiliar para memorizar as maiores somas previamente calculados.
2.  Escreva uma função  `kadane : int list -> int list` que devolve a lista ( localizada o mais a esquerda, no caso de não ser a única)   de soma máxima.

------



### Nível Consolidado

------





##### Ex. subsequência de listas

Defina uma função `subseq : a list -> 'a list -> bool ` que determina se uma lista `w1` é uma subsequência de uma outra lista `w2`. Por `w1` subsequência de `w2` entendemos que podemos obter `w1` de `w2` removendo $0$ ou mais elementos desta última.   Por exemplo `[4;7;5;1]` é uma subsequência de  `[4;5;4;6;2;7;5;6;8;1;0]`.  De notar que este processo é um processo importante na analise computacional do genoma.

------



##### Ex. Parenteasar bem

Ter um texto bem _parenteseado_, isto é com os símbolos "(" ")"  devidamente usados, é uma necessidade comum, e de particular importância quando estes textos são alvo de um processamento por computador (pense num compilador, por exemplo). 

Vamos neste exercício propor  a verificação do bom uso de parêntesis  em qualquer texto organizado na forma de uma lista de caracteres.

Um texto é bem parenteseado se a qualquer ocorrência de "(" 

- está associada uma ocorrência de ")"  *à sua direita* 
- que o texto entre estes "(" ")" está também bem parenteseado.

Tenha em atenção que, em consequência,  a concatenação de dois textos bem parenteseados dá um texto bem parenteseado, e que colocar um texto bem parenteseado entre parêntesis dá um texto bem parenteseado.

- Defina uma função `verificar : char list -> char bool -> bool` que verifica se o texto contido no primeiro parâmetro está bem parenteseado. Sugere-se o uso do segundo parâmetro (outra `char list`, que designaremos de acumulador) para _acumular_ os resultados intermédios da verificação.  Assim, no início da verificação o acumulador está vazio, e se no decorrer da verificação o acumulador tiver como primeiro elemento uma parêntesis "(", então  a situação atual  da verificação ainda aguarda por um parêntesis ")"  que corresponde ao fecho do parêntesis do acumulador. Um uso adequado deste acumulador facilita em muito a verificação !

  Por exemplo :

  `verificar ['a';'(';'a';'b';'(';'b';')';'c';'(';'o';'k';'a';')';'n';')';'h'] [] = true`

------



##### Ex. A transformada de Burrows-Wheeler

A **transformada de Burrows-Wheeler (BWT)** é um processo de pré-tratamento para a compressão de dados, inventado por Michael Burrows e David Wheeler em 1984 (apos primeiros resultados de D. Wheeler) . Não se trata de um algoritmo de compressão visto este não reduzir o tamanho do texto processado mas a _BWT_ tem a propriedade de calcular permutações do texto que agrupam caracteres semelhantes.  Estes agrupamentos fazem do texto resultante um candidato  particularmente interessante para métodos de tipo _RLE_ (ver exercício desta ficha).

É uma técnica usada em sistemas de compressão como o _bzip2_ ou ainda na área da genómica computacional onde encontra aplicações na procura de alinhamento de sequências ou de repetições.

Mais detalhe em: 

- Michael Burrows, D. J. Wheeler: ["A block-sorting lossless data compression algorithm"](http://citeseer.ist.psu.edu/76182.html), 10th May 1994, Digital SRC Research Report 124.

- [Artigo do Dr. Dobb's sobre Burrows-Wheeler](http://marknelson.us/1996/09/01/bwt/)

O objetivo deste exercício é implementar o processo de codificação e o processo de descodificação. Para tal vamos ilustrar o processo com um exemplo completo para cada um dos processos. 

Pretendemos codificar com BWT a palavra "ANAGRAMA"

Codificação:

Primeiro, criamos uma matriz de characteres quadrada do tamanho da palavra por codificar.   Esta matriz é preenchida fazendo um _shift_  rotativo a direita:

```pseudocode
   matriz     

A N A G R A M A
A A N A G R A M
M A A N A G R A
A M A A N A G R 
R A M A A N A G
G R A M A A N A
A G R A M A A N
N A G R A M A A
```

Ordena-se as linhas desta matriz por ordem alfabética

```pseudocode
   matriz      # linha 

A A N A G R A M   1
A G R A M A A N   2
A M A A N A G R   3 
A N A G R A M A   4
G R A M A A N A   5
M A A N A G R A   6
N A G R A M A A   7
R A M A A N A G   8
```



A codificação será então  o par  `(4,"MNRAAAG")`. O 4 é o número da linha onde está a palavra original  na matriz ordenada. A palavra  "MNRAAAG" é a palavra constituída das letras da ultima coluna, de cima para baixo.

A decodificação começa em `(4,"MNRAAAG")` e reencontra apalavra "ANAGRAMA" sem o  conhecimento, claro, desta matriz.



- Escreva uma função `bwt: string -> int*string` que codifica uma palavra com o método BWT. 

  Assim `bwt "anagrama" = (4,"mnraaag")`.

- Escreva uma função `debwt : int * string -> string`.  Por exemplo, `debwt (4,"mnraaag") = "anagrama"`.



------



##### Ex. Crise de petróleo

O Sr. Smith está apaixonado e planeia visitar a dona de seu coração, Sra. Wesson. Mas também é avarento, o combustível é caro e a viagem tem que ser a mais barata possível, porque, como diz ao amigo Beretta, "dinheiro é para pão e rosas, não para combustível". Portanto, ele tem que planear com muito cuidado em quais estações de serviço ele deve parar e abastecer e quanto abastecer. 

O seu objetivo é ajudá-lo a planear a rota mais barata.

Por causa de sua avareza, o Sr. Smith acredita que tem que conduzir muito suavemente para obter o menor consumo (litros de combustível por 100 quilómetros). De facto, nas suas viagens de carro, obtém um consumo constante, digamos $c$ litros de gás por 100 quilômetros. Considere que a capacidade do tanque de combustível do Sr. Smith é de $l$ litros.

A Sra. Wesson vive a $ d $  quilômetros do Sr. Smith e existem $ n $ postos de gasolina ao longo do caminho. Estes são ordenados da estação $ 0 $ à estação $ n - 1 $.  Suponha, por uma questão de simplicidade, que $n$  seja menor ou igual a $100$. Para um posto de gasolina, digamos  $ i $, o preço do combustível por litro é $ p_i $, e a distância até o próximo posto de gasolina é $ d_i $. Suponha que para todos os $ i $ e $ j $ tais que  $ 0 \leq i, j \leq n-1 $, $ i \not = j$  implica que $ d_i \not = d_j $ (todos os $ d_i $s são distintos) . A distância entre o último posto de gasolina e a casa da Sra. Wesson é $ d_{n-1} $. Admita que para todos $ i $, tais que $ 0 \leq i \leq n-1 $ $, d_i $ é maior que $ 0 $. Temos então $ D = \sum^{n-1}_{i = 0} d_i $.

Suponha que o tanque do carro do Sr. Smith esteja vazio no início da viagem e que esteja estacionado ao lado do primeiro desses postos. O posto $ 0 $ é o ponto de partida. Suponha que todos os preços sejam distintos (não há dois postos de gasolina oferecendo o mesmo preço).

Numa imagem, a situação é a seguinte:

```-pseudocode
Mr. Smith                                                            Mr. Smith's heart
Station 0       Station 1       Station 2     ...       Station n-1           |
  *----------------*---------------*----------...----------*------------------*
   <------d0------> <-----d1------> <--d2---- ... -d(n-2)-> <-----d(n-1)----->
   <---------------------------------- d -----... --------------------------->
```

Seu trabalho é estabelecer em que postos de combustível ele tem de parar e quantos litros de combustível ele tem de abastecer em cada um deles para fazer a viagem mais conta possível. Lembre-se de que, em tal situação, o carro do Sr. Smith chega à casa da Sra. Wesson com o tanque vazio.

Para tal,  escreva a função `val percurso : (c:float) -> (l:int) -> (n:int) -> (dists: int array) -> (prices: float array) -> (int*float) list`   onde:

- `c` é o consumo (litros por 100 km) conseguido pelo Sr. Smith; 
- `l` é a capacidade do depósito de combustível  do carro do Sr. Smith; 
- `n` é o número de estações de serviço a considerar no percurso
- `dists` é o vetor das distâncias entre cada estação de serviço (os $d_i$s)
- `prices` é o vetor dos preços praticados para o combustível em cada estação (os $p_i$s)

O retorno da função é a lista ordenada pelo identificador numérico dos postos de gasolina onde o Sr. Smith tem de parar e para cada posto a quantidade de gasolina teve de atestar (na forma de um flutuante, com precisão de duas décimas).  Se não é possível realizar tal percurso, a lista devolvida é vazia.

Por exemplo,  com a entrada

```
c = 7.8
l = 30
n = 5
dists = [|170;100;150;120;50|]
prices = [|0.49;0.42;0.52;0.53;0.57|]
```

o resultado de `percurso c l n dists prices` deverá ser:

```
[(0,13.26);(1,30.00);(2,2.76)]
```

Com a entrada 

```
c = 8.8
l = 30
n = 3
dists = [|250;350;220|]  
prices = [|0.50;0.55;0.45|]
```

o resultado é :

```
[]
```

------



##### Ex.  Luigi’s Pizzeria - _From MIUP 2018_

Luigi’s new pizzeria has been the talk of the town in the past few weeks. Not only because it has the best pizzas you can find for miles, but also because of its crazy *all you can eat* policy.

You see, Luigi’s pizzas are enormous, and they are cut into very thin slices. And that’s not even the crazy part! Each slice has different ingredients and you can eat as many slices as you want. But there is one small caveat. You can only select adjacent slices and you have to eat them all! It is therefore very tricky for each client to select the best part of the pizza according to his own taste.

> ------
>
> ![img](pizzeria.png)
>
> Figure 1: Selected slices must be adjacent. The section in grey has a score of 20.
>
> ------

You enter the restaurant and see that today’s special pizza has been cut into *N* slices. After attributing scores $(S_1, \ldots , S_N)$ to each one of the slices, you must devise an algorithm that selects the section of the pizza that yields the best value according to those scores. The value of a section of pizza is the sum of the scores of its slices. Notice that slice scores can be negative.

1.  Define a function `score :int -> int list -> int ` that takes the number $N$ of slices in the pizza  and a list of $N$ integer ne contains the integers ($S_i$) that represent the score you attributed to each slice. These values follow these constraints : 

| $1 \leq N \leq 50 000$   | Number of slices.    |
| ------------------------ | -------------------- |
| $−100 \leq S_i \leq 100$ | Value of each slice. |

The function returns an integer that is equal to the value of the best possible section of adjacent pizza slices. The smallest possible section would be a single slice.

For instance, 

- `score 4 [2;-2;3;-1]` returns `4`.
- `score 16 [-1;1;3;-8;3;-2;5;10;-2;-5;4;1;-7;13;-8;4]` returns `20`.
- `score 4 [-1;-2;-3;-4]` returns `-1`.

------

