let rolling_hash s =
  let          p = 31            in
  let          m = 1_000_000_009 in
  let power_of_p = ref 1         in
  let   hash_val = ref 0         in
  for i = 0 to String.length s - 1 do
    hash_val :=  (!hash_val + (Char.code s.[i] - Char.code 'a' + 1) * !power_of_p) mod m;
    power_of_p :=  (!power_of_p * p) mod m;
  done; !hash_val

let rec rolling_hash_rec s i hval powerp =
  if (i >= String.length s)
  then hval
  else rolling_hash_rec s (i+1) ((hval + (code s.[i])*powerp) mod m ) ((powerp*p) mod m)
  