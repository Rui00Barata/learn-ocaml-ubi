# Introdução

A **transformada de Burrows-Wheeler (BWT)** é um processo de pré-tratamento para a compressão de dados, inventado por Michael Burrows e David Wheeler em 1984 (apos primeiros resultados de D. Wheeler) . Não se trata de um algoritmo de compressão visto este não reduzir o tamanho do texto processado mas a _BWT_ tem a propriedade de calcular permutações do texto que agrupam caracteres semelhantes.  Estes agrupamentos fazem do texto resultante um candidato  particularmente interessante para métodos de tipo _RLE_ (ver exercício desta ficha).

É uma técnica usada em sistemas de compressão como o _bzip2_ ou ainda na área da genómica computacional onde encontra aplicações na procura de alinhamento de sequências ou de repetições.

Mais detalhe em: 

- Michael Burrows, D. J. Wheeler: ["A block-sorting lossless data compression algorithm"](http://citeseer.ist.psu.edu/76182.html), 10th May 1994, Digital SRC Research Report 124.

- [Artigo do Dr. Dobb's sobre Burrows-Wheeler](http://marknelson.us/1996/09/01/bwt/)

# Objetivos

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



A codificação será então  o par  `(4,"MNRAAAAG")`. O 4 é o número da linha onde está a palavra original  na matriz ordenada. A palavra  "MNRAAAG" é a palavra constituída das letras da ultima coluna, de cima para baixo.

A decodificação começa em `(4,"MNRAAAAG")` e reencontra apalavra "ANAGRAMA" sem o  conhecimento, claro, desta matriz.



- Escreva uma função `bwt: string -> int*string` que codifica uma palavra com o método BWT. 

  Assim `bwt "anagrama" = (4,"mnraaaag")`.

- Escreva uma função `debwt : int * string -> string`.  Por exemplo, `debwt (4,"mnraaag") = "anagrama"`.