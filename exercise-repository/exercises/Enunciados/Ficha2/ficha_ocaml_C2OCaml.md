# Ficha OCaml. Do familiar para o novo.

------





### Nível básico

------





------

##### Ex. Digit Sum



Considere o seguinte programa C que calcula a soma dos dígitos de uma dado número.

```c
// Um programa C que calcula a soma dos dígitos de um dado inteiro 
# include<stdio.h> 
int getSum(int n) 
{ 
  int sum = 0; 
  while (n) 
  { 
    sum +=  n % 10; 
    n /= 10; 
  } 
  return sum; 
} 
 
int main() 
{ 
 int n;
 printf("number? ");
 scanf("%d",&n); 
 printf("\n digit sum= %d \n", getSum(n)); 
 return 0; 
} 
```

Proponha duas versões OCaml da função `getSum`:



1. Uma versão iterativa, fiel a versão C, `get_sum_iter : int  -> int`. 

   Assim, `get_sum_iter 3415 = 13`

2. Uma versão recursiva `get_sum_rec : int -> int`.

   Assim, `get_sum_rec 3415 = 13`

------



##### Ex. Triângulo de Floyd

O triângulo de Floyd é uma matriz triangular de números naturais. O seu nome se refere ao Robert Floyd. 

É definido pelo preenchimento das linhas do triângulo com números consecutivos, começando com 1 no canto superior esquerdo. Assim o triângulo de Floyd com 5 linhas  é:

```
1
2  3
4  5  6
7  8  9  10
11 12 13 14 15
```

Um programa C que calcula este triângulo  com um dado número de linhas é: 

```c
#include<stdio.h>
#include<stdlib.h>

void print_triangle(int n)
{
  int value=1,i=0,line=0;
  for (line=1;line<=n;line++)
    {
      for(i=0;i<line;i++)
	   printf("%4d",value++); 
      printf("\n");
    }
}

int main(int argv,char ** argc) {
  if (argv!= 2)
   {
     int n;
     printf("número de linhas? ");
     scanf(" %d",&n);
   }
  else print_triangle(atoi(argc[1]));

return 0;
}
```



Escreva a função OCaml `print_triangle : int  -> unit` que realize esta mesma tarefa. Assim:

```ocaml
print_triangle 5 = () 
(*no stdin*)
1
2  3
4  5  6
7  8  9  10
11 12 13 14 15
```



------





### Nível Médio

------





##### Ex. Procura de número.

Charles Babbage propôs um desafio de aritmética simples mas que pensava poder ser resolvido mais comodamente com _máquinas_  se estas existissem, em particular se ele  tivesse os meios de as construir.   



> Qual é o menor inteiro positivo cujo quadrado termina nos dígitos 269.696? 
>
> (Babbage, carta para Lord Bowden, 1837)



Ele achou que a resposta poderia ser 99.736, cujo quadrado é 9.947.269.696; mas ele não tinha certeza. 

Obviamente ele resolveu o problema com papel e caneta, mas é tao mais prático, **de facto** usar um programa de computador.



````c
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
 
int main() {
	int current = 0, 	
	    square;
 
	while (((square=current*current) % 1000000 != 269696) && (square<INT_MAX)) {
		current++;
	}
 
	if (square > INT_MAX)
	    printf("Condition not satisfied before INT_MAX reached.");
	else		   
	    printf ("The smallest number whose square ends in 269696 is %d\n", current);
 
	return 0 ;
}
 
````



Esta é uma solução em C (retirada do excelente site _rosetta code_, apesar deste exemplo aqui...).

Infelizmente este código tem alguns problemas escondidos.

1.  Liste estas situações e proponha um programa C isento destes problemas. 
2.  Traduza o programa C corrigido para OCaml na forma de uma função `babbage : unit -> int` que de um argumento `unit` (o argumento vazio) calcula o inteiro pretendido pelo Charles Babbage . 
3.  Não haverá melhor algoritmo? Se responder positivamente, proponha uma nova e otimizada versão OCaml.  Esperamos a função seguinte:   `babbage_opt : unit -> int`.
4.  Mas então, qual é este menor valor?



------





##### Ex. Troca de variável, com poupança.

Há uma forma simples de trocar o valor de duas variáveis numéricas, digamos `x` e `y` sem usar uma variável auxiliar.



```` c
#include <stdio.h> 
int main() 
{ 
    int x,y; 
    
    printf("two numbers: ");
    scanf(" %d %d", &x, &y);
    
    printf("Before Swapping: x = %d, y = %d\n", x, y); 
    
    x = x + y; 
    y = x - y;  
    x = x - y;  
  
    printf("After Swapping: x = %d, y = %d\n", x, y); 
  
    return 0; 
} 

````



Este pequeno programa C implementa esta ideia simples. Mas, sem devidos cuidados, é uma prenda envenenada.

1. Proponha uma versão OCaml  na forma da função `swap : int -> int -> unit` cujo esqueleto se mostra aqui e que lhe pedimos por completar:

   ```ocaml
   let swap a b =
    let x,y = ref a , ref b in
    let ()  = Printf.printf "Before Swapping: x = %d, y = %d\n" !x !y in
    (*Por completar*)
    let ()  = Printf.printf "After Swapping: x = %d, y = %d\n" !x !y 
   ```

   

2. Liste os potenciais problemas que este programa tem (tanto na versão C como na versão OCaml). 

3. Proponha uma versão OCaml sem a parte _envenenada_, ou seja a função `nice_swap : int -> int -> unit`. Caso seja necessário poderá lançar a exceção `Failure "nice_swap"`

   

Uma alternativa ao método proposto é usar o operador _bitwise_ XOR para trocar para números. O operador XOR bit a bit avalia cada bit do resultado como 1 se os bits correspondentes dos dois operandos forem diferentes, caso contrário, avalia 0.

Sejam  `x` e `y` dois valores inteiros,  seja  `a` = `x XOR y`.  Agora `a XOR y` será avaliado como `x` e `a XOR x` será avaliado como `y`.

Uma solução em C pode ser:

````C
#include <stdio.h>

int main()
{
    int xnum1, num2;

    printf("two numbers: ");
    scanf(" %d %d", &x, &y);

    printf("Before Swapping: x = %d, y = %d\n", x, y); 

    x ^= y;
    y ^= x;
    x ^= y;
    
    printf("After Swapping: x = %d, y = %d\n", x, y);
    
    return 0;
}

````



4. Qual é o operador bitwise XOR em OCaml?
5. Proponha uma versão OCaml na forma da função `bitwise_swap : int -> int -> unit`.
6. Poderá esta solução também padecer do problema da solução original anterior?

------





##### Ex. Função de _Rolling Hash_ para _string_.

Uma função de _hash_ de uma _string_ tem por objeto a conversão de uma _string_ para um número inteiro que será intitulado  como _hash_ dessa _string_. Idealmente esta associação é única. Mas na prática duas _strings_ podem ter o mesmo _hash_ (fenômeno designado de **colisão**).

Uma _boa_ função de _hash_ é aquela  em que a probabilidade em ter o mesmo _hash_ para duas _strings_ diferentes é residual ou  é aquela para a qual é muito difícil saber que outra _string_ tem uma colisão com uma dada _string_. Este tema será abordado com mais detalhe mais adiante nesta matéria e no curso.

Um caso particular de função de _hash_ são as funções designadas de _rolling hash_. São funções auxiliares importantes em alguns algoritmos de processamento de texto.  Por exemplo o algoritmo de procura de _string_ em textos grandes  conhecido por **algoritmo Rabin-Karp para a procura em _string_**  usa  uma função de _rolling hash_ como função auxiliar.



Uma das funções _Rollin Hash_ mais simples calcula uma _hash_ para uma _string_ $s=s_0 s_1 s_2 ... s_k$  da seguinte forma:
$$
rollingHash(s) = (s_0 \times P^0 + s_1 \times P^1 + \ldots + s_k \times P^k)\ mod\ M
$$
os valores $P$ e $M$ devem ser escolhidos cuidadosamente e onde os $s_i$ são os valores numéricos associados a cada letra considerada.  Para o fim deste exercício, trabalharemos com _strings_ constituídas exclusivamente por letras minúsculas, assim  escolhemos $P=31$ e $M=1000000009\ (i.e. 10^9+9) $  e o valor de 'a' é $1$, o valor de 'b' é $2$, etc.  

Por exemplo $RollingHash("hello")= (8 + 5 \times P + 12 \times P^2 + 12 \times P^3 + 15 \times P^4)\ mod\ M.$



  ````c
long long rollingHash(char *str,int length)
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

  ````



1. Numa primeira versão, não tomaremos conta do tamanho dos inteiros manipulados, ou seja, vamos trabalhar com valores de tipo `int` na esperança que estes sejam suficientes. Proponha  uma versão OCaml desta função `rollingHash :  string  -> int` (o tamanho de uma _string_ pode ser calculado da própria string em OCaml, não é preciso fornecê-lo explicitamente).

   Assim `rolling_hash "hello" = 14222002`.

2. Pretendemos agora garantir este mesmo cálculo mas com base numa função recursiva 

   Assuma as definições seguintes:	

```
let p = 31                
let m = 1_000_000_000 + 9 
let code  c = Char.code c - Char.code 'a' + 1

let rec rolling_hash_rec s i hval powerp =
 (*Por completar *) 
  
let rolling_hash s = rolling_hash_rec s 0 0 1
```

​		Complete a definição da função `rolling_hash_rec`.

```
utop # rolling_hash "euqueroestarlaquandotutiveresdeolharparatrassemprequeroouvirsquiloqueguardasteparadizernofim";;

- : int = 130515272
```

3. Proponha agora uma redefinição da função `rolling_hash` (qualquer uma das duas acima referida) que recorra à aritmética de precisão arbitrária (módulo `zarith`).  A função esperada é: `rollingHash_wide :  string  -> Z.t`

```
utop # #require "zarith.top";;
utop # rolling_hash_wide "temmilanosumahistoriadeviveranavegarhamilanosdememoriasacontaraicidadeabeiramarazul"
;;
- : Z.t = 728940700
```



------



