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

Este exercício debruça-se sobre a função de exponenciação inteira $x^n$. A definição natural e direta desta operação $x^n = \underbrace{x \times x \times \ldots \times x}_{n\ vezes}$  sugere $n$ multiplicações. Mas uma definição alternativa simples permite realizar o mesmo cálculo  minorando o número de multiplicações:


<center>$
x^n = {
(1, se\ n=0),
(x, se\ n=1),
(x^{\frac{n}{2}} \times x^{\frac{n}{2}}, se\ n\ par),
(x^{\frac{n-1}{2}}\times x^{\frac{n-1}{2}}\times x, se\ n\ ímpar
):}
$</center>


Tal método de exponenciação é, as vezes, designada de **exponenciação rápida**.

# Objetivos

1. Proponha uma função recursiva em OCaml que implemente esta definição.

2. Qual é a complexidade desta exponenciação (em número de multiplicações realizadas)?

    A) $\mathcal{O}(n)$ (linear) <br />
    B) $\mathcal{O}(n^2)$ (quadrática)<br />
    C) $\mathcal{O}(n * log_2(n))$ <br />
    D) $\mathcal{O}(log_2(n))$(logarítmica)<br />
    E) $\mathcal{O}(1)$ (constante)<br />
    F) $\mathcal{O}(n * log^2(n))$<br /><br />

**Nota:** Se achar que a opção correta é a `A` então deverá responder da seguinte forma: `let resposta = A`