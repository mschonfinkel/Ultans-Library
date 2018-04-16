module Main where

-- Easier Exercises go in the Main file

-- Ex.2

sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n-1)

-- Ex.3
(^~) :: Int -> Int -> Int
m ^~ 0 = 1
m ^~ n = m * m^~(n-1)

-- Ex.4
-- Euclid's GCD algorithm
euclid :: Integral a => a -> a -> a
euclid m n = gcd' (abs m) (abs n)
    where
        gcd' m 0 = m
        gcd' m n = gcd n (m `mod` n)

-- Ex.7
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

-- Ex.8

halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
    where n = (length xs) `div` 2

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort left) (msort right)
    where
        (left, right) = halve xs

main :: IO ()
main = do
    print $ sumdown 3
    print $ 2^~3
    print $ euclid 6 27
    print $ merge [2,5,6] [1,3,4]
    print $ msort [2,1,4,3,8,5,7,6]

