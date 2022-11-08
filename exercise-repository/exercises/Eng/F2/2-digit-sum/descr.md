# Introduction

Consider the following C program that calculates the sum of the digits of a given number.

```c
// A C program that calculates the sum of the digits of a given integer 
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

# Goals

1. Propose an iterative version, faithful to the C version, `get_sum_iter : int -> int`.<br/>
Thus, `get_sum_iter 3415 = 13`.

2. Implement a recursive version `get_sum_rec : int -> int`.<br/>
Thus, `get_sum_rec 3415 = 13`.