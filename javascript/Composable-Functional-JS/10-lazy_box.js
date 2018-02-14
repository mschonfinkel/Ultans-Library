const Box = x =>
  ({
    map: f => Box(f(x)),
    inspect: () => `Box(${x})`,
    fold: f => f(x),
  });

const LazyBox = g =>
  ({
    map: f => LazyBox(() => f(g())),
    fold: f => f(g()),
  });

const nextCharForNumberString = str =>
  LazyBox(str)
    .map(str => str.trim())
    .map(str => parseInt(str))
    .map(i => i + 1)
    .fold(i => String.fromCharCode(i));

const result = nextCharForNumberString(() => '   64 ');

console.log(result);
