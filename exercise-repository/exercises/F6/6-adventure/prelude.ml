type status = Victory | Death | Continue

type place  = {id: int; descr: string; life: int ; is_random: bool;
              status: status;  mutable goto : place ref array}
              
type player = {mutable life: int; mutable location: place}