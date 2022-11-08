# Introdução

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

int main(int argv, char ** argc) {
  if(argv != 2)
   {
     int n;
     printf("número de linhas? ");
     scanf(" %d",&n);
   }
  else print_triangle(atoi(argc[1]));

return 0;
}
```

# Objetivos

Escreva a função OCaml `print_triangle : int  -> unit` que realize esta mesma tarefa utilizando o output (`stdout`) para esse efeito.

**Exemplo:**
<br/>
Input:
```
print_triangle 5
```
<br/>
Output:
```
1
2  3
4  5  6
7  8  9  10
11 12 13 14 15
```