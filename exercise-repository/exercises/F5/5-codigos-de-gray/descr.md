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

Os códigos de Gray permitam uma codificação binária cómoda em que um só bit difere entre elementos consecutivos. 

Para simplificar, iremos  nos restringir ao caso dos inteiros. Neste caso, a codificação de $0$ é $0$ e a codificação de $1$ é $1$. A codificação de $17$ é $11001$, a codificação de 18 é $11011$ e a
codificação de $19$ é $11010$. 

Uma forma simples de gerar os códigos de gray dos valores inteiros até ao tamanho $n$ (por exemplo $19$ tem uma codificação de tamanho $5$) é designada de método *reflex-and-prefix*.

Este método pode ser ilustrado pela figura seguinte.

```pseudocode
Base   espelho/prefixo n.1    espelho/prefixo n.2    espelho/prefixo n.3       
0 0      0  *0     0  00       0  *00     0  000      0  *000    0  0000
1 1      1  *1     1  01       1  *01     1  001      1  *001    1  0001 
        espelho   prefixo      2  *11     2  011      2  *011    2  0011
         2  *1     2  11       3  *10     3  010      3  *010    3  0010
         3  *0     3  10       espelho    prefixo     4  *110    4  0110
                               4  *10     4  110      5  *111    5  0111
                               5  *11     5  111      6  *101    6  0101
                               6  *01     6  101      7  *100    7  0100
                               7  *00     7  100      espelho    prefixo
                                                      8  *100    8  1100
                                                      9  *101    9  1101
                                                      10 *111    10 1111
                                                      11 *110    11 1110
                                                      12 *010    12 1010       
                                                      13 *011    13 1011
                                                      14 *001    14 1001 
                                                      15 *000    15 1000
```

# Objetivos

1. Define uma função `gray_list int -> string list` que dado um $n$ calcula todos os códigos de  gray  de tamanho $n$. Estes código são devolvidos na forma de uma lista de strings.

Caso o argumento seja inválido, a exceção `Invalid_argument "gray_list"` é lançada.

Por exemplo `gray_list 2 = ["000";"001";"011";"010";"110";"111";"101";"100"]`

2. Define uma função `gray_code : int -> string` que dê o código de gray de um determinado inteiro $n$ em parâmetro, na forma de uma string.

3. Define uma função `gray : int -> int` que calcula a codificação gray do seu parâmetro inteiro positivo. 

Caso o argumento seja inválido, a exceção `Invalid_argument "gray"` é lançada.

Por exemplo `gray 9 = 13`  (13 = 1101 em binário).

4. Define a função `de_gray : int -> int` que faz a operação inversa, o da descodificação.

Caso o argumento seja inválido, a exceção `Invalid_argument "de_gray"` é lançada.

Assim, `de_gray 13 = de_gray 0b1101 = 9` (`0b1101` é 13 em notação binária ).
