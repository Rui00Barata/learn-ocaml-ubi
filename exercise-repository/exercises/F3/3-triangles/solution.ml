let rec triangulos n = 
  if n < 3 && n >= 0
  then 1
  else (triangulos (n-2) + triangulos (n-3))