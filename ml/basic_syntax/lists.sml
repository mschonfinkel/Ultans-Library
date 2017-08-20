(* Lists
  Lists can have an arbitrary number of elements,
  all of which have the same type.

  The empty list is a value:
    []

  A list of values looks like this:
    [v1, v2, ..., vn]
*)

val e = []

val x = [1,2,3,4]

(* Cons operator
  We can build a list with the :: 'cons' operator
  (x : ta) :: [list ta]

  That is, x must be of type 'ta' to be appended to a list
  of ta's.
*)
val y = 5 :: x

(* Head & Tail
  Like Haskell, ML also has head (hd) and tail (tl) functions.
*)

val h = hd x (* h -> 1 *)
val t = tl y (* y -> [1,2,3,4] *)

(* Type checking
  For a type 'ta' the type 'ta list' describes all
  lists of type 'ta'

  SML also has a type 'a "alpha" that denotes some type. For
  instance, the functions hd, tl, null have types:
    hd : 'a list -> 'a
    tl : 'a list -> 'a list
    null : 'a list -> bool
*)

(* Functions on Lists *)

fun sum_list(xs : int list) =
  if null xs
  then 0
  else (hd xs) + sum_list(tl xs)

fun prod_list(xs : int list) =
  if null xs
  then 1
  else (hd xs) * prod_list(tl xs)

fun append_list(xs : int list, ys: int list) =
  if null xs
  then ys
  else (hd xs) :: append_list(tl xs, ys)
