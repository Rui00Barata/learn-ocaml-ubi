let verificar texto acumulador =
  let clean_acumulador acc =
    match acc with
    | c1::c2::t -> if c1 = ')' && c2 = '(' then t else acc
    | c1::[] -> acc
    | [] -> acc in
  let rec verificar_aux texto acumulador =
    match texto with 
    | c::t when (c = '(' || c = ')') -> verificar_aux t (clean_acumulador (c::acumulador))
    | c::t when (c <> '(' || c <> ')')  -> verificar_aux t acumulador
    | [] -> acumulador in
  (verificar_aux texto acumulador) = []