let p1 = C

let p2 = A

let babbage () = 
  let current = ref 0 in
  let square = ref 0 in
  begin 
    while (((!square mod 1000000) <> 269696) && (!square<max_int)) do
      current := !current + 1;
      square := !current * !current
    done;

    if (!square > max_int)
    then
      -1
    else
      !current     
  end

let p4 = 25264