# Introdução

Vamos aprender os benefícios da partilha.

Imagine que tem uma discografia de tamanho relevante e sempre a evoluir. Pretendemos poder juntar e listar as obras desta discografias conforme critérios bem definidos.   Uma obra discográfica é aqui resumida ao nome do artista / da banda, ao nome do álbum, ao seu ano de estreia e à lista dos estilos musicais a que pertence.

Os três critérios mais em uso na procura em obras discográficas é a procura por nome de artista, pelo ano e procura das obras pertencentes a um determinado estilo musical.

Por razões de eficiência, vamos pre-calcular todas estas procuras por forma a que estas estejam devidamente prontas de cada vez que são solicitadas. Assim uma procura resume-se numa listagem.

Esta abordagem é somente interessante se não houver duplicação dos dados. Ou seja, o arquivo de uma procura não deve resultar na duplicação de informação disco gráfica (i.e. cada procura tem uma cópia dos registos que vai listar). Este calculo prévio das procuras deve procurar partilhar!

Considere assim os seguintes tipos.

```ocaml
type disco = {banda          : string;
              titulo         : string;
              ano            : int;
              mutable estilo : string list}

type estiloDB = (string,disco list) Hashtbl.t
type bandaDB  = (string,disco list) Hashtbl.t
type anoDB    = (int,   disco list) Hashtbl.t
    
let bandas  : bandaDB  = Hashtbl.create 97 
let estilos : estiloDB = Hashtbl.create 97 
let anos    : anoDB    = Hashtbl.create 97 

```



De cada vez que uma obra é acrescentada no repositório, as três tabelas de _hash_ `bandas`, `estilos` e `anos` são atualizadas.  Seja `r` um registo de tipo `disco`. se atualizar as três tabelas de _hash_ correspondente com a informação de `r` (por exemplo, `Hashtbl.add bandas r.banda [v]`, no caso específico de só existir o álbum `r` para o artista de nome `r.banda`) então todas as tabelas se referem a `r` e não a cópias individuais de `r`.  Se entretanto alteramos o campo mutável de `r`, todas as ocorrências de `r` nas tabelas de _hash_ serão automaticamente atualizadas! Partilhamos com juízo e não desperdiçamos!

Numa imagem, podemos resumir esta partilha da seguinte forma:

![](sharing.png)


# Objetivos

Assim,

1. Defina uma função `add : ('a, 'b list) Hashtbl.t -> 'a -> 'b -> unit `.  Ao ser invocada por`add t k v`, a função `add` junta `v`à lista que corresponde a entrada `k` da tabela de _hash_ `t` em parâmetro.

2. Defina a função `add_album : string -> string -> int -> string list -> unit`  que quando invocada da seguinte forma `add_album band title year styles` cria  um registo de tipo disco com as informações dadas em parâmetros e atualiza as três tabelas de _hash_ `bandas`, `estilos`e `anos` em conformidade.

3.  Defina a função `add_style : string -> string -> string list-> unit` que junta um estilo musical  a um disco já existente na discografia.  Assim `add_style band album style` junta  o estilo musical  `style` no registo discográfica da banda/artista `band`de nome `album`. Se o registo discográfico ou a banda não existe, a exceção `Not_found` é lançada.  Se o estilo já existe no registo, nada é alterado. Se o estilo é novo, este é acrescentado à tabela dos estilos possíveis.  

4.  Defina a função `get_genre : string -> disco list`  que devolve a lista de obras discográficas de um determinado estilo musical passado em parâmetro. Caso este estilo não esteja presente na discografia, então a exceção `Not_found` é lançada.

5. À semelhança de `get_genre`, defina a função `get_records : string -> disco list `.  

6. À semelhança de `get_genre`, defina a função `get_year : int -> disco list`.   

7. Defina a função `get_discography : unit -> disco list` que devolve a discografia completa gravada.
