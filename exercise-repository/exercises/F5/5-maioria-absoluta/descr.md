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

Imagine um processo eleitoral que os candidatos são designados por um identificador inteiro (1,2,3 etc..).

Um voto, nesta configuração, é um inteiro que representa o candidato escolhido pelo votante. Por exemplo o voto $3$, para designar que se votou no candidato $3$.

Os votos são recolhidos num vetor e pretendemos então saber se existe maioria absoluta numa determinada votação. Neste caso o candidato com a maioria dos votos é vitorioso.

# Objetivos

1. Define a função `maioria : int array -> int` que devolve o identificador do candidato vitorioso caso este tenha a maioria dos votos. Caso não haja maioria absoluta, a exceção `Not_found` é lançada.

Existe um algoritmo, designado de *Algoritmo MJRTY* da autoria de R. Boyer e J. Moore, definido em 1980 e que permite determinar se há vencedor por maioria no máximo em $2\times N$ comparações e que precisa de somente de $3$ variáveis para além do vetor dos votos. Outra vantagem é este não precisar de conhecer com quantos candidatos a votação conta.

A referência é 

> Robert S. Boyer, J. Strother Moore.  *MJRTY - A Fast Majority Vote Algorithm*.  In R.S. Boyer (ed.), Automated Reasoning: Essays in Honor of Woody Bledsoe, Automated Reasoning Series, Kluwer Academic Publishers, Dordrecht, The Netherlands, 1991, pp. 105-117.  http://www.cs.utexas.edu/users/boyer/mjrty.ps.Z

O pseudo código do algoritmo é o seguinte:

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


![](https://i.imgur.com/TifapTj.png)

(retirado da wikipedia)



e serve para propor um candidato vencedor.  Sabe-se que será com certeza vitorioso por maioria absoluta se a vantagem que tem pelo valor de $i$ for de facto maior do que metade dos votos. Sabemos que a votação não discriminou nenhum vencedor se este mesmo valor for 0. Em qualquer outro caso, não se consegue apurar nada. Precisamos de uma nova contagem esclarecedora, desta vez dos votos do candidato proposto à vitória. 

No exemplo da imagem, se a votação só tivesse os 7 primeiros votos, então o candidato amarelo teria sido desmentido como vencedor no segundo ciclo.

1. Implemente a função `mjrty :int list -> int` que implementa este algoritmo. 

   Por exemplo `mjrty [1; 1; 2; 1; 2; 3; 3; 2; 2; 2; 1; 2; 2; 3; 2; 2] = 2`

   No caso de não haver vencedor por maioria absoluta, a função deverá lançar a exceção `Not_found`.