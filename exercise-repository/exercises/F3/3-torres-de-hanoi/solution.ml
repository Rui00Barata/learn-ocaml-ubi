let hanoi n = 
  let rec hanoi n a b c =
    if n <> 0 then begin
      hanoi (pred n) a c b;
      Printf.printf "Desloco um disco de %d para %d\n" a c;
      hanoi (pred n) b a c
    end in 
  hanoi n 1 2 3
  