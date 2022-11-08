Define as seguintes funções sobre listas:

1. A função `soma : int list -> int` que devolve a soma dos inteiros contidos na lista em parâmetro.
Por exemplo, `soma [1;5;3]` devolve `9`.<br />

2. A função `conta_pares : int list -> int` que devolve a quantidades de pares presentes na lista de inteiros em parâmetro.  Por exemplo `conta_pares [1;-6;3;17;4;80;-18]` devolve `4`.

3. A função booleana `palindroma : int list -> bool `, que devolve `true` se a lista em parâmetro é um palíndroma, `false` senão.  Por exemplo `palindroma [1;5;3;5;1]` devolve `true`.

4. A função `maiusculas : char list -> char list` que transforma cada caracter da lista que seja uma letra minúscula para uma letra maiúscula. Por exemplo `maiusculas ['a';'9';'T';'%';'z';'-']` devolve `['A';'9';'T';%';'Z';'-']`.

5. A função booleana `is_sorted : int list -> (int -> int -> int) -> bool`, que devolve true se a lista em parâmetro é ordenada conforme critério de ordenação indicado pelo segundo parâmetro.<br />
Assim, `is_sorted [1;3;7;9] compare` devolve `true`, `is_sorted [1;3;7;9] (fun a b -> compare b a)` devolve `false`. Relembramos que a função compare da biblioteca standard OCaml é definida como:<br />
```ocaml
compare a b = -1 se a < b
compare a b = 1 se a > b
compare a b = 0 se a = b
```

6. A função `remove_duplicate_sorted : int list -> int list` que remove os elementos duplicados de uma lista que se assume estar ordenada. Por exemplo `remove_duplicate_sorted [1;1;2;2;3,5;5;6;7;8;8;8;9]` = `[1;2;3;5,6;7;8;9]`.

7. A função `remove_ duplicate : int list -> int list` que remove os elementos duplicados de uma lista. Não se assume que esta esteja ordenada. `remove_duplicate [9;1;7;6;6;7;8;1;2;6;2;3;5;5;1;9]` = `[1;2;3;5,6;7;8;9]`.<br />
Tente, o quanto possível, usar os combinadores sobre listas (fold_left, map, for_all, iter, exists, filter, etc.)

