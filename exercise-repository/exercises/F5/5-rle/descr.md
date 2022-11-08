# Introdução

Propomos neste exercício programar um método de compactação clássica e simples, designado de _run-length encoder_ (RLE).

Este método permite compactar sequências de elementos atuando sobre as subsequências que são repetições do mesmo elemento.  

É eficaz quando as sequências consideradas têm tendências em conter muitas ocorrências repetidas. Por exemplo é usada com conjunto com outros métodos de compactação que originam tais repetições (o método de _Burrows-Wheeler_) , na compactação de imagens, nalguns FAX, etc.

Para exemplificar utilizaremos  listas de caracteres, mas o método funciona para sequências de qualquer tipo.  

Assim ` aaiojanbeeebbaffssjjjjdreghsrf`  pode ser compactado  em `a2iojanbe3b2af2s2j4dreghsrf`.

A regra simples é que cada subsequência de um caracter, digamos `x`, de comprimento `y` é substituída por `xy` que significa "`x`, `y` vezes". A codificação RLE é a simples aplicação desta regra básica. A descodificação, que permite obter o texto original, reverte trivialmente este processo.

# Objetivos

1.  Dado um elemento `x` de uma lista por compactar,  pretendemos definir a sua imagem pela codificação RLE. Se for uma ocorrência única então pretendemos que a codificação retorne `One x`, se for o primeiro elemento de uma repetição de comprimento `y` , então pretendemos que a codificação devolva `Many (x,y)`. Qual das opções seguintes definem o tipo `rle_contents`:

    (a) `type rle_contents = int * (int*int)`<br />
    (b) `type rle_contents = One of int | Many of (int*int)`<br />
    (c) `type rle_contents = One | Many`<br />
    (d) `type rle_contents = { One : int; Many : int*int }`<br /><br />


2. Defina a função `rle_encode : int list -> rle_contents list ` que  calcula a codificação da lista em parâmetro.  Por exemplo `rle_encode [1;1;3;3,3;2;5;5]` devolve `[Many (1,2); Many (3,3); One 2; Many (5,2)]`.

3. Define a função inversa, `rle_decode :  'a rle_contents list -> int list`.
Por exemplo `rle_decode [Many (1,2); Many (3,3); One 2; Many (5,2)]`devolve `[1;1;3;3,3;2;5;5]`.