(*
  ##########################
  #       DATA TYPES       #
  ##########################
*)
type difficulty = | Basic | Intermediate | Consolidated
type exercise = {
  title         : string;
  stars         : difficulty;
  id            : float;
  requirements  : float list
}
type student = {
  token : Learnocaml_data.Token.Map.key;
  level : int
}

(*
  ##########################
  #    GLOBAL VARIABLES    #
  ##########################
*)
let prob_basic = 0.2
let prob_inter = 0.85
let prob_conso = 1.00

exception Invalid_argument of string
exception No_more_exercises 

(*
  ##########################
  #     AUX FUNCTIONS      #
  ##########################
*)
let htbl_to_array htbl = 
  Array.of_list (Hashtbl.fold (fun (k,_) _ acc -> k::acc) htbl [])


let create_htbls availabel_exercises = 
  let basic = Hashtbl.create 10 in
  let intermediate = Hashtbl.create 10 in
  let consolidated = Hashtbl.create 10 in
  
  let add_exe_to_htbl exe = 
    let htbl = (
      match exe.stars with
      | Basic         -> basic
      | Intermediate  -> intermediate 
      | Consolidated  -> consolidated
    ) in
    Hashtbl.add htbl (exe.title, exe.id) exe
  in
  let rec sort_exercises = function
    | []    -> ()
    | exe::t  -> add_exe_to_htbl exe; sort_exercises t
  in
  sort_exercises availabel_exercises;
  basic, intermediate, consolidated
  

let gen_assignment (basic, intermediate, consolidated) =


  let basic_a         = htbl_to_array basic in
  let intermediate_a  = htbl_to_array intermediate in
  let consolidated_a  = htbl_to_array consolidated in
  let assignment = Array.make 5 (-1) in

  (*
    Change assignment method.
      * change match to student level;
      * check in the table the options each student has, if none can be accomplished change the first to the best it can
  *)
  let init_assignment () = 
    let rec init_aux b i c idx =
      if (idx < (Array.length assignment)) then
        match (Random.float 1.) with
        | x when x <= 0.2  -> if b > 0 then (assignment.(idx) <- 1; init_aux (b-1) i c (idx+1))
                              else if i > 0 then (assignment.(idx) <- 2; init_aux b (i-1) c (idx+1))
                              else (assignment.(idx) <- 3; init_aux b i (c-1) (idx+1))
        | x when x <= 0.85 -> if i > 0 then (assignment.(idx) <- 2; init_aux b (i-1) c (idx+1))
                              else if b > 0 then (assignment.(idx) <- 1; init_aux (b-1) (i-1) c (idx+1))
                              else (assignment.(idx) <- 3; init_aux b i (c-1) (idx+1))
        | _                -> if c > 0 then (assignment.(idx) <- 3; init_aux b i (c-1) (idx+1))
                              else if i > 0 then (assignment.(idx) <- 2; init_aux b (i-1) c (idx+1))
                              else (assignment.(idx) <- 1; init_aux (b-1) i c (idx+1))
    in
    init_aux (Array.length basic_a) (Array.length intermediate_a) (Array.length consolidated_a) 0 
  in



  init_assignment (); 

(*
  ##########################
  #          MAIN          #
  ##########################
*)