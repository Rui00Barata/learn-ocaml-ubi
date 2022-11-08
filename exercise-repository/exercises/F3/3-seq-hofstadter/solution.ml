let rec hhq r s n =
  begin 
    if n <= 0 || r>=s || s<2 then raise(Failure "hhq");
    if n <= s && n >= 1 then 1 
    else (hhq r s (n - (hhq r s (n-r)))) + (hhq r s (n - (hhq r s (n-s))))
  end
  