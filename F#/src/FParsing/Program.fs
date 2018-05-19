// Learn more about F# at http://fsharp.org

open System
open System.IO
open FParsec
open Parsers

type Order = {
    OrderNumber : string
    CostumerName : string
    OrderDate : DateTime
    ShipVia : string
    Items : Item List
}
and Item = {
    ProductNumber : string
    ProductName : string
    Quantity : int
    Price : decimal
}

type ParsedData =
    | OrderData of Order
    | ItemData of Item

let input =
    System.IO.Path.Combine(__SOURCE_DIRECTORY__, @"DATA/Orders.csv")
    |> File.ReadAllText

let parseItemData =
    pipe4
        (stringInQuotes |> skipCommaDelimiter)
        (stringInQuotes |> skipCommaDelimiter)
        (intInQuotes |> skipCommaDelimiter)
        decimalInQuotes
        (fun productNumber productName quantity price -> 
            ItemData(
                {
                    ProductNumber = productNumber
                    ProductName = productName
                    Quantity = quantity
                    Price = price
                }
            )
        )

let parseOrderData =
    pipe4
        (stringInQuotes |> skipCommaDelimiter)
        (stringInQuotes |> skipCommaDelimiter)
        (datetimeInQuotes |> skipCommaDelimiter)
        stringInQuotes
        (fun orderNumber costumerName orderDate shipVia -> 
            OrderData(
                {
                    OrderNumber = orderNumber
                    CostumerName = costumerName
                    OrderDate = orderDate
                    ShipVia = shipVia
                    Items = []
                }
            )
        )

let parseLine =
    dataInQuotes (pchar<unit> 'O' <|> pchar<unit> 'I')
    |> skipCommaDelimiter
    >>= fun c ->
            if c = 'O' then
                parseOrderData
            else
                parseItemData

let parseAllLines =
    sepBy parseLine newline .>> eof

[<EntryPoint>]
let main argv =
    testParser parseAllLines input
    0 // return an integer exit code
