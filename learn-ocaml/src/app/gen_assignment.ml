(*
	##########################
	#        SETTINGS        #
	##########################
*)
let p = [|[|1;1;1;2;2|]|]
let a = [|[|1;1;2;2;2|]; [|1;1;2;2;3|]|]
let e = [|[|2;2;3;3;3|]; [|2;2;2;3;3|]|]
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
exception Invalid_argument of string
exception No_more_exercises 

(*
	##########################
	#     AUX FUNCTIONS      #
	##########################
*)
let float_to_diff = function
	| x when x < 2. -> Basic
	| x when x < 3. -> Intermediate
	| _             -> Consolidated

let htbl_to_array htbl = 
	Array.of_list (Hashtbl.fold (fun (k,_) _ acc -> k::acc) htbl [])
	
let create_student t lvl =
	{
		token = t;
		level = 
			match lvl with
			| "1st" -> 1
			| "2nd" -> 2
			| _     -> 3
	}


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
	

let gen_assignment (basic, intermediate, consolidated) level =

	let basic_a         = htbl_to_array basic in
	let intermediate_a  = htbl_to_array intermediate in
	let consolidated_a  = htbl_to_array consolidated in
	let assignment  		= 
		match level with
		| 1 -> p.(Random.int (Array.length p))
		| 2 -> a.(Random.int (Array.length a))
		| _ -> e.(Random.int (Array.length e))
	in

	let init_assignment () = 
		let rec init_aux b i c idx =
			if (idx < (Array.length assignment)) then
				match assignment.(idx) with
				| 1 -> if b > 0 then init_aux (b-1) i c (idx+1)
					else if i > 0 then (assignment.(idx) <- 2; init_aux b (i-1) c (idx+1))
					else (assignment.(idx) <- 3; init_aux b i (c-1) (idx+1))
				| 2 -> if i > 0 then init_aux b (i-1) c (idx+1)
					else if b > 0 then (assignment.(idx) <- 1; init_aux (b-1) i c (idx+1))
					else (assignment.(idx) <- 3; init_aux b i (c-1) (idx+1))
				| _ -> if c > 0 then init_aux b i (c-1) (idx+1)
					else if i > 0 then (assignment.(idx) <- 2; init_aux b (i-1) c (idx+1))
					else (assignment.(idx) <- 1; init_aux (b-1) i c (idx+1))
		in
		init_aux (Array.length basic_a) (Array.length intermediate_a) (Array.length consolidated_a) 0 
	in

	(*
		 Create priority queues for all dificulties and check in it before adding it to the array.
	*)
	let diff_to_exercise a = 
		let r = Array.make 5 "" in
		let shuffle_a v = 
			let n = Array.length v in
			let v = Array.copy v in
			for i = n - 1 downto 1 do
				let k = Random.int (i+1) in
				let x = v.(k) in
				v.(k) <- v.(i);
				v.(i) <- x
			done;
			v
		in
		let rec translate_aux b_a i_a c_a b i c idx = 
			if (idx >= 0) then
				match a.(idx) with
				| 1 -> (r.(idx) <- b_a.(b); translate_aux b_a i_a c_a (b+1) i c (idx - 1))
				| 2 -> (r.(idx) <- i_a.(i); translate_aux b_a i_a c_a b (i+1) c (idx - 1))
				| 3 -> (r.(idx) <- c_a.(c); translate_aux b_a i_a c_a b i (c+1) (idx - 1))
				| _ -> ()
		in
		let b = shuffle_a basic_a in
		let i = shuffle_a intermediate_a in
		let c = shuffle_a consolidated_a in
		translate_aux b i c 0 0 0 ((Array.length a)-1); r
	in

	init_assignment (); 
	Array.fast_sort compare assignment;
	let assignment = diff_to_exercise assignment in
	Array.to_list assignment
	

(*
	##########################
	#          MAIN          #
	##########################
*)
let iter_tokens tokens availabel_exercises = 

	let tbl = create_htbls availabel_exercises in
	let assignments = Hashtbl.create 25 in

	let rec assignment_to_string_list acc = function
		| []      -> acc
		| exe::t  -> assignment_to_string_list (exe.title::acc) t 
	in
	let rec aux_tokens = function
		| []    -> assignments
		| {token; level}::t  -> if ((List.length availabel_exercises) < 6) then (Hashtbl.add assignments (assignment_to_string_list [] availabel_exercises) token; aux_tokens t)
							 else (Hashtbl.add assignments (gen_assignment tbl level) token; aux_tokens t)
	in
	aux_tokens tokens