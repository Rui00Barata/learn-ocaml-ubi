(* 1 *)
let rolling_hash s =
  let power_of_p = ref 1 in
  let hash_val = ref 0 in
  for i = 0 to (String.length s) - 1 do
    hash_val := (!hash_val + (code s.[i]) * !power_of_p) mod m;
    power_of_p := (!power_of_p * p) mod m
  done;
  !hash_val

(* Original version:
  let rolling_hash s =
  let          p = 31            in
  let          m = 1_000_000_009 in
  let power_of_p = ref 1         in
  let   hash_val = ref 0         in
  for i = 0 to String.length s - 1 do
    hash_val :=  (!hash_val + (Char.code s.[i] - Char.code 'a' + 1) * !power_of_p) mod m;
    power_of_p :=  (!power_of_p * p) mod m;
  done; !hash_val *)

(* 2 *)
let rec rolling_hash_rec s i hash_val powerp =
  if (i >= String.length s)
  then hash_val
  else rolling_hash_rec s (i+1) ((hash_val + (code s.[i])*powerp) mod m ) ((powerp*p) mod m)
  