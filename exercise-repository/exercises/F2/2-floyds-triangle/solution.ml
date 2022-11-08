let print_triangle n =
  let value = ref 1 in
  for lines = 1 to n do
    for i = 0 to (lines-1) do
      print_int(!value);
      print_string "\t";
      value := !value + 1
    done;
    print_newline()
  done