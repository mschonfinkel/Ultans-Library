// Semigroups are Type with the concat method
// Strings & Arrays are examples of semigroups
const res1 = "a".concat("b").concat("c")
const res2 = [1,2].concat([3,4]).concat([5,6])

// Due to semigroups associativity, the following will
// yield the same result:
// const res1 = "a".concat("b".concat("c"))
// const res2 = [1,2].concat([3,4].concat([5,6]))
console.log(res1)
console.log(res2)

const Sum = x =>
({
    x,
    concat: other =>
        Sum(x + other.x),
    inspect: () => `Sum(${x})`
})

const res = Sum(1).concat(Sum(2))

console.log(res)

// All semigroup

const All = x =>
({
    x,
    concat: ({x:y}) =>
        All(x && y),
    inspect: () => `All(${x})`
})

const res_all = All(true).concat(All(false))

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