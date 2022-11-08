# Introdução

Considere o seguinte programa C que calcula a soma dos dígitos de uma dado número.

```c
// Um programa C que calcula a soma dos dígitos de um dado inteiro 
# include<stdio.h> 
int getSum(int n) 
{ 
  int sum = 0; 
  while (n) 
  { 
    sum += n % 10; 
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

# Objetivos

1. Proponha uma versão iterativa, fiel à versão C, `get_sum_iter : int -> int`.<br/>
Assim, `get_sum_iter 3415 = 13`.

2. Implemente uma versão recursiva `get_sum_rec : int -> int`.<br/>
Assim, `get_sum_rec 3415 = 13`.