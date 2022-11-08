# Introdução

Charles Babbage propôs um desafio de aritmética simples mas que pensava poder ser resolvido mais comodamente com _máquinas_  se estas existissem, em particular se ele  tivesse os meios de as construir.   

> Qual é o menor inteiro positivo cujo quadrado termina nos dígitos 269.696? 
>
> (Babbage, carta para Lord Bowden, 1837)


Ele achou que a resposta poderia ser 99.736, cujo quadrado é 9.947.269.696; mas ele não tinha certeza. 

Obviamente ele resolveu o problema com papel e caneta, mas é tao mais prático, **de facto** usar um programa de computador.

```c
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
```

# Objetivos

Esta é uma solução em C (retirada do excelente site _rosetta code_, apesar deste exemplo aqui...).

Infelizmente este código tem alguns problemas escondidos.

1. Qual das seguintes respostas é um dos problemas presentes:

    A) Existe a possibilidade de dividir por zero<br />
    B) Podemos gerar uma _segmentation fault_<br />
    C) A condição `(square>INT_MAX)` não faz sentido<br />
    D) O ciclo é infinito<br /><br />

2. Qual das seguintes respostas é um dos problemas presentes:

    A) A condição não está protegida contra os _integer overflow_<br />
    B) Potencias problemas de aproximações aritméticas<br />
    C) Problemas de conversão implícitas entre `float` e `int`<br />
    D) A variável `INT_MAX` não está definida no ambiente<br /><br />

3. Traduza o programa C **corrigido** para OCaml na forma de uma função `babbage : unit -> int`, que receba um argumento `unit` (o argumento vazio) e que retorne o inteiro pretendido pelo Charles Babbage.

4. Mas então, qual é este menor valor? 


**Nota:** Se achar que a opção correta é a `A` então deverá responder da seguinte forma: `let resposta = A`

# Opcional

Para sua curiosidade propomos um desafio opcional que poderá resolver na sua máquina:<br>
Não haverá melhor algoritmo? Se responder positivamente, proponha uma nova e otimizada versão OCaml. Defina a função seguinte: `babbage_opt : unit -> int`.