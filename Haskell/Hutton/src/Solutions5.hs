module Solutions5 where

-- Solutions for the easy exercises are done here

-- Ex. 1
ex1 = sum [x^2 | x <- [1..100]]

-- Ex.2
grid :: Int -> Int -> [(Int, Int)]
grid m n = [(x,y) | y <- [0..n], x <- [0..m]]

-- Ex.3
square :: Int -> [(Int, Int)]
square n = [(x,y) | (x,y) <- grid n n, x /= y]

-- Ex.4
replicate' :: Int -> a -> [a]
replicate' k x = [x | _ <- [1..k]]

-- Ex.5
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x <- [1..n],
                     y <- [1..n],
                     z <- [1..n],
                     x^2 + y^2 == z^2
          ]

-- Ex.6

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], (sum $ init $ factors x) == x]

-- Ex.7
original = [(x,y) | x <- [1,2], y <- [3,4]]
answer = concat [[(x,y) | y <- [3,4]] | x <- [1,2]]

-- Ex.8

find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k', v) <- t, k == k']

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find x $ zip xs [0..n]
    where n = length xs - 1

-- Ex.9
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x * y | (x,y) <- zip xs ys]

solutions5 :: IO ()
solutions5 = do
    print $ grid 1 2
    print $ square 2
    print $ replicate' 3 True
    print $ pyths 10
    print $ original == answer
    print $ scalarproduct [1,2,3] [4,5,6]
