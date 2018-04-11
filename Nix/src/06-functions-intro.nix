let
  f = "f";
  o = "o";
  func = a: b: c: a + b + c;
in
{
  foo = func f o "o";
}

