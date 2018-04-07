// Old way
// const nextCharForNumberString = str => {
//     const trimmed = str.trim()
//     const number = parseInt(trimmed)
//     const nextNumber = number + 1
//     return String.fromCharCode(nextNumber)
// }

const Box = x => ({
  map: f => Box(f(x)),
  inspect: () => `Box(${x})`,
  fold: f => f(x)
});

const nextCharForNumberString = str =>
  Box(str)
    .map(str => str.trim())
    .map(str => parseInt(str))
    .map(i => i + 1)
    .fold(i => String.fromCharCode(i));

const result = nextCharForNumberString("   64 ");

console.log(result);
