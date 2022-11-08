let rec expo3 n =
  if n = 0
  then 1
  else
    3 * (expo3 (n-1))

let rec sum3 n =
  if n = 0
  then
    expo3 n
  else
    ((expo3 n) + (sum3 (n-1)))

let rec sum3_terminal n aux =
  if n = 0
  then
    aux + (expo3 n)
  else
    sum3_terminal (n-1) (aux + (expo3 n))
    

