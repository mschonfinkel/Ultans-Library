let
  arguments = {a="f"; b="o"; c="o"; d="bar";}; #only modify this line
  func = {a, b, c, ...}: a+b+c;
  func2 = args@{a, b, c, ...}: a+b+c+args.d;
in
{
  #the argument d is not used
  foo = func arguments;
  #now the argument d is used
  foobar = func2 arguments;
}

