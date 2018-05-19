namespace TailCall

module TailRecursion =

    let rec fibonacciNoTail n = 
        if n <= 2L then
            1L
        else
            fibonacciNoTail(n - 1L) + fibonacciNoTail(n - 2L)
    
    printf "%d" <| fibonacciNoTail 42L

    let fibonacciTail n =
        let rec tail n1 n2 counter =
            match counter with
            | 0L -> n1
            | n -> tail n2 (n1+n2) (n - 1L)
        
        tail 0L 1L n


    printf "%d" <| fibonacciTail 100L