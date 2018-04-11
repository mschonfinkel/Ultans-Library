let
  h = "Strings";
  value = 4;
in
{
  helloWorld = "${h} ${toString value} the win!";
}

