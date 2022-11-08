Dê o tipo das expressões seguintes:

1. `let x = read_int () in let y = read_float () in (x+1,y)`<br />
2. `let f a b c = b (c + a)`<br />
3. `let f a b c = b c`<br />
4. `let f a (b: int -> int) c = a (b c)`<br />
5. `let f a b c = a  (b c)`<br />
6. `let f a b c = c (b a)`<br />
7. `let o = ref (List.tl [1])`<br />
8. `let x = ref []`<br />
9. `let x = [ ( + ) 3 ; succ ; (fun x y -> List.length  x+ y) [1;5] ]`<br />
10. `let x y = y 1 in x (fun z -> z + 1) `<br />
11. `let f x y = function z -> y (List.map x z)`<br /><br />

**Nota:** Caso seja necessário utilizar o tipo `'_weak1` deverá fazê-lo da seguinte forma:<br />
  `type resposta = _weak1`, ou seja, sem o apóstrofe.