module Parsers

open System
open System.IO
open FParsec

let parserA = FParsec.CharParsers.pchar<unit> 'A'
let parserB = FParsec.CharParsers.pchar<unit> 'B'

let testParser parser =
    let innerFunc input =
        match FParsec.CharParsers.run parser input with
        | Success(result, _, remainderPos)
            -> printfn "Sucess: %A" result
               printfn "Rest of input: %A" (input.Substring(int32(remainderPos.Index)))
        | Failure(errorMessage, _, _)
            -> printfn "Failure: %s" errorMessage

    innerFunc

let parseAorB =
    parserA <|> parserB

// More complex parsers

let parseDelimitedData pdata pdelim =
    sepBy pdata pdelim

let parseInts =
    parseDelimitedData pint32<unit> (pchar<unit> '.')

let dataInQuotes p =
    between (skipChar<unit> '"') (skipChar<unit> '"') p

let intInQuotes = dataInQuotes pint32

let stringInQuotes = 
    dataInQuotes (manyChars (satisfy (fun c -> c <> '"')))

let decimalInQuotes =
    stringInQuotes |>> decimal

let datetimeInQuotes =
    stringInQuotes
    |>> fun s -> DateTime.ParseExact(s, "yyyy-mm-dd", null)

let skipCommaDelimiter p =
    p .>> skipChar<unit> ',' .>> spaces

