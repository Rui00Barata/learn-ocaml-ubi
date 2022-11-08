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

Finalmente queremos definir `subbag l` que calcula a lista de todas as permutações de todas as
sublistas de `l`. Por exemplo, `subbag ['a'; 'b'; 'c']= [[]; ['a']; ['b']; ['c']; ['a'; 'b']; ['a'; 'c'] ; ['b'; 'a'] ; ['b'; 'c'] ; ['c'; 'a'] ; ['c'; 'b'] ; ['a'; 'b'; 'c']; ['a'; 'c'; 'b'] ; ['b'; 'a'; 'c'] ; ['b'; 'c'; 'a']; ['c'; 'b'; 'a'] ; ['c'; 'a'; 'b']]`.

O que esta função calcula é algo de mais "explosivo" do que o conjunto de todos os subconjuntos de uma determinado conjunto (ou lista), tendo em conta que a ordem é relevante (`['a'; 'b']` $ne$ `['b'; 'a']`).

1. Define a função `subbag : char list -> char list list` tendo em conta as funções da alíneas anteriores.

Não haverá forma de definir a função subbag diretamente, sem recorrer às funções das alíneas anteriores? Para tal Use a metodologia incremental sugerida nas alíneas anteriores para extrair um padrão que se possa programar. Fica este desafio para vossa curiosidade.