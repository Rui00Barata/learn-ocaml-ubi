type ponto    = {cx : float; cy : float}

type pontos   = ponto array

type segmento = {mutable quantos : int; mutable ini : ponto; mutable fim : ponto}

type reta     = V of float | E of float * float

let retas : (reta,segmento) Hashtbl.t = Hashtbl.create 97 
(* o valor 97 é pouco importante, é uma estimativa de tamanho *)