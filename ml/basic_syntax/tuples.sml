(* Pairs 2-Tuples

  Syntax: (e1, e2)

  Evaluation:
    Eval e1 -> v1, e2 -> v2
    which results in (v1, v2)

  Type-Cheking:
    If e1 has type ta and e2 has type tb then
    (e1, e2) has type ta * tb
*)

(* int * int -> int * int *)
fun div_mod(x: int, y: int) =
  (x div y, x mod y)

(* int * int -> int * int *)
fun sort_pair(pr: int * int) =
  if #1 pr < #2 pr
  then pr
  else (#2 pr, #1 pr)

(* Tuples, a generalization of Pairs
  Syntax: (e1, e2, ..., en)

  Evaluation:
    ta * tb * ... * tn

*)
