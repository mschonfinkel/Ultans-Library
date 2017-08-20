(* Definying Functions in SML - Syntax
fun function_name(arg1: type, ..., argn: type) =
    body

A function is already a value
   - Adds function_name to environment
     so later expressions can call it.
*)

(* Only works if y >= 0 *)
fun pow(x: int, y: int) =
  if y = 0
  then 1
  else x*pow(x,y-1)

(* Call pow *)
val x = pow(3,2)
