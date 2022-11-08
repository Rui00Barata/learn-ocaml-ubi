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

O jogo apresenta-se desta forma:

o tabuleiro tem 3 tores de madeira. Na configuração inicial, a torre da esquerda tem vários discos empilhados ordenadamente do maior ao menor. O jogo  consiste em deslocar um a um estes discos seguindo escrupulosamente regras simples que enunciamos a seguir por forma a obter a mesma pilha de discos do que a configuração inicial, mas na torre à direita. Por exemplo, a imagem mostra a configuração inicial, uma configuração intermédia e a configuração final, que significa  a vitória. A torre do meio poderá ser usada como recurso intermédio para a estratégia de deslocação dos discos de um lado para o outro.

![](https://i.imgur.com/8jZFFPB.png)



As regras do jogo são:

- Só podemos deslocar os discos que se encontram no topo de um empilhamento
- Só podemos colocar um disco num empilhamento se este for de tamanho menor do que o disco que se encontra no topo. 

Por exemplo na configuração intermédia apresentada na imagem, se quisermos mexer no empilhamento a esquerda, pela primeira regra, só poderemos tirar o circulo de cima.  Pela segunda regra ele não poderá ser colocado em nenhuma das duas outras torres. Porque é maior do que os discos que estão no topo de cada uma das torres em questão.


# Objetivo

Defina uma função `hanoi : int -> unit` que imprime a sequência de movimentos efetuados para ganhar o jogo com um número de discos igual ao parâmetros dado.  Assim, a solução ao jogo com 4 discos é calculada pela chamada `hannoi 4 `.  Esta chamada a função deve imprimir na saída standard:

```pseudocode
Desloco um disco de 1 para 2
Desloco um disco de 1 para 3
Desloco um disco de 2 para 3
Desloco um disco de 1 para 2
Desloco um disco de 3 para 1
Desloco um disco de 3 para 2
Desloco um disco de 1 para 2
Desloco um disco de 1 para 3
Desloco um disco de 2 para 3
Desloco um disco de 2 para 1
Desloco um disco de 3 para 1
Desloco um disco de 2 para 3
Desloco um disco de 1 para 2
Desloco um disco de 1 para 3
Desloco um disco de 2 para 3
```


Dica: poderá fazer sentido definir uma função auxiliar que tem por assinatura `hannoi_aux : int -> int int -> int -> int`  tal que `hannoi_aux n t1 t2 t3` significa deslocar o disco `n` de `t1` para `t2` usando como torre intermédia a torre `t3`.