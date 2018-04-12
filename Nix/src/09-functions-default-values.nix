let
  f = "f";
  o = "o";
  b = "b";
  func = {a ? f, b ? "a", c ? ""}: a+b+c; #only modify this line!
in
rec {
  foo = func {b="o"; c=o;}; #must evaluate to "foo"
  bar = func {a=b; c="r";}; #must evaluate to "bar"
  foobar = func {a=foo;b=bar;}; #must evaluate to "foobar"
}

