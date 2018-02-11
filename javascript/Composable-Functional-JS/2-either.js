// Either = Left || Right

Right = x => (
    {
        map: f => Right(f(x)),
        fold: (f,g) => g(x),
        inspect: () => `Right(${x})`
    }
)

Left = x => (
    {
        map: f => Left(x),
        fold: (f,g) => f(x),
        inspect: () => `Left(${x})`
    }
)

const result1 = Right(3).map(x => x + 1).fold(x => 'error', x => x)
const result2 = Left(3).map(x => x + 1).fold(x => 'error', x => x)

console.log(result1)
console.log(result2)

// findColor = name => 
//     ({red: '#ff4444', blue: '#3b5998', yellow: '#fff68f'})[name]

// const result = findColor('green').slice(1).toUpperCase()

// ---------------------------------------------------

// First Find color, without from nullable
// findColor = name => {
//     found = ({red: '#ff4444', blue: '#3b5998', yellow: '#fff68f'})[name]
//     return found ? Right(found) : Left(null)
// }

const fromNullable = x =>
    x != null ? Right(x) : Left(x)

findColor = name => fromNullable(
    {red: '#ff4444', blue: '#3b5998', yellow: '#fff68f'}[name]
)

const result = findColor('green')
                .map(c => c.slice(1))
                .fold(e => 'no color', 
                      c => c.toUpperCase()
                    )

console.log(result)