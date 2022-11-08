type color = Blue | White | Red

type bola = (color*int)

let cor ((c,_):bola) = c

let indice ((_,i):bola) = i
