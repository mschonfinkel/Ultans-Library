module Solutions7 where

-- Ex.1
ex1 f p xs = map f (filter p xs)

-- Ex.2
all' :: (a -> Bool) -> [a] -> Bool
all' p = and . map p

any' :: (a -> Bool) -> [a] -> Bool
any' p =  or . map p

takewhile' :: (a -> Bool) -> [a] -> [a]
takewhile' _ [] = []
takewhile' p (x:xs)
    | p x = x : takewhile' p xs
    | otherwise = []

dropwhile' :: (a -> Bool) -> [a] -> [a]
dropwhile' _ [] = []
dropwhile' p (x:xs)
    | p x = dropwhile' p xs
    | otherwise = x:xs

-- Ex.3
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x xs -> f x : xs) []

-- Ex.4
dec2int :: [Int] -> Int
dec2int = foldl (\x y -> 10*x + y) 0

solutions7 :: IO()
solutions7 = do
    print $ map' (\x -> x+1) [1,2,3]
    print $ dec2int [2,3,4,5]

