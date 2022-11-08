# Introduction

Floyd's triangle is a triangular matrix of natural numbers. Its name refers to Robert Floyd.

It is defined by filling the triangle lines with consecutive numbers, starting from 1 in the upper left corner. Therefore, Floyd's triangle with 5 lines is:

```
1
2  3
4  5  6
7  8  9  10
11 12 13 14 15
```

A C program that calculates this triangle with a given number of lines is:

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
     printf("Number of lines? ");
     scanf(" %d",&n);
   }
  else print_triangle(atoi(argc[1]));

return 0;
}
```

# Objectives

Write the OCaml function `print_triangle : int -> unit` that performs the previous task using the output (`stdout`) for this purpose.

**Example:**
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