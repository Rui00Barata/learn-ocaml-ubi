(* 1 *)
let myCompare x y = if x < y then 1 else -1

let sort1 vetor = 
    Array.sort myCompare vetor;
    vetor

(* 2 *)
let myCompare_Impares x y = if x < y then 1 else -1

let myCompare_Pares x y = if x < y then -1 else 1

let sort2 lista : int list = 
    let lista_pares = ref [] and lista_impares = ref [] in
    begin
        List.iter (fun x -> if (x mod 2) = 0 then 
            lista_pares := !lista_pares @ [x]
        else 
            lista_impares := !lista_impares @ [x]) lista;

        lista_impares := List.sort myCompare_Impares !lista_impares;
        lista_pares := List.sort myCompare_Pares !lista_pares;
        !lista_impares @ !lista_pares
    end

(* 3 *)
let myCompare_Impares x y = if x < y then 1 else -1

let myCompare_Pares x y = if x < y then -1 else 1

let sort3 vetor : int array = 
    let lista = ref [] in
    let lista_pares = ref [] and lista_impares = ref [] in
    begin
        lista := Array.to_list vetor;
        List.iter (fun x -> if (x mod 2) = 0 then 
            lista_pares := !lista_pares @ [x]
        else 
            lista_impares := !lista_impares @ [x]) !lista;

        lista_impares := List.sort myCompare_Impares !lista_impares;
        lista_pares := List.sort myCompare_Pares !lista_pares;
        Array.of_list (!lista_impares @ !lista_pares)
    end

(* 4 *)
let digits n =
  let rec loop n acc =
    if n = 0 then acc
    else loop (n/10) (n mod 10::acc) in
  match n with
  | 0 -> [0]
  | _ -> loop n [] 

let myCompare x y =
  let x_list = List.rev (digits x) and y_list = List.rev (digits y) in
  let value = ref(0) and flag = ref(true) in
  let big_number = if List.length x_list > List.length y_list then 1 else -1 in
  for i=0 to ((min (List.length x_list) (List.length y_list)) - 1) do 
    if List.nth x_list i > List.nth y_list i && !flag then ( value := 1; flag := false ) 
    else if List.nth x_list i < List.nth y_list i && !flag then ( value := -1; flag := false ); 
  done; if !value = 0 then big_number else !value

let sort4 lista = 
  List.sort myCompare lista 
    
    
