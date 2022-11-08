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
Podemos representar um polinómio $P$ de grau $n$ por uma lista $p$  de reais em o $i$-ésimo elemento da lista representa o coeficiente associado à potência de grau $i$. 

Assim, a título de exemplo, o polinómio $3x^4+5x^2+1$ é dado pela lista `[3;0;5;0;1]` (ou `[1;0;5;0;3]`, se preferirmos que o polinómio seja listado do grau mais fraco ao grau mais forte). Vamos assumir neste exercício que preferimos o grau mais forte à esquerda.

# Objetivos

1.  Escolha a alinea que melhor define o tipo `polinonio` como sendo uma lista de reais em par com um inteiro que representa o grau máximo deste polinómio.   Usando o exemplo acima descrito,  um valor de tipo `polinómio` é  `(4,[3;0;5;0;1])`.

    (a) `type polinomio = { grau : int; polinomio : float list }` <br />
    (b) `type polinomio = (int * (float list))`<br />
    (c) `type polinomio = ((float list) * int)`<br />
    (d) `type polinomio = { polinomio : float list; grau : int }`<br />
    (e) `type polinomio = (float * (int list))`<br />
    (f) `type polinomio = { polinomio : int list; grau : float }`<br /><br />

(NOTA: Se achas que a alinea correta é a a escreve: let resposta = "a")

2.  Escreva uma função `horner : float -> polinomio -> float` que dado um $x$, calcule $P(x)$ usando o método de Horner, i.e.

<center>
$P_n(x)=(\cdots((a_n x + a_{n-1})x + a_{n-2})x + \cdots + a_1)x + a_0$
</center>

​    Assim  `horner 3.0 (4,[3;0;5;0;1])` devolve `289.0`.

3. Escreva uma função `deriva : polinomio -> polinomio` que, dado um polinómio $P(x)$ dado na forma de  uma lista, calcula o polinómio derivada de $P$ em $x$.  

    `deriva (4,[3;0;5;0;1])`  devolve `(3,[12;0;10;0])`.

4. Proponha nesta alínea uma versão recursiva terminal `deriva_rt : polinomio -> polinomio -> polinomio` da função `deriva`.
