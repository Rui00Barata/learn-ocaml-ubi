Pretendemos definir a função `sublista: 'a list -> 'a list list` que permite calcular a lista de todas as sublistas de uma lista `l`  com os elementos apresentados na ordem da lista original`l`.

Por exemplo `sublista ['a'; 'b'; 'c']` = `[[];['c'];['b'];['b'; 'c'];['a'];['a'; 'c'];['a'; 'b'];['a'; 'b'; 'c']]` ou ainda, `['a'; 'c']` é sublista de `['a'; 'b'; 'c']` mas não `['c'; 'a']`.

1. Qual é o resultado esperado para `sublista []`?
2. Qual é o resultado esperado para `sublista ['c']`?
3. Qual é o resultado esperado para `sublista ['b'; 'c']`?
4. Que padrão recursivo para a função `sublista` podemos inferir destes exemplos anteriores?<br>
Tendo em conta esse padrão defina a função `sublista : char list -> char list list`.
