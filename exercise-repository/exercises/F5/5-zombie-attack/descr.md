# Introdução

O seu bairro sofreu uma invasões de zombies. Não fossem os gatos, naturalmente imunes a doença e predadores dos zombies, o seu bairro estava condenado.

O bairro tem a forma de um tabuleiro de *n* por *n* e cada célula do tabuleiro tem alternativamente uma pessoa, um gato ou um zombie.

Um zombie ataca os seus vizinhos de cima, de baixo, da direita e da esquerda. Quando um homem é atacado por um zombie, este transforma-se em zombie e ataca de seguida os seus vizinhos (mais uma vez, os de cima, baixo, esquerda e direita). Quando um gato é atacado, este simplesmente anula o ataque e fica como tal, um gato. Quando um zombie é atacado por outro zombie, estes dois olham-se com o que resta dos olhos deles e cancelam o ataque com um grunhido de desculpa.

A sua tarefa é, dado um tabuleiro preenchido com uma configuração inicial encontrar a configuração final. Haverá sobreviventes?

Um exemplo de configuração inicial pode ser:

![zombie-0](https://i.imgur.com/RXsUuzU.png) 

neste caso a configuração final é:

![zombie-11](https://i.imgur.com/dbRhGAv.png)


# Objetivo

Defina a função `zombie_attack : char array array -> char array array` que recebe a configuração inicial na forma de uma matriz quadrada de caracteres, e que calcula e devolve a configuração final.

Os caracteres que compõem a matriz são alternativamente a caracter * ("asterisco", que representa uma célula que alberga um zombie), ou a caracter X (que representa uma célula que contém um corajoso gato), ou finalmente a caracter . (“ponto”, que representa uma célula que contém um inocente transeunte).

A matriz não terá tamanho maior do que 1000.

Exemplos de entrada:

```
*...*..
..XX...
.X..X..
..X..X.
X.X.X..
.X.X...
X.....*
```

Exemplo de saída:

```
*******
**XX***
*X..X**
**X..X*
X*X.X**
.X*X***
X******
```