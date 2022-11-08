let rec tribonacci n = 
  if n <= 2 then 1
  else (tribonacci (n-1)) + (tribonacci (n-2)) + (tribonacci (n-3))
  
let tribonacci_iter n =
  let n1 = ref 1 in
  let n2 = ref 1 in
  let n3 = ref 1 in
  
  for i=3 to n do
    let tmp = !n3 in
    n3 := !n1 + !n2 + !n3;
    n1 := !n2;
    n2 := tmp;
  done;
  !n3
    
let rec tribonacci_tail n a b c = 
  if n <= 2 then c
  else (tribonacci_tail[@tailcall]) (n-1) b c (a+b+c)