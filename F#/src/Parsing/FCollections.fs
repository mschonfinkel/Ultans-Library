namespace FCollections

module FunctionsAndCollections = 
    open System
    open System.IO

    seq {1..3}
    |> Seq.iter (printfn "%d")

    seq {
        for i in 1 .. 3 do
            for j in 4 .. 5 do
                yield i + j
    } |> Seq.iter (printfn "%d")

    let rec listAllFiles (path: string) =
        seq {
            for file in System.IO.Directory.GetFiles(path) do
                yield file
            for directory in System.IO.Directory.GetDirectories(path) do
                yield! listAllFiles directory
        }

    listAllFiles(__SOURCE_DIRECTORY__)
    |> Seq.iter (printfn "%s")

    1
    |> Seq.unfold (
        fun n -> 
            if n < 100 then
                Some(n, n+n)
            else
                None
    )
    |> Seq.iter (printfn "%d")

    let fibonacci (n:int) =
        (1,0)
        |> Seq.unfold (
            fun (n1, n2) -> 
                Some(n1+n2, (n2, n1+n2))
            )
        |> Seq.take n
        |> Seq.iter (printfn "%d")

    fibonacci 10