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

Defina uma função `subseq : 'a list -> 'a list -> bool` que determina se uma lista `w1` é uma subsequência de uma outra lista `w2`. Por `w1` subsequência de `w2` entendemos que podemos obter `w1` de `w2` removendo $0$ ou mais elementos desta última.   Por exemplo `[4;7;5;1]` é uma subsequência de  `[4;5;4;6;2;7;5;6;8;1;0]`. 
​