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

Usando um iterador (e.g. `fold_left`, `map`, `for_all`, `iter`, `exists`, `filter`,  etc.) definir uma função `max_seq : bool list -> int` que devolve o comprimento da maior sequência de valores `true` de uma lista de booleanos dada em parâmetro. 

Por exemplo `max_seq [true; true; false ; true; false; true ; true; true; true; false; false; true]` devolve $4$.