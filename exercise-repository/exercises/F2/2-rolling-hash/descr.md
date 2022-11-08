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

Uma função de _hash_ de uma _string_ tem por objeto a conversão de uma _string_ para um número inteiro que será intitulado  como _hash_ dessa _string_. Idealmente esta associação é única. Mas na prática duas _strings_ podem ter o mesmo _hash_ (fenômeno designado de **colisão**).

<br />

Uma _boa_ função de _hash_ é aquela  em que a probabilidade em ter o mesmo _hash_ para duas _strings_ diferentes é residual ou  é aquela para a qual é muito difícil saber que outra _string_ tem uma colisão com uma dada _string_. Este tema será abordado com mais detalhe mais adiante nesta matéria e no curso.

<br />

Um caso particular de função de _hash_ são as funções designadas de _rolling hash_. São funções auxiliares importantes em alguns algoritmos de processamento de texto.  Por exemplo o algoritmo de procura de _string_ em textos grandes  conhecido por **algoritmo Rabin-Karp para a procura em _string_**  usa  uma função de _rolling hash_ como função auxiliar.
<br />

<p>Uma das funções <emph>Rolling Hash</emph> mais simples calcula uma <emph>hash</emph> para uma <emph>string</emph> $s=s_0 s_1 s_2 ... s_k$ da seguinte forma:</p><br />

<center>$"rollingHash"(s) = (s_0 \times P^0 + s_1 \times P^1 + \ldots + s_k \times P^k)\ mod\ M$</center><br />

<p>os valores $P$ e $M$ devem ser escolhidos cuidadosamente e onde os $s_i$ são os valores numéricos associados a cada letra considerada.  Para o fim deste exercício, trabalharemos com <emph>strings</emph> constituídas exclusivamente por letras minúsculas, assim  escolhemos $P=31$ e $M=1000000009\ (i.e. 10^9+9)$  e o valor de 'a' é $1$, o valor de 'b' é $2$, etc. </p><br />

Por exemplo:

<center>$"rollingHash"($"$"hello"$"$)= (8 + 5 \times P + 12 \times P^2 + 12 \times P^3 + 15 \times P^4)\ mod\ M.$</center><br />

```c
long long rollingHash(char *str, int length)
{
    // P and M
    int p = 31;
    int m = 1e9 + 9;
    long long power_of_p = 1;
    long long hash_val = 0;
 
    // Loop to calculate the hash value by iterating over the elements of the string
    for (int i = 0; i < length; i++) {
        hash_val = (hash_val  + (str[i] - 'a' + 1) * power_of_p) % m;
        power_of_p  = (power_of_p * p) % m;
    }
    return hash_val;
}
```

# Objetivos

Assumindo que tem acesso a:

```ocaml
let p = 31                
let m = 1_000_000_000 + 9 
let code  c = Char.code c - Char.code 'a' + 1
```

1. Numa primeira versão, não tomaremos conta do tamanho dos inteiros manipulados, ou seja, vamos trabalhar com valores de tipo int na esperança que estes sejam suficientes. Proponha uma versão OCaml desta função rollingHash : string -> int (o tamanho de uma string pode ser calculado da própria string em OCaml, não é preciso fornecê-lo explicitamente).<br />
    Assim `rolling_hash "hello" = 14222002`.

2. Pretendemos agora garantir este mesmo cálculo mas com base numa função recursiva com a seguinte assinatura `rolling_hash_rec : string -> int -> int -> int -> int`.<br />
<br />
**Nota:** Seja `rolling_hash_rec s i hash_val powerp`, em que `s` é a `string` de que queremos obter o _hash_, o inteiro `i` representa a posição do caracter que estamos a avaliar, o inteiro `hash_val` é o valor do hash até ao momento da chamada e o inteiro `powerp` é o valor da potência na chamada. A função `rolling_hash_rec` será testada com os valores `rolling_hash_rec s 0 0 1` . 

  Exemplo de execução:

  ```ocaml
  utop # rolling_hash "euqueroestarlaquandotutiveresdeolharparatrassemprequeroouviraquiloqueguardasteparadizernofim";;

  - : int = 937205326

  utop # rolling_hash_rec "euqueroestarlaquandotutiveresdeolharparatrassemprequeroouviraquiloqueguardasteparadizernofim" 0 0 1;;

  - : int = 937205326
  ``` 