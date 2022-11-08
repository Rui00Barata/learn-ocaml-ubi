## Ficha OCaml. Cálculo  e recursividade.



### Nível Básico



------

##### Ex1.  Contas simples

- Define uma função `distancia :  (float * float) -> (float * float) -> float`  que calcula a distancia entre dois pontos dados em parâmetros.
- Defina uma função `area: float  -> float` que calcula a área de um círculo cujo o raio é dado em parâmetro. 
- Defina uma função `sin2x : float -> float` que, dado um parâmetro flutuante x, calcula a seguinte expressão: 

$$
\frac{2 \times tan~x}{1+tan^2~x}
$$

------



##### Ex. Um algoritmo histórico

Vamos implementar neste exercício um algoritmo histórico, foi formulado pelo próprio Euclides 300 AC.

Em particular, interessa-nos a versão recursiva. 
$$
mdc(a,b) = \begin{cases}a &se\ b=0\\ mcd(b,mod(a,b)) &sen\tilde{a}o\end{cases}
$$


- Defina uma função `euclides : int -> int -> int` que calcula o maior divisor comum com base no algoritmo acima descrito.  Assim, `euclides 36 45 = 9`. 

  No caso de um argumento inválido, a exceção `Invalid_argument "euclides"` é lançada.

------



##### Ex. a melhor forma de chegar ao infinito e mais além

Wilhelm Friedrich Ackermann, matemático alemão, contribuiu ao estudo das funções computáveis apresentando uma função com propriedades inéditas: uma função total computável que fugia, na data da sua descoberta, à classificação que se pensava ser a das funções com estas características.

Em parte porque a função... tem um comportamento explosivo!

A função originalmente proposta tinha 3 parâmetros, mas a que ficou registada para a história contempla dois parâmetros e é definida da seguinte forma:


$$
\begin{array}{lll}
A(0,n) &= & n + 1\\
A(m+1,0) &= & A(m,1)\\
A(m+1,n+1) &= & A( m,A(m+1,n))\\
\end{array}
$$


Calcule no papel o resultado de A(4,4).

Se ler esta frase, fique sabendo que A(4,2) tem como resultado um número com mais do que 19 mil dígitos ($2^{2^{2^{2^{2}}}}-3$) e que a alínea anterior resulta de uma piada de mau gosto que não se espere, claro, que resolva! 

Agora sim: defina a função recursiva  `ackermann int -> int -> int`  que calcula esta função.

Por exemplo `ackermann 3 4 = 125`

------



##### Ex. Aproximar $\Pi$

A formula de _Wallis_ permite uma aproximação de $\Pi$ definida nos termos seguintes:

$$
\frac{\Pi}{2} = \frac{2\times 2}{1 \times 3} \times \frac{4\times
  4}{3 \times 5} \times \frac{6\times 6}{5 \times 7} \cdots
$$

- Proponha uma definição recursiva desta aproximação, na forma de uma função $f$  que depende de um índice $k\geq 1$ tal que se $k=1$ a fórmula calculada $f(1)$ é  $2 \times
  \frac{2\times 2}{1 \times 3}$, se $k=2$, a fórmula calculada $f(2)$ é  $2 \times
  \frac{2\times 2}{1 \times 3} \times \frac{4\times
    4}{3 \times 5}$, etc.

- Tendo definido esta função, implemente esta função em OCaml na forma da função `aproximar_pi : int -> float` que recebe o índice $k$ e devolve o resultado de $f(k)$.

  Considere que $0 < k \leq 10000$. No caso de não ser possível calcular $f(k)$, `aproximar_pi` lança a exceção `Failure "aproximar_pi"`.

  Um exemplo de execução é:  `aproximar_pi 5 = 3.00217595455690622`

------



##### Ex. Algarismos

- Escreva uma função `algarismos : int -> int -> int*int*int` que recebe um inteiro $n$ e um algarismo $i$ e devolva o numero de vezes que este algarismo $i$ aparece em $n$, a soma dos algarismos de $n$ e finalmente o número de algarismos de $n$.

  Por exemplo, `algarismos 1073741823 3 = (2,36,10)`

------



##### Ex. As sequências de Hofstadter-Huber Qr,s(n)

Sejam $r$ e $s$ dois inteiros naturais positivos tais que $s\geq 2$ e $r<s$. Define-se por  sequência de Hofstadter-Huber de família $(r,s)$  a sequência determinada pela fórmula seguinte

$$
Q_{r,s}(n) =\left\{ 
\begin{array}{ll}
1 & se\ 1 \leq n \leq s,\\
Q_{r,s} (n - Q_{r,s} (n-r)) + Q_{r,s} (n - Q_{r,s} (n - s)) & se\ n>s\\
\end{array}
\right.
$$
em que $n$ é um inteiro positivo.

Esta família de valores sofre de irregularidades. Em particular  diz-se que _morre_ quando os valores 
$Q_{r,s}(n)$ não estão definidos (i.e. quando $n -  Q_{r,s}(n-r) < 1$  ou  $n -  Q_{r,s}(n-s) < 1$), ou quando qualquer outra condição estabelecida sobre $r$ e $s$ não é respeitada.

- Define a função `hhq : int -> int -> int -> int` tal que `hhq r s n` calcule  o valor de $Q_{r,s}(n)$ .

  No caso de um argumento inválido ou da deteção de qualquer situação anómala, a exceção `Failure "hhq"` é lançada. Assim, `hhq 1 4 12 = 7`.

------



##### Ex. As sequência fêmeas e machos de Hofstadter. 

Em "Hofstadter, D. R. *[Gödel, Escher, Bach: An Eternal Golden Braid.](https://www.amazon.com/exec/obidos/ASIN/0465026567/ref=nosim/ericstreasuretro)* New York: Vintage Books, p. 137, 1989.",  Hofstadter definiu várias sequências numérias, uma delas é o par de sequencias fêmeas e machos seguintes: 


$$
F(n) = \begin{cases}1&se\ n=0\\ n - M(F(n-1))&se\ n>0\end{cases}
$$

$$
M(n) = \begin{cases}0&se\ n=0\\ n - F(M(n-1))&se\ n>0\end{cases}
$$

- Define  a função `hfm : int  -> int*int` que, para um parâmetro inteiro positivo n devolve o par (f(n),m(n)).

  No caso de um argumento inválido ou da deteção de qualquer situação anómala, a exceção `Failure "hfm"` é lançada. 

  Assim, `hfm 7 = (5,4)`.

------







### Nível Intermédio

------





##### Ex.

Considere a expressão matemática

$\Sigma^n_{i=0} 3^i$

1. Defina a função `sum3 : int -> int` tal que `sum3 n` devolva o valor  $\Sigma^n_{i=0} 3^i$.
2. Dê uma versão recursiva terminal.
3. (opcional, se esta matéria for dada) Dê a versão CPS.  

------



##### Ex.

Considere a função _tribonacci_ seguinte, sobre inteiros naturais:
$$
tribonacci(n) = \left\{ \begin{array}{ll}
1&se\ n=0\\
1&se\ n=1\\
1&se\ n=2\\
\Sigma_{i=1}^3 tribonacci\ (n-i) &para\ n>2
\end{array}\right.
$$


1. Define a função recursiva em OCaml.
2. Define a versão iterativa (com ciclos e referências) em OCaml.
3. Dê uma versão recursiva terminal em OCaml
4. (opcional, se a matéria for dada) Dê uma versão CPS da função _tribonacci_.

------



##### Ex.

Considere a função seguinte:

```` ocaml
let rec h x y = 
    if x > y then 1 
    else if x < y then 2 * x  + h (x - 1) (y - 2) 
         else y * h x (y - 1) 
````



- Dê uma definição recursiva terminal desta função.

------



##### Ex.

Este exercício debruça-se sobre a função de exponenciação inteira $x^n$. A definição natural e direta desta operação $x^n = \underbrace{x \times x \times \ldots \times x}_{n\ vezes}$  sugere $n$ multiplicações. Mas uma definição alternativa simples permite realizar o mesmo cálculo  minorando o número de multiplicações:
$$
x^n = \begin{cases}
1&se\ n=0\\
x&se\ n=1\\
2 \times x^{\lfloor \frac{n}{2} \rfloor}2& se\ n\ par \\
\times x^{\lfloor \frac{n}{2} \rfloor}\times n&se\ n\ \acute{\imath}mpar
\end{cases}
$$


Tal método de exponenciação é , as vezes, designada de **exponenciação rápida**.

1. Proponha uma função recursiva em OCaml que implemente esta definição.
2. Qual é a complexidade desta exponenciação (em número de multiplicações realizadas)?
3. Dê uma versão recursiva terminal da exponenciação rápida



------



##### Ex. Catalã: um povo, um creme e uns números 

 Uma famosa sequência  de números inteiros conhecida por *Números de Catalan*  (do matemático belga Eugène Charles Catalan, 1814–1894) é definida por:
$$
Catalan(n) = \left\{\begin{array}[c]{ll}
    1&se\  n=0 \lor n=1\\
    \sum_{(p,q)\ tais\ que\ p+q=n-1} Catalan(p)*Catalan(q) &se\ n>1. 
\end{array}
\right.
$$
Esta sequência está envolvida na contagem de variadíssimos fenómenos combinatórios.



- Escreva um programa `catalan : in -> int` que recebe um inteiro natural $n$ e que calcule recursivamente o valor de $Catalan(n)$.

  No caso de um argumento inválido, a exceção `Invalid_argument "catalan"` é lançada.

  Assim, `catalan 6 = 132`.

------



##### Ex. Dicotomia

Seja `v` um vetor de inteiros *ordenado de forma crescente* de tamanho `n​`, e `x` um inteiro. 

Vamos definir uma função de pesquisa *eficiente* que tire proveito da ordenação do vetor.

Considere dois índices `i`, `j` do vetor `v` tal que $i\leq j$.  Vamos procurar x no vetor `v` entre os índices i e j, (notação $v[i \ldots j]$)



- Se  $i=j$ então $x\in v[i\ldots j]$ se e só se  $x = v[i]$. Senão:

- Se  $v[i] > x$ então sabemos que $x$ não está no segmento $[i,j]$ do vetor $v$. No melhor caso, está algures no segmento $[0,i[$ do vetor $v$.

- Se   $x < v[j]$ então sabemos que $x$ não está no segmento $[i,j]$ do vetor $v$. No melhor caso, está algures no segmento $]j,n[$ do vetor $v$.

- Se $v[i] \leq x \leq v[j]$ então sabemos que $x$ está possivelmente no segmento $[i,j]$ do vetor $v$. O que sabemos com toda a certeza é que x não está nem em $v[0 \ldots i-1]$  nem em $v[j \ldots n]$. Por isso a procura deve concentrar-se no segmento  $[i,j]$.  

  Temos $i<j$ , então, seja $m$ o índice "no meio", ou seja o maior inteiro que é menor ou igual à média de i e j.

  -  Se $x=v[m]$,  encontramos $x$.
  - Se $x > v[m]$, então o segmento $v[i\dots m]$  do vetor $v$ não contém x. Possivelmente estará em $v[m+1\ldots j]$
  - Se $x< v[m]$, então o segmento $v[m \ldots j]$  do vetor v não contém x. Possivelmente estará em $v[i\ldots m-1]$

  Este médio é designado de *procura/pesquisa binária* ou *procura dicotómica* 

  

- Defina uma função recursiva de pesquisa binária `binsearch_aux : 'a -> 'a array -> int -> int` . `binsearch_aux x v low high` procure  o valor `x`  no vetor ordenado  `v` entre os índices `low` e `high`. Esta função devolve o índice onde o valor `x` se encontra em `v` (no intervalo `low..high`) ou então a exceção `Not_found` em qualquer outra situação. 

  Por exemplo `binsearch_aux 12 [|1;2;5;7;12;16;23;33;78|] 2 6` devolve `4`.

- Defina uma função `binsearch : 'a -> 'a array -> int` que procura um valor x em todo o vetor ordenado `v`. Esta função devolve o índice onde o valor `x`se encontra em `v` ou então a exceção `Not_found`.  É aconselhado que use a função do ponto anterior.



De notar que esta pesquisa divide o espaço de procura por dois de cada vez que refina a sua pesquisa.  Esta característica melhora em muito os tempos de resposta.  O pior caso é quando o elemento procurado não está no vetor. Mesmo assim, o número de comparações realizadas pelo algoritmo nunca ultrapassa a ordem de $log_2(n)$ sendo $n$ o tamanho do vetor.

------



##### Ex. A função 91 de McCarthy.

Nos anos 70, John McCarthy, um dos pais da inteligência artificial,  em parceria com o Zohar Manna e Amir Pnueli, procurou definir uma função recursiva que seja um caso de escola para a verificação de programas.

Esta função é a função $m : \mathbb{N} \to \mathbb{N}$   definida da forma seguinte:
$$
m(n) = \begin{cases}n-10 &se\ n>100\\ m(m(n+11)) &se\ n\leq 100\end{cases}
$$


- Define a função `mccarthy : int -> int` que implemente esta definição recursiva. Por exemplo `maccarthy 200 = 190`, `mccarthy 24 = 91`

- Considere agora a função f91 definida da forma seguinte:
  $$
  f91(n) = \begin{cases}n-10 &se\ n>100\\ 91 &se\ n\leq 100\end{cases}
  $$
  Define uma função recursiva `mccarthy_is_f91 : int -> int -> bool`  que verifica se, no intervalo inteiro definido pelos dois inteiros parâmetros, as duas funções devolvem o mesmo resultado. por exemplo `mccarthy_is_f91 70 120 = mccarthy_is_f91 120 70 = true`.

------



##### Ex. Contar triângulos

Considere a seguinte sequência de triângulos equiláteros:



![](padovan.png)



Se listarmos o comprimento dos lados dos triângulos desta sequência temos:

$$1, 1, 1, 2, 2, 3, 4, 5, 7, 9, 12, 16, \cdots$$



- Define uma função `triangulos  : int -> int` que devolve o n-ésimo elemento desta sequência (que começa no índice 0).

  Por exemplo `triangulos 0 = 1`, `triangulos 3 = 2` e `triangulos 9 = 9`  

------



##### Ex. A conjectura de Collatz ou de Hailstones ou de Syracuse ou de mais uns nomes giros...



A conjetura de Collatz (ou Hailstones, ou de Syracuse) é da autoria do matemático alemão Lothar Collatz que desafiou a comunidade científica durante um evento na Universidade de Syracuse em 1928. A conjetura estabelece uma sequência de números (designada também de trajetória ou voo) que a partir de um número natural inicial obedece aos seguintes critérios:

- se *n* é par, então o sucessor de *n* na sequência é *n* divido por dois;
- se *n* é impar, então o sucessor de *n* na sequência é *n* multiplicado por 3 mais 1.
- juntamos o critério de paragem em 1.

Até a data de hoje, ninguém encontrou um numero inicial, *n*, que não gere uma trajetória que termine no número $1$!   (sem o critério de paragem,  obteríamos um ciclo que passaria _ad eternum_ pelo valor 1)

Exemplos
$$
6 \to 3 \to 10 \to 5 \to 16 \to 8 \to 4 \to 2 \to 1\\17 \to 52 \to 26 \to 13 \to 40 \to 20 \to 10 \to 5 \to 16 \to \cdots  \to 1
$$


- O seu desafio é escrever a função recursiva `collatz : int  -> int list`  em Ocaml que dado um parâmetro inteiro *n*, devolva a sequência de inteiros que corresponde a trajetória a partir do valor *n*. Obviamente esta sequência termina quando se atinge o valor 1.  Por exemplo 

  `collatz 6 = [6; 3; 10; 5; 16; 8; 4; 2; 1]`

- A função anterior dará rapidamente problemas quando o $n$ aumentar. Os valores manipulados aumentam significativamente e pode ser necessário usar uma representação numérica mais abrangente.  Para esse problema podemos recorrer ao  módulo `zarith` que fornece mecanismos de aritmética de precisão arbitrária. O tamanho da trajetória poderá também aumentar de forma significativa. Proponha assim  uma função recursiva `collatz_big : int -> unit` que *imprima* a trajetória  na saída standard. Para esse efeito poderá socorrer-se das seguintes definições:

```ocaml
let zero   = Z.zero
let one    = Z.one
let two    = Z.succ one
let three  = Z.succ two
let ( +> ) = Z.add (* a soma nos inteiros Z *)
let ( *> ) = Z.mul (* a multiplicação nos inteiros Z *)  
let ( /> ) = Z.div (* a divisão nos inteiros Z *)
let ( %> ) = Z.rem (* o resto da divisão euclidiana nos inteiros Z *)    
(* considere eventualmente as funções :  Z.to_string Z.of_string Z.of_int *)
```

Por exemplo, `collatz_big 27` devolve a trajetória seguinte no ecrã:

```pseudocode
27
82
41
124
62
31
94
47
142
71
214
107
322
161
484
242
121
364
182
91
274
137
412
206
103
310
155
466
233
700
350
175
526
263
790
395
1186
593
1780
890
445
1336
668
334
167
502
251
754
377
1132
566
283
850
425
1276
638
319
958
479
1438
719
2158
1079
3238
1619
4858
2429
7288
3644
1822
911
2734
1367
4102
2051
6154
3077
9232
4616
2308
1154
577
1732
866
433
1300
650
325
976
488
244
122
61
184
92
46
23
70
35
106
53
160
80
40
20
10
5
16
8
4
2
1
```



------



##### Ex. Estrelinhas como fractais textuais.

Observe o seguinte padrão constituído de espaços e de asteriscos. 

```pseudocode
*
* * 
  *
* * * *
    *
    * *
      *
* * * * * * * *
        *
        * *
          *
        * * * *
            *
            * *
              *
```



Descubra as regras de construção que o estrutura e escreva uma função recursiva `estrelinhas : int-> unit` que dado um parâmetro inteiro $n$, potência de $2$ pertencente ao intervalo $[1\ldots 100]$,  reproduza este padrão tal que a maior quantidade em linha de asteriscos seja $n$.

Por exemplo `estrelinhas 8` imprime o padrão acima apresentado.

No caso de um argumento inválido, a exceção `Invalid_argument "estrelinhas"` é lançada.

------



##### Ex. Números de Bell

Quantas formas temos de particionar um conjunto? Por exemplo, quantas formas temos de particionar $\{1,2,3\}$.


Neste exemplo, temos $5$ formas de particionar:
$$
\{1,2,3\};\ \{1,2\} \cup \{3\};\ \{1,3\} \cup \{2\};\ \{2,3\} \cup \{1\};\ \{1\}\cup\{2\} \cup \{3\};
$$

De uma forma geral, designa-se por $n$-ésimo número de Bell, $B_n$, o número de partição de um conjunto de $n$ elementos em sub-conjuntos não vazios.


Uma definição elegante destes números é:

$$\forall n \in \mathbb{N},\ \ B_n = \left\{ \begin{array}{ll} 1 &se\ n=0\\
    \sum_{k=0}^{n-1}  {{n-1}\choose{k}}\times B_k &se\ n>0\end{array}\right . $$

- Define uma função `bell : int -> string`  que, dado um parâmetro inteiro positivo `n` , calcula $B_n$.  

  Realça-se que a natureza desta sequência numérica leva a que seja necessária usar um tipo de dados numéricos com precisão arbitrária. OCaml fornece o módulo Zarith,  em particular o sub-módulo Z, para esse efeito. Será necessário neste exercício recorrer a ele. Pretende-se que o resultado final seja entregue na forma de uma string contendo o numero calculado (por exemplo recorrendo à função `Z.to_string`).

  Para fins de ilustração, `bell 33 = 1629595892846007606764728147`

No caso de um argumento inválido ou da deteção de qualquer situação anómala, a exceção `Failure "bell"` é lançada.

------





### Nível Consolidado



------



##### Ex. Quantas montanhas?

Vamos aqui considerar um problema clássico de combinatória (de contagem).

Dada um valor $n$, imagine uma paisagem de montanha inscrita numa grelha $(0,0)$ até $(2n,0)$. 

No nosso cenário, uma paisagem é constituída exclusivamente de montanhas cujo declive é uma diagonal _um por um_ ascendente ou descendente, que começa em $(0,0)$ e acaba em $(2n,0)$. 

Não se consideram também perfis de montanha que descem por baixo do eixo dos $x$.

O problema por resolver é: dado $n$ (que define o tamanho da paisagem) e o número $k$ de picos ($k$ sempre menor ou igual a $n$), quantos perfis montanhosos válidos existem? 

Por exemplo para $n=4$ e $k=3$, a resposta é $6$. Graficamente podemos visualizar as soluções da seguinte forma:

![](N43.png)





Damos igualmente dois valores limites para $N=4$, que são $k=1$ e $k=4$

![](N4.png)



Assumimos igualmente que $1\leq n \leq 30$  e  $1\leq k \leq n$.

* Define uma função `montanhas int -> int -> int option` que calcula precisamente  o número de perfis possíveis. Assim o resultado de `montanhas 4 3` é `Some 6`. Quando as regras sobre o `n` e o `k` não são cumpridas, ou por uma razão qualquer não é possível calcular o valor,  a função montanhas devolve `None`.  Assim, o resultado  `montanha 3 4` é `None`.

Dica:  considere os casos iniciais  ($n=1$ e $k=1$, seguido de  $n=2$ e $k=1$ ou $k=2$, etc. ) e veja se um padrão emerge a medida que calcula os casos seguintes.

------



##### Ex. A grandeza do Dragão.

Imagine a seguinte situação. 

Tem uma fita de papel que vai querer dobrar ao meio n vezes.

A configuração inicial é (papel sem dobras, vista de perfil):

![](dobras_0.png)

 Se dobrar uma vez e desdobar e deixar que o angulo faça 90º obtém, de perfil a seguinte figura:

![](dobras_1.png)

Se dobrar duas vezes e desdobar e deixar que os ângulos obtidos façam 90º obtém, de perfil a seguinte figura:

![](dobras_2.png)

Se dobrar três vezes e desdobar e deixar que os ângulos obtidos façam 90º obtém, de perfil a seguinte figura:

![](dobras_3.png)

Muito rapidamente o exercício de dobra de papel torna-se penoso mas visualmente interessante (retirado do Wikipédia):



![](DragonCurve_animation.gif)

A fractal obtida chama-se de *curva do dragão*.

A imagem seguinte, também retirado do Wikipédia) mostra como obter uma configuração a partir da anterior.

![](curva_ant.png)

Vamos codificar estas figuras com palavras binárias. O princípio é quando se "um ângulo para a esquerda é 1" e "um ângulo a direita é 0". Assim:

- A fita com *zero* dobras é  representada pela palavra varia, $\epsilon$.
- A fita com *uma* dobra no meio é codificada pela palavra $0$.
- A fita com *duas* dobras no meio é codificada pela palavra $001$
- A fita com *três* dobras no meio é codificada pela palavra $0010011$



Neste exercício estamos interessado em responder a duas perguntas: qual é a palavra obtida apos n dobras? qual é o m-ésima letra da palavra? Para responder, vamos programar.



1. Define uma função `dragon_size: int -> int` que devolve o tamanho da palavra apos $n$ (dado em parâmetro, inteiro positivo, eventualmente nulo)  dobras no meio. Por exemplo `dragon_size 4 = 15`.

   No caso de um argumento inválido, a exceção `Invalid_argument "dragon_size"` é lançada.

2. Define uma função `dragon: int -> bool list` que devolve a lista dos booleanos que formam a palavra da curva do dragão para n (em parâmetro) dobras. 

   Por exemplo `dragon 3 = [false;false;true;false;false;true;true]`.

   No caso de um argumento inválido, a exceção `Invalid_argument "dragon"` é lançada.

2. define a função `dragon_bit : int -> bool` que para um parâmetro $n$ inteiro positivo não nulo devolve o $n$-ésimo bit da sequência do dragão. Por exemplo `dragon_bit 11 = true`.

   No caso de um argumento inválido, a exceção `Invalid_argument "dragon_bit"` é lançada.

------



##### Ex. As Torres de Hanói.

Exploremos aqui outro exemplo clássico dos _jogos_ recursivos, as famosas torres de Hanói. 

O jogo apresenta-se desta forma:

o tabuleiro tem 3 tores de madeira. Na configuração inicial, a torre da esquerda tem vários discos empilhados ordenadamente do maior ao menor. O jogo  consiste em deslocar um a um estes discos seguindo escrupulosamente regras simples que enunciamos a seguir por forma a obter a mesma pilha de discos do que a configuração inicial, mas na torre à direita. Por exemplo, a imagem mostra a configuração inicial, uma configuração intermédia e a configuração final, que significa  a vitória. A torre do meio poderá ser usada como recurso intermédio para a estratégia de deslocação dos discos de um lado para o outro.

![](hanoi_istock.jpg)



As regras do jogo são:

- Só podemos deslocar os discos que se encontram no topo de um empilhamento
- Só podemos colocar um disco num empilhamento se este for de tamanho menor do que o disco que se encontra no topo. 

Por exemplo na configuração intermédia apresentada na imagem, se quisermos mexer no empilhamento a esquerda, pela primeira regra, só poderemos tirar o circulo de cima.  Pela segunda regra ele não poderá ser colocado em nenhuma das duas outras torres. Porque é maior do que os discos que estão no topo de cada uma das torres em questão.



- Defina uma função `hanoi : int -> unit` que imprime a sequência de movimentos efetuados para ganhar o jogo com um número de discos igual ao parâmetros dado.  Assim, a solução ao jogo com 4 discos é calculada pela chamada `hannoi 4 `.  Esta chamada a função deve imprimir na saída standard:

```pseudocode
Desloco um disco de 1 para 2
Desloco um disco de 1 para 3
Desloco um disco de 2 para 3
Desloco um disco de 1 para 2
Desloco um disco de 3 para 1
Desloco um disco de 3 para 2
Desloco um disco de 1 para 2
Desloco um disco de 1 para 3
Desloco um disco de 2 para 3
Desloco um disco de 2 para 1
Desloco um disco de 3 para 1
Desloco um disco de 2 para 3
Desloco um disco de 1 para 2
Desloco um disco de 1 para 3
Desloco um disco de 2 para 3
```



Dica: poderá fazer sentido definir uma função auxiliar que tem por assinatura `hannoi_aux : int -> int int -> int -> int`  tal que `hannoi_aux n t1 t2 t3` significa deslocar o disco `n` de `t1` para `t2` usando como torre intermédia a torre `t3`. 



------



