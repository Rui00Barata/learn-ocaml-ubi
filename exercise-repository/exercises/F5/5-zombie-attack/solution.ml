let movimento_possivel x y matriz_jogo = 
    let n = Array.length matriz_jogo in
    if x > (n-1) || y > (n-1) || x < 0 || y < 0 then false
    else true 

let rec zombie_attack matriz_jogo = 
  let trocas = ref (false) in
  let n = Array.length matriz_jogo in  
  begin
    for linhas = 0 to (n-1) do
      for colunas = 0 to (n-1) do
        match matriz_jogo.(linhas).(colunas) with
        |'*' -> if movimento_possivel (linhas-1) (colunas) matriz_jogo && matriz_jogo.(linhas-1).(colunas) = '.'  then (Printf.printf "Bruh momentum ";matriz_jogo.(linhas-1).(colunas) <- '*'; trocas := true);
                if movimento_possivel (linhas+1) (colunas) matriz_jogo && matriz_jogo.(linhas+1).(colunas) = '.'  then (matriz_jogo.(linhas+1).(colunas) <- '*'; trocas := true);
                if movimento_possivel (linhas) (colunas-1) matriz_jogo && matriz_jogo.(linhas).(colunas-1) = '.'  then (matriz_jogo.(linhas).(colunas-1) <- '*'; trocas := true);
                if movimento_possivel (linhas) (colunas+1) matriz_jogo && matriz_jogo.(linhas).(colunas+1) = '.'  then (matriz_jogo.(linhas).(colunas+1) <- '*'; trocas := true);
        |_ -> () 
      done
    done;
    if !trocas then zombie_attack matriz_jogo else matriz_jogo
  end
