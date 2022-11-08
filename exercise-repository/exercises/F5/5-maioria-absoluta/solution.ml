(* 1 *)
let check_eleitor hashtable n numero_candidatos = 
    try ( let count = Hashtbl.find hashtable n in
        Hashtbl.replace hashtable n (count+1);)
    with Not_found ->
        ( Hashtbl.add hashtable n 1;
        numero_candidatos := !numero_candidatos + 1;)

let maioria array_votos = 
    let my_hash = Hashtbl.create 10 in
    let numero_candidatos = ref(0) in 
    let maioria = ref(0) in
    let numero = ref (0) in
    let lista_candidato_maioria = ref [] in
    begin
        for i=0 to (Array.length array_votos) - 1 do
            check_eleitor my_hash (array_votos.(i)) numero_candidatos;
        done;
        for i=1 to !numero_candidatos do 
            numero := Hashtbl.find my_hash i;
            if !maioria = !numero then lista_candidato_maioria := !lista_candidato_maioria @ [i]
            else if !maioria < !numero then ( maioria := !numero; lista_candidato_maioria := [i] )
            else ();
        done;
        if (List.length !lista_candidato_maioria) >= 2 then raise Not_found
        else List.nth !lista_candidato_maioria 0;
    end

(* 2 *)
let mjrty (a: ((int) list)) : int =
    let exception QtReturn of (int) in
    try
      let n = List.length a in
      let cand = ref (List.nth a 0) in
      let k = ref 1 in
      (let o = n - 1 in let o1 = 1 in
       for i = o1 to o do
         if !k = 0
         then begin cand := List.nth a i; k := 1 end
         else begin if !cand = List.nth a i then incr k else decr k end
       done);
      if !k = 0 then raise (Not_found);
      if !k > n / 2 then raise (QtReturn !cand);
      k := 0;
      (let o = n - 1 in let o1 = 0 in
       for i1 = o1 to o do
         if List.nth a i1 = !cand
         then begin incr k; if !k > n / 2 then raise (QtReturn !cand) end
       done);
      raise (Not_found)
    with
    | QtReturn r -> r