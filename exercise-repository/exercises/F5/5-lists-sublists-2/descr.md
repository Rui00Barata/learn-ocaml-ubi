Pretendemos definir a função `insertion: 'a -> 'a list -> 'a list list` que permite calcular todas as formas de inserir um elemento `e` numa lista `l`. Assim inserir `'e'` na lista `['a'; 'b'; 'c']` pode resultar nas listas seguintes: 

- `['e'; 'a'; 'b'; 'c']`
- `['a'; 'e'; 'b'; 'c']` 
- `['a'; 'b'; 'e'; 'c']`
- `['a'; 'b'; 'c'; 'e']`

Resolva as seguintes questões: 

1. Qual é o resultado esperado para `insertion 'e' []`?
2. Qual é o resultado esperado para `insertion 'e' [c]`?
3. Qual é o resultado esperado para `insertion 'e' [b;c]`?
4. Que padrão recursivo para a função `insertion` podemos inferir destes exemplos anteriores?<br>
Tendo em conta esse padrão define a função `insertion : char -> char list -> char list list`.