let max_seq lista_bool =   
    let max_seq_var = ref(0) and aux = ref(0) in
    begin
        List.iter (fun y -> if y then aux := !aux + 1 else ( if !aux > !max_seq_var then (max_seq_var := !aux); aux := 0)) lista_bool;
        !max_seq_var
    end
