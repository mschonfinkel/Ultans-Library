(* Let Expressions
  Syntax: let b1 b2 .. bn in e end

  Type Checking: Type check each bi in e

  Evaluation: eval each bi in e
*)

fun something(z : int) =
    let
        val x = if z > 0 then z else 34
        val y = x + z + 9
    in
        if x > y then x*x else y*y
    end
