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

Considere  a seguinte função `future`:

```ocaml
let rec future d r =
    if d = 0 then r 
    else 
      let a = (d lsr 1) in  
      let b = (string_of_int (d land 1)) in
        future  a  (b ^ r) 
```


1. Dê o tipo da função `future`.

2. Qual é o valor devolvido por  `future 13 ""`?

3. Assumindo que na chamada inicial  o parâmetro `d`  é  um inteiro  natural e que `r` é a _string_ vazia `""`, o que calcula esta função:

    A) A função cria um palindroma a partir do parâmetro `d`<br />
    B) A função calcula o número de $1$ da respresentação binária de `d`<br />
    C) A função gera a representação binária de `d`<br />
    D) A função gera uma string de 0 e 1 de tal forma que haja um número ímpar de $1$ se o parâmetro `d` for ímpar e um número par de $1$ se o parâmetro `d` for par<br />

**Notas:** 
 - Escolha múltipla: Se achar que a opção correta é a `A` então deverá responder da seguinte forma: `let resposta = A`
 - Tipagem: Escreva o tipo da função na definição de tipo correspondente. Exemplo: `type p1 = float -> int`.