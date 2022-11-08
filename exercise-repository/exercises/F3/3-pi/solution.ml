let rec aproximar_pi n = 
  try
    let f = float_of_int n in
    if n < 1
    then raise (Failure "aproximar_pi")
    else 
      if n = 1
      then 2. *. (((f*.2.)*.(f*.2.))/.(((f*.2.)-.1.)*.((f*.2.)+.1.)))
      else (((f*.2.)*.(f*.2.))/.(((f*.2.)-.1.)*.((f*.2.)+.1.))) *. (aproximar_pi (n-1))
  with
    Stack_overflow -> raise (Failure "aproximar_pi")