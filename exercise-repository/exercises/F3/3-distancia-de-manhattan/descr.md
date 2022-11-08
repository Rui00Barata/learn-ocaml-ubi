# Introdução

Considere o problema da otimização de rotas de táxi em cidades modernas como  Manhattan, por exemplo. Considere o mapa seguinte em que as estradas estão assinaladas a cinzento. Considere igualmente que cada prédio da cidade, os quadrados brancos, tem por dimensão um. 

![](https://i.imgur.com/A4UYbex.png)

Qual é a menor distância de táxi entre o ponto inferior esquerdo e o ponto superior direito?

Se pudéssemos voar, a distância euclidiana seria a solução (a rota verde). Mas para a distância percorrida de carro, o cálculo deverá ser diferente. Assim sendo, qual é o comprimento da rota a vermelho? da rota azul? ou da rota amarela? 

# Objetivos

Com base na resposta a estas questões proponha a implementação em OCaml da função `manhattan_distance : int ->int -> int ->int -> int` tal que `manhattan_distance x y a b`calcule a distância de Manhattan entre o ponto **(x,y)** e o ponto **(a,b)**.
