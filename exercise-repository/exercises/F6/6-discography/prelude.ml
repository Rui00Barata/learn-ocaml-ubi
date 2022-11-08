type disco = {banda          : string;
              titulo         : string;
              ano            : int;
              mutable estilo : string list}

type estiloDB = (string,disco list) Hashtbl.t
type bandaDB  = (string,disco list) Hashtbl.t
type anoDB    = (int,   disco list) Hashtbl.t
    
let bandas  : bandaDB  = Hashtbl.create 97 
let estilos : estiloDB = Hashtbl.create 97 
let anos    : anoDB    = Hashtbl.create 97 