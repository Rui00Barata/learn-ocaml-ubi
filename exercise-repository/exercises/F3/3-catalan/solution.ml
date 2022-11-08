let rec catalan n =
  if n < 0 then invalid_arg "catalan";
  if n = 0 then 1 else catalan (n - 1) * 2 * (2 * n - 1) / (n + 1)
;;