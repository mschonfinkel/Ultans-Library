// Examples of monoids

// Sum Monoid
const Sum = x =>
({
    x,
    concat: ({x: y}) => Sum(x + y),
    inspect: () => `Sum(${x})`
})

Sum.empty = () => Sum(0)

// Product Monoid

const Product = x => 
({
    x,
    concat: ({x: y}) => Product(x*y),
    inspect: () => `Product(${x})`
})

Product.empty = () => Product(1)

// Any Monoid

const Any = x =>
({
    x,
    concat: ({x: y}) => Any(x || y),
    inspect: () => `Any(${x})`
})

Any.empty = () => Any(false)

// All Monoid

const All = x =>
({
    x,
    concat: ({x: y}) => All(x && y),
    inspect: () => `All(${x})`
})

All.empty = () => All(true)

// Max Monoid
const Max = x =>
({
    x,
    concat: ({x: y}) => Max(x > y ? x : y),
    inspect: () => `Max(${x})`
})

Max.empty = () => Max(-Infinity)

// Min Monoid
const Min = x =>
({
    x,
    concat: ({x: y}) => Min(x < y ? x : y),
    inspect: () => `Min(${x})`
})

Min.empty = () => Min(Infinity)

// Either Monoid

const Right = x =>
({
    fold: (f,g) => g(x),
    map: f => Right(f(x)),
    concat: other =>
        other.fold(e => Left(e),
                   r => Right(x.concat(r)))
})

const Left = x =>
({
    fold: (f,g) => f(x),
    map: f => Left(x),
    concat: other => Left(x)
})

