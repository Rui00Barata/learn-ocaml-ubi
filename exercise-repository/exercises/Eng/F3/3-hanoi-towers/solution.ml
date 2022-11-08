let hanoi n =
  let rec hanoi n a b c =
    if n <> 0 then (
      hanoi (pred n) a c b;
      Printf.printf "I move a disk from %d to %d\n" a c;
      hanoi (pred n) b a c)
  in
  hanoi n 1 2 3
