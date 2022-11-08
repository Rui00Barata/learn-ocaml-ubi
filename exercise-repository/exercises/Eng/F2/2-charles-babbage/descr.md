# Introduction

Charles Babbage proposed a simple arithmetic challenge that he thought could be solved easily with machines if these existed. In particular, if he had the means to construct them.

> What is the smallest positive integer whose square ends in the digits 269.269?
>
> (Babbage, letter to Lord Bowden, 1837)


He thought the answer could be 99.736, which squared gives 9.947.269.696; although he wasn't sure.

He obviously solved the problem without a computer program, but using one is **so much** more practical.

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
	    printf("The smallest number whose square ends in 269696 is %d\n", current);
 
	return 0;
}
```

# Objectives

This is a solution written in C (taken from the amazing website _rosetta code_).

Unfortunately, this code has some hidden issues.

1. Which of these is a problem from the code above?

    A) There is a possibility for a division by zero<br />
    B) A _segmentation fault_ can be thrown<br />
    C) The condition `(square>INT_MAX)` does not make sense<br />
    D) The cicle is infinite<br /><br />

2. Which of these is another problem from the code above?

    A) The condition is not protected against an _integer overflow_ exception<br />
    B) There can be some issues with arithmetical approximations<br />
    C) Implicit conversions between `float` and `int` can cause problems<br />
    D) The variable `INT_MAX` is not defined in the scope<br /><br />

3. Translate the **corrected** C program to OCaml in the form of a `babbage : unit -> int` function that takes in a `unit` argument (an empty argument), and that returns the integer solution to the problem proposed by Charles Babbage.

4. So what exactly was the smaller value?


**Note:** Multiple choice: If you believe that the correct option is *`A`* then you should answer as follows: *`let answer = A`.

# Optional

For your curiosity, we propose an additional challenge that you can solve on your machine:<br>
Isn't there a better algorithm? If you answered affirmatively, propose a new and optimized OCaml solution. Define the following function: `babbage_opt : unit -> int`.