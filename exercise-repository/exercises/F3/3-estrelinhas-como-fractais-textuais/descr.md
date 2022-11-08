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

Observe o seguinte padrão constituído de espaços e de asteriscos. 

```pseudocode
*
* *
  *
* * * *
    *
    * *
      *
* * * * * * * *
        *
        * *
          *
        * * * *
            *
            * *
              *
```


# Objetivos

Descubra as regras de construção que o estrutura e escreva uma função recursiva `estrelinhas : int-> unit` que dado um parâmetro inteiro $n$, potência de $2$ pertencente ao intervalo $[1\ldots 100]$, reproduza este padrão no `std_out` tal que a maior quantidade em linha de asteriscos seja $n$.

Por exemplo `estrelinhas 8` imprime o padrão acima apresentado.

No caso de um argumento inválido, a exceção `Invalid_argument "estrelinhas"` é lançada.
