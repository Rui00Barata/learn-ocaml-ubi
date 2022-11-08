let rec euclides a b =
  if a < 0 || b < 0 then raise (Invalid_argument "euclides");
  if b = 0 then a
  else euclides b (a mod b)
