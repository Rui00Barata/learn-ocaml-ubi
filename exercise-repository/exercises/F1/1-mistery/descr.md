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

Considere  a seguinte função `mistery`:

```ocaml
let rec mistery x y z = 
  if y <= 0 then z else mistery x ( y - 1) (x * z)
```

1. Dê o seu tipo.

2. Qual é o valor devolvido por `mistery 2 3 1`?

3. Assumindo que os parâmetros todos são inteiros naturais, e que na chamada inicial `z` é $1$, o que calcula esta função:

    A) A função: $(x,y) \mapsto y^x$<br />
    B) A função: $(x,y) \mapsto y^x-1$<br />
    C) A função: $(x,y) \mapsto x^y$<br />
    D) A função: $(x,y) \mapsto (x-1)^y$<br />

**Notas:** 
 - Escolha múltipla: Se achar que a opção correta é a `A` então deverá responder da seguinte forma: `let resposta = A`
 - Tipagem: Escreva o tipo da função na definição de tipo correspondente. Exemplo: `type p1 = float -> int`.