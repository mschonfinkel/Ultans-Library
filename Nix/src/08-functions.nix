let
  min = x: y: if x < y then x else y;
  max = x: y: if x > y then x else y;
in
{
  ex1 = min 5 3;
  ex2 = max 9 4;
}
