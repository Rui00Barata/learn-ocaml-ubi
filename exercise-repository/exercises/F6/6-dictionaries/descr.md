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

Uma estrutura de dados fundamental em programação é a estrutura de dicionário que exploraremos mais em detalhe nas aulas teóricas mais adiante. Vamos aqui ver muito brevemente como muito simplesmente as implementar com base na estrutura de lista associativa. 

Um dicionário é um mapa entre elementos designados de chave e elementos designados de conteúdo ou definição (para reforçar a analogia da designação de dicionário) . Por exemplo, num dicionário que associa números (as chaves, de tipo `int`)  a uma definição textual (o conteúdo, de tipo `string`), podemos ter, entre outras,  as associações seguintes: 

- $3 \mapsto$ "the first [Mersenne prime](https://en.wikipedia.org/wiki/Mersenne_prime)";
- $6 \mapsto$ "the first [perfect number](https://en.wikipedia.org/wiki/Perfect_number)";
- $42 \mapsto$ "the *[answer](https://en.wikipedia.org/wiki/The_Hitchhiker's_Guide_to_the_Galaxy)* to the ultimate question of life, the universe, and everything";
- $1729 \mapsto$ "the [Hardy–Ramanujan number](https://en.wikipedia.org/wiki/Hardy–Ramanujan_number)".



Podemos também considerar outros tipos de dicionários como o que contém as associações seguintes

- "Amélia"$\mapsto$ "O Crime do Padre Amaro";
- "Maria Eduarda" $\mapsto$ "Os Maias";
- "Maria Monforte" $\mapsto$ "Os Maias";
- "Vladimira" $\mapsto$ "O Mandarim";
- "Luísa" $\mapsto$  "O Primo Basílio".

De uma estrutura de tipo dicionário pretendemos funções 

1.  de criação, na forma de um mapa vazio ;
2.  de adição, "associar no dicionário esta chave a este conteúdo" ;
3.  de procura, "que conteúdo está associado a esta chave?" ;
4.  de remoção, "retirar a entrada associada a esta chave" ; 
5.  ou, finalmente, de presença, "está chave existe no dicionário?".

Propomos nestes exercício a criação de uma tal estrutura com base nas listas. Basta assim considerar o tipo duplamente polimórfico seguinte:

```ocaml
type ('a,'b) listdic = ('a*'b) list 
```

em que `'a` é a variável de tipo para o tipo das chaves e `'b` é a variável de tipo para o tipo  dos conteúdos.

Tais listas se designam de listas associativas e são de facto implementadas no módulo das listas [List](https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html#VALassoc). São práticas (i.e. _ready-and-simple-to-use_) mas ineficientes mal se considere dicionários de tamanho grande ou de uso intensivo. Recordam-se, as operações de _query_ são operações sobre uma estrutura de acesso sequencial... 

Assim o dicionário acima definido e que podemos chamar `queiros` é a lista `[("Luísa","O Primo Basílio");("Vladimira","O Mandarim");("Maria Monforte","Os Maias");("Maria Eduarda","Os Maias");("Amélia","O Crime do Padre Amaro")]`.

# Objetivos

1. Implemente a função `make_dic : unit -> ('a,'b) listdic ` que retorna um novo dicionário, inicialmente vazio.

2. Implemente a função `add_dic : 'a -> 'b -> ('a,'b) listdic -> ('a,'b) listdic  ` . Por exemplo, `let x = add_dic "Genoveva" "A Tragédia da Rua das Flores" queiros`  constrói um novo dicionário `x` inserindo a associação _"Genoveva" $\mapsto $  "A Tragédia da Rua das Flores"_ no dicionário `queiros` de personagens do Eça de Queirós previamente criado. 

3. Implemente a função `fetch_dic : 'a -> ('a,'b) listdic -> 'b ` . Caso a chave inserida não constar do dicionário, então deverá ser levantada a exceção `Not_found`. Assim,  `fetch_dic  42 numbers` devolve  "the answer to the ultimate question of life, the universe, and everything" e `fetch_dic "Manoel Coco" queiros`  levanta a exceção `Not_found`.

4. Implemente a função `rem_dic: 'a -> ('a,'b) listdic -> ('a,'b) listdic`. Se a chave da associação por remover não estiver no dicionário então a função não altera em nada o dicionário. Exemplos são: `rem_dic "Genoveva" x` devolve um dicionário em tudo igual ao dicionário `queiros` da alínea mais acima.  `rem_dic "Manoel Coco" queiros`  comporta-se como a função identidade sobre o segundo argumento e devolve `queiros`.

5. Implemente a função `mem_dic : a -> ('a,'b) listdic -> bool` . Assim `mem_dic "Maria Monforte" queiros` devolve `true`,   `mem_dic "Manoel Coco" queiros` devolve `false`. 
