Vamos agora definir a função `permutation` que calcula  a lista de todas as permutações do seu parâmetro lista `l`. Por exemplo `permutation ['a'; 'b'; 'c'] = [['a'; 'b'; 'c']; ['b'; 'a'; 'c']; ['b'; 'c'; 'a']; ['a'; 'c'; 'b']; ['c'; 'a'; 'b']; ['c'; 'b'; 'a']]`

1. Qual é o resultado esperado para `permutation []`?
2. Qual é o resultado esperado para `permutation ['c']`?
3. Qual é o resultado esperado para `permutation ['b'; 'c']`?
4. Que padrão recursivo para a função `permutation` podemos inferir destes exemplos anteriores?<br>
Tendo em conta esse padrão define a função `permutations : char list -> char list list`.