let rec comb n k =
  if k < 0 || n < 0 then 0 
  else if k = 0 || k = n then 1
  else (comb (n-1) (k-1)) + (comb (n-1) k)
                    
let narayana n k = 
  ((comb n k) * (comb n (k-1))) / n

let montanhas n k =
  if k > n || k <= 1 then None
  else Some (narayana n k)