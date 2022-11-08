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

Afinal, brilhar num jantar é fácil, ser a estrela de um _vernissage_ é tão fácil como comer um _canapé_. Basta aplicar esta receita infalível.  Selecionar ao acaso um elemento de cada coluna aqui listada e juntar na ordem dos conjuntos para formar uma frase... _et voilá_.

Por exemplo, **"O diagnóstico identifica os bloqueios institucionais da prática comum"**. 

 
```ocaml
|     Conjunto 1      |  Conjunto 2  |        Conjunto 3        |      Conjunto 4      |     Conjunto 5      |
| :-----------------: | :----------: | :----------------------: | :------------------: | :-----------------: |
|   "A excelência"    |  "reforça"   |       "os fatores"       |   "institucionais"   |  "do desempenho"    |
|   "A intervenção"   |  "mobiliza"  |      "os processos"      |  "organizacionais"   |  "do dispositivo"   |
|    "O objetivo"     |   "revela"   |     "os parâmetros"      |    "qualitativos"    |    "da empresa"     |
|   "O diagnóstico"   |  "estimula"  |     "os progressos"      |     "analíticos"     |     "do grupo"      |
| "A experimentação"  |  "modifica"  |      "os conceitos"      |  "característicos"   | "dos beneficiários" |
|    "A formação"     | "clarifica"  | "os diferentes know-how" |   "motivacionais"    |   "da hierarquia"   |
|    "A avaliação"    |   "renova"   |      "os problemas"      |    "pedagógicos"     | "da prática comum"  |
|   "A finalidade"    | "identifica" |     "os indicadores"     |  "representativos"   | "dos procedimentos" |
|    "A expressão"    | "aperfeiçoa" |     "os resultados"      |   "contributivos"    |    "dos atores"     |
|   "O management"    | "desenvolve" |      "os efeitos";       |    "cumulativos";    |  "da problemática"  |
|     "O método"      |  "dinamiza"  |      "os bloqueios"      |    "estratégicos"    |  "das estruturas"   |
|    "A vivência"     |  "programa"  |   "os pré-requisitos"    | "neuro-linguísticos" | "do meta-contexto"  |
| "O reenquadramento" |   "pontua"   |      "os paradoxos"      |     "sistémicos"     |  "da organização"   |
```

Assuma que cada conjunto está organizado na forma de um vetor já declarado, no prelude, com os correspondentes nomes: `v1`, `v2`, `v3`, `v4` e `v5`.

# Objetivo

O objetivo deste exercício é o de implementar uma função `falar_vacuosamente : unit -> string` que produza uma frase aleatoriamente, utilizando os conteúdos dos vetores previamente citados. Por exemplo: `falar_vacuosamente () -> "A excelência aperfeiçoa os diferentes know-how cumulativos do dispositivo"` 


Para esse efeito poderá auxiliar-se da função `Random.int` do módulo OCaml `Random` (ver https://caml.inria.fr/pub/docs/manual-ocaml/libref/Random.html) 


> Random.int : int -> int
>
> Random.int bound returns a random integer between $0$ (inclusive) 
>  and `bound` (exclusive). `bound` must be greater than $0$ and less than $2^30$.


Com o recurso desta função poderá sortear inteiros pertencentes ao intervalo $\{0...12\}$. Tenha em atenção que *não é esperado* que use funções como `Random.init` ou `Random.self_init` .  
