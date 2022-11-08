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

Imagine a seguinte situação. 

Tem uma fita de papel que vai querer dobrar ao meio n vezes.

A configuração inicial é (papel sem dobras, vista de perfil):

![](https://i.imgur.com/FrKFeHH.png)


Se dobrar uma vez e desdobar e deixar que o angulo faça 90º obtém, de perfil, a seguinte figura:

![](https://i.imgur.com/FdNQ01N.png)

Se dobrar duas vezes e desdobar e deixar que os ângulos obtidos façam 90º obtém, de perfil, a seguinte figura:

![](https://i.imgur.com/SKXenGJ.png)

Se dobrar três vezes e desdobar e deixar que os ângulos obtidos façam 90º obtém, de perfil, a seguinte figura:

![](https://i.imgur.com/ekQh8LV.png)


Muito rapidamente o exercício de dobra de papel torna-se penoso mas visualmente interessante (retirado do Wikipédia):


![](https://i.imgur.com/4RtPGWP.gif)


A fractal obtida chama-se de *curva do dragão*.

A imagem seguinte, (também retirado do Wikipédia) mostra como obter uma configuração a partir da anterior.

![](https://i.imgur.com/EY1Z8LP.png)

Vamos codificar estas figuras com palavras binárias. O princípio é quando se "um ângulo para a esquerda é 1" e "um ângulo a direita é 0". Assim:

- A fita com *zero* dobras é representada pela palavra vazia, $\epsilon$;
- A fita com *uma* dobra no meio é codificada pela palavra $0$;
- A fita com *duas* dobras no meio é codificada pela palavra $001$;
- A fita com *três* dobras no meio é codificada pela palavra $0010011$.

# Objetivos

Neste exercício estamos interessado em responder a duas perguntas: qual é a palavra obtida após n dobras? qual é o $m$-ésima letra da palavra? Para responder, vamos programar.

1. Define uma função `dragon_size: int -> int` que devolve o tamanho da palavra apos $n$ (dado em parâmetro, inteiro positivo, eventualmente nulo) dobras no meio. Por exemplo `dragon_size 4 = 15`. No caso de um argumento inválido, a exceção `Invalid_argument "dragon_size"` é lançada.

2. Define uma função `dragon: int -> bool list` que devolve a lista dos booleanos que formam a palavra da curva do dragão para n (em parâmetro) dobras. Por exemplo `dragon 3 = [false; false; true; false; false; true; true]`. No caso de um argumento inválido, a exceção `Invalid_argument "dragon"` é lançada.

3. define uma função `dragon_bit : int -> bool` que para um parâmetro $n$ inteiro positivo não nulo devolve o $n$-ésimo bit da sequência do dragão. Por exemplo `dragon_bit 11 = true`. No caso de um argumento inválido, a exceção `Invalid_argument "dragon_bit"` é lançada.
