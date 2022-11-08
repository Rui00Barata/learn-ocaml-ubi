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

A formula de _Wallis_ permite uma aproximação de $\Pi$ definida nos termos seguintes:

<center>$\frac{\Pi}{2} = \frac{2\times 2}{1 \times 3} \times \frac{4\times
  4}{3 \times 5} \times \frac{6\times 6}{5 \times 7} \cdots$</center>

- Proponha uma definição recursiva desta aproximação, na forma de uma função $f$  que depende de um índice $k\geq 1$ tal que se $k=1$ a fórmula calculada $f(1)$ é

<center>$
2 \times \frac {2\times 2} {1 \times 3} 
$</center>

&emsp;&emsp;&emsp;, se $k=2$, a fórmula calculada $f(2)$ é  

<center>$
2 \times
\frac{2\times 2}{1 \times 3} \times \frac{4\times
  4}{3 \times 5}
$</center>

&emsp;&emsp;&emsp;, etc.

# Objetivo

Tendo definido esta função, implemente esta função em OCaml na forma da função `aproximar_pi : int -> float` que recebe o índice $k$ e devolve o resultado de $f(k)$.

Considere que $0 < k \leq 10000$. No caso de não ser possível calcular $f(k)$, `aproximar_pi` lança a exceção `Failure "aproximar_pi"`.

Um exemplo de execução é:  `aproximar_pi 5 = 3.00217595455690622`