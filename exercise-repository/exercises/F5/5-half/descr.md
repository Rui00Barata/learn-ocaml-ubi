Defina uma função `halve : int list -> (int list * int list)` que corta a lista que recebe ao meio. Em caso de lista de comprimento impar, o elemento do meio fica na lista da direita. 

Assim, `halve [1;2;3;4;5;6;7;8;9] =  ([1;2;3;4],[5;6;7;8;9])`.

De notar que existe uma resolução que usa uma função auxiliar recursivas terminal (com ais parâmetros do que `halve`), que só precisa de percorrer a lista completa uma vez e  uma vez a primeira metade.