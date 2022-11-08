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

# Introduction

A _hash_ function of a string has the objective of converting a string to an integer number, which is called the hash of that string. Ideally, this association is unique. In practice, however, two strings can have the same hash, which is a phenomenon called **collision**.

<br />

A _good_ hash function ensures that the probability of collisions is minimum, or that it becomes extremely hard to verify whether two different strings share the same hash or not.

<br />

A particular case of hash functions is the _rolling hash_ functions, which are important auxiliary functions for some text processing algorithms. For instance, the string-searching algorithm often used in hefty texts known as the **Rabin-Karp algorithm** uses an auxiliary rolling hash function.

<br />

<p>One of the most simple <emph>Rolling Hash</emph> functions finds a <emph>hash</emph> for a certain <emph>string</emph> $s=s_0 s_1 s_2 ... s_k$ in the following way:<p><br />

<center>$"rollingHash"(s) = (s_0 \times P^0 + s_1 \times P^1 + \ldots + s_k \times P^k)\ mod\ M$</center><br />

<p>where the values $P$ and $M$ must be chosen carefully and the $s_i$ are the numerical values associated with each considered letter. In the context of this exercise, we will work with <emph>strings</emph> composed exclusively of lowercase letters. Consequently, we choose $P=31$ and $M=1000000009\ (i.e. 10^9+9)$, having the value for 'a' being $1$, the value for 'b' being $2$, etc.</p><br />

For example:

<center>$"rollingHash"($"$"hello"$"$)= (8 + 5 \times P + 12 \times P^2 + 12 \times P^3 + 15 \times P^4)\ mod\ M.$</center><br />

```c
// In C:
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

# Objectives

Given the following:

```ocaml
let p = 31                
let m = 1_000_000_000 + 9 
let code  c = Char.code c - Char.code 'a' + 1
```

1. Firstly, we will not worry about the size of the integers. In other words, we will work with `int` values, hoping they will be large enough. Provide an OCaml version of the function shown above: `rolling_hash : string -> int`.<br />
    Thus, `rolling_hash "hello" = 14222002`.<br />
Note: The size of a string can be obtained by the `length` function from the `String` library, it does not need to be explicitly provided.

2. We now intend to implement a recursive version of the previous function with the following signature: `rolling_hash_rec : string -> int -> int -> int -> int`.<br />
<br />

**Note:** The function will have the format `rolling_hash_rec s i hash_val powerp`, where `s` is the `string` which hash we want to find, `i` represents the position in the string of the character the current call is working with, `hash_val` is the current call's hash value and `powerp` is the call's power of $P$ value. It will be tested in the following way: `rolling_hash_rec s 0 0 1`. 

  Example:

  ```ocaml
  utop # rolling_hash "ocaml";;

  - : int = 11470604

  utop # rolling_hash_rec "ocaml" 0 0 1;;

  - : int = 11470604
  ``` 