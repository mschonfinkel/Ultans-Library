const Sum = x =>
({
    x,
    concat: other =>
        Sum(x + other.x),
    inspect: () => `Sum(${x})`
})

// Monoids are semigroups, with a neutral element. That is,
// an element 0 such that:
// x + 0 = x, for all x. Where (+) is the concat method.

// Extending Sum to be a monoid.

Sum.empty = () => Sum(0)

const res = Sum.empty().concat(Sum(1).concat(Sum(2)))

console.log(res)

// All semigroup

const All = x =>
({
    x,
    concat: ({x:y}) =>
        All(x && y),
    inspect: () => `All(${x})`
})

// All monoid

All.empty = () => All(true)

const res_all = All.empty().concat(All(true).concat(All(false)))

console.log(res_all)

// First semigroup

const First = x =>
({
    x,
    concat: _ =>
        First(x),
    inspect: () => `First(${x})`
})

const res_first = First(true).concat(First(false))

console.log(res_first)

// HOF

const sum = xs =>
    xs.reduce((acc, x) => acc + x, 0)

const all = xs =>
    xs.reduce((acc, x) => acc && x, true)

const first = xs =>
    xs.reduce((acc, x) => acc)