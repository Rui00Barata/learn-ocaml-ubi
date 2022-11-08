# Introdução

Nos anos oitenta do século passado existiam livros jogos que tiveram sucesso juntos da juventude da época. Muito deles são informáticos hoje. Tipicamente estes livros são  um conjunto de parágrafos numerados, em que destacamos o primeiro, por ser o início da história.  Vamos aqui jogar a um destes livros jogo, simplificado. Neste livro jogo, os parágrafos são de dois tipos, que vamos aqui apresentar pelo exemplo.

Parágrafo de tipo Um.

> Paragrafo número X.
>
> Está numa sala e vê duas portas fechadas perto de si.  Como por magia, a  escuridão apodera-se da sala. Ouve o grunhir de algo parece ser de um cão enraivado a aproximar-se rapidamente de si.  Sente que algo lhe feriu a perna. Perde dez pontos de vida.   Tem de sair!  Por que porta escolhe fugir? Se escolher fugir pela primeira porta, vai para o parágrafo Y. Se escolher fugir pela segunda porta vai para o parágrafo Z.



  Parágrafo de tipo Dois.

> Paragrafo número Y.
>
> Entra numa sala onde encontra um assassino que tenta apunhala-lo. Reage instintivamente e salta para o lado. Lança um dado de 6 faces. Se obtiver 4 ou mais,  vá para o parágrafo U. Se obteve menos do que 4, vá para o parágrafo  V.  

  

Como vê, cada parágrafo 

  - tem um texto descritivo ;  

  - retira, dá ou mantém os pontos de vida do jogador ;

- tem  a informação sobre se o parágrafo conduz à vitória ou à morte imediata do jogador ;

- propõe uma sequência de saídas que 
  		

  - podem ser escolhidas pelo jogador (tipo um) ;

  - sorteadas (tipo dois). Neste caso, as saídas possíveis são todas equi-prováveis (como no exemplo) ;

  - uma nota: se o parágrafo for final (vitória ou morte), não há saídas consideradas.

      

O jogador, a cada momento do jogo, 

- tem pontos de vida;
- encontra-se num parágrafo particular do jogo.

 

O jogo começa com o parágrafo 0 e com o jogador com 100 pontos de vida.

O jogo termina se o parágrafo onde o jogador se encontra é um parágrafo de vitória, um parágrafo de morte, ou quando o jogador ficou sem pontos de vida (0 ou menos) aquando de uma ação despoletada no parágrafo em que este se encontra.

# Objetivo
O objetivo deste exercício é escrever uma função `play : player -> place -> unit` com base nos tipos seguintes : 

```ocaml
type status = Victory | Death | Continue
type place  = {id: int; descr: string; life: int ; is_random: bool;
              status: status;  mutable goto : place ref array}
type player = {mutable life: int; mutable location: place}

```

O tipo `place` representa um parágrafo, ou seja um momento na aventura.  Cada parágrafo é identificado por um inteiro único (campo `id`), contém a informação sobre o texto que o descreve (campo `descr`), sobre os pontos de vida que tira ou dá (valores negativos removem,  valores positivos juntam, campo `life`),  pela indicação de que o passos seguintes são escolhidos pelo "destino" (o campo `is_random`  é `true`)  ou pelo jogador (o campo `is_random`  é `false`).  A representação dos parágrafos também informam se  estes ditam o fim do jogador ou não (o campo `status` que pode ter os valores `Victory`, `Death`, ou nem um nem outro, o valor `Continue`). Os parágrafos a que um determinado parágrafo acede estão agrupados no campo `goto`. Para facilitar o _setup_ do jogo (a construção do cenário, da história, etc.)  antes de lançar o jogo em si, coloca-se o campo `goto` como mutável.

O tipo `player` representa os dados de um jogador, ou seja,  quantos pontos de vida tem e onde se encontra atualmente. Como ambos os campos de dados podem mudar, estes estão assinalados com a palavra chave `mutable`.



Assim a função `play` opera desta forma:

- imprime a descrição do parágrafo atual
- calcula os pontos de vida que resultam da aventura neste parágrafo
- conforme morre ou termina vitorioso, imprime o desfecho do jogo
- caso nenhum destes casos acontece, ou seja, se o jogo prossegue, então trata de levar o jogador para o próximo ponto da história. 

Para permitir que o jogador escolha uma opção particular no fim de cada parágrafo do primeiro tipo, o programa tem ao seu dispor uma função `get_answer n` que trata de pedir a introdução de um valor entre $0$ e $n-1$ e devolve este valor. No caso de um parágrafo de tipo dois (campo `is_random` é `true`),  esta escolha é sorteada (usar a função `Random.int` com o tamanho do vetor de saídas, i.e.  o campo `goto` da estrutura `place`) para determinar uma saída particular.

No caso de vitória a mensagem `Victory!` é apresentada numa linha. No caso de fim de jogo por morte, a mensagem `Game Over!` é apresentada numa linha.

Que a aventura seja vossa!