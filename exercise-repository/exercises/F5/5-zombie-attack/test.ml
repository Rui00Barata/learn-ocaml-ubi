open Test_lib
open Report

let gen_sample_matrix () = 
  let () = Random.self_init () in 
  let n = Random.int(9) + 7 in
  let matriz_teste = Array.make_matrix n n '.' in
  let numero_zombie = if n > 12 then 1 else 2 in 
  let numero_gatos =  if n > 12 then 7 else 10 in 
  begin
    for i = 0 to numero_zombie do
      let x = Random.int(n-1) and y = Random.int(n-1) in 
      if matriz_teste.(x).(y) = '.' then  matriz_teste.(x).(y) <- '*'
      else let flag = ref(true) in  
          while !flag do
            let x2 = Random.int(n-1) and y2 = Random.int(n-1) in 
            if matriz_teste.(x2).(y2) = '.' then( matriz_teste.(x).(y) <- '*'; flag := false)
          done 
    done;
    for i = 0 to numero_gatos do
      let x = Random.int(n-1) and y = Random.int(n-1) in
      if matriz_teste.(x).(y) = '.' then matriz_teste.(x).(y) <- 'X'
      else let flag = ref(false) in
        while !flag do
          let x2 = Random.int(n-1) and y2 = Random.int(n-1) in
          if matriz_teste.(x2).(y2) = '.' then (matriz_teste.(x).(y) <- 'X'; flag := false)
        done
    done;
  matriz_teste
  end 

let zombie_attackK = Section (
  [Text "Teste funcao zombie_attack"], 
  test_function_1_against_solution
  [%ty: char array array -> char array array]
  "zombie_attack"
  ~sampler: (gen_sample_matrix)
  ~gen: 10
  [])

let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () -> 
  [zombie_attackK]