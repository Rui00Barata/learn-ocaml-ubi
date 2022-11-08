open Test_lib
open Report

let placeholder () = 
  [Message ([Text "A correção do exercício ainda não foi implementada"], Warning)]


let () =
  set_result                @@
  ast_sanity_check code_ast @@ fun () ->
  placeholder ()
