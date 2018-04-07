const Box = x => 
({
    map: f => Box(f(x)),
    inspect: () => `Box(${x})`,
    fold: f => f(x) 
})

// const moneyToFloat = str =>
//     parseFloat(s => s.replace(/\$/g, ''))

const moneyToFloat = str => 
    Box(str)
    .map(str => str.replace(/\$/g, ''))
    .map(str => parseFloat(str))

// const percentToFloat = str => {
//     const replaced = str.replace(/\/$/g, '')
//     const number = parseFloat(replaced)
//     return number * 0.01
// }

const percentToFloat = str =>
    Box(str)
    .map(str => str.replace(/\/$/g, ''))
    .map(str => parseFloat(str))
    .map(float => float*0.01)

// const applyDiscout = (price, discount) => {
//     const cost = moneyToFloat(price)
//     const savings = percentToFloat(discount)
//     return cost - cost*discount
// }

const applyDiscout = (price, discount) => 
    moneyToFloat(price)
    .fold(cost => 
       percentToFloat(discount)
       .fold(
           savings => cost - cost*savings
       )
    )

const result = applyDiscout('$5.00', '20%')
console.log(result)