# Introdução

Considere o tipo 

```ocaml
 type info = int * string * float 
```

Escreva uma função `ord : info list -> info list` que ordena uma lista de elementos de tipo `info` em parâmetro com recurso à função `List.sort` e da seguinte forma, diferente do critério de ordenação lexicográfica:

- Primeiro ordenamos pelos inteiros. Os inteiros são ordenados pela ordem natural crescente;
- em caso de igualdade, ordenamos pelos reais, a terceira componente do triplo. Os reais são ordenados por ordem decrescente;
- em caso de igualdade, ordenados com base na componente do meio. Usamos para esta componente  a ordem natural lexicográfica.

Assim `ord [(5,"ola",1.5);(4,"tudo bem",4.4);(5,"olb",1.5);(5,"ola",1.6)]` devolve `[(4,"tudo bem",4.4);(5,"ola",1.6);(5,"ola",1.5);(5,"olb",1.5)]`.