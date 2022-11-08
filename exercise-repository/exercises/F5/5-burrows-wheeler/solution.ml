(* 1 *)
let max_word = 1000;;

let (<<) f g x = f (g x);;
    
let list_of_string l =
  let temp = ref  [] in
  for i=0 to (String.length l) -1 do temp := l.[i]::!temp
  done; List.rev !temp;;

let with_nth_char m c = 
  String.mapi (fun i b -> if i = m then c else b);; 

let listachar_para_string lista = 
  let tamanho = List.length lista in
  let resultado = ref (String.make tamanho '0') in
  let rec aux i =
    if i >= tamanho then !resultado
    else (resultado := with_nth_char i (List.nth lista i) !resultado; aux (succ i)) in
  aux 0;; 

let rec last = function  [] -> failwith "too short list..." |  [el] -> el
                       | el::li -> last li ;;

let rec do_n n f l acc=  
  if n<=0 then acc
  else  let nl = f l in  do_n (n-1) f nl (nl::acc);;
  
let lexsort = List.sort compare;; 

let lrot = function [] -> [] | el:: li -> li@[el];;   

let rotations p =   let n = List.length p in do_n n lrot p  [];;
  
let bwp = (List.map last) << lexsort << rotations;;

let rec bwn_aux p r v = 
  match r with  [] -> failwith "bwn -> where is the word????"
              | pp :: li -> if p=pp then v else (bwn_aux p li (v+1));;

let bwn p =  bwn_aux p ((lexsort << rotations) p) 0;; 
  
let bwt palavra = 
  ((bwn (list_of_string(palavra)) + 1), listachar_para_string (bwp (list_of_string(palavra))));;

(* 2 *)

let index_table l n htbl = 
  for i = n-1 downto 0 do
    Hashtbl.add htbl l.(i) i
  done;;

let with_nth_char m c = 
  String.mapi (fun i b -> if i = m then c else b);;

let rosetta (last: char array) = 
  let n =  (Array.length last) in
  let r = Array.make n 0 in
  let first = Array.copy last in
  let _ = (Array.sort compare first) in 
  let indtbl = Hashtbl.create n in
  let _ =  (index_table first n indtbl) in
  for i=0 to (n-1) do
    let c = last.(i) in
    r.(i) <- Hashtbl.find indtbl c; 
    Hashtbl.remove indtbl c
  done; r;; 

let unbwt  (last: char array) rank rosetta =
  let n = Array.length last in
  let original = ref (String.make n '0') in
  let index = ref rank in
  for i = n-1 downto 0 do
    original := with_nth_char i (last.(!index)) !original;
    index := rosetta.(!index)
  done; !original;; 

let to_array (s:string) = 
  Array.init (String.length s) (String.get s);;

let debwt par_entrada = 
  match par_entrada with
  |(a,b) -> 
      let last,n = (to_array b,a) in
      (unbwt last (n-1) (rosetta last));;