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

-- Ex.5
curry :: ((a,b) -> c) -> (a -> b -> c)
curry f = \x y -> f(x,y)

uncurry :: (a -> b -> c) -> ((a,b) -> c)
uncurry f = \(x,y) -> f x y

-- Ex. 6
unfold p h t x
    | p x = []
    | otherwise = h x : unfold p h t (t x)

chop8' = unfold (null) (take 8) (drop 8)

-- Ex. 9
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap f g [] = []
altMap f g (x:xs) = f x : altMap' f g xs
    where
        altMap' f g [] = []
        altMap' f g (y:ys) = g y : altMap f g ys

solutions7 :: IO()
solutions7 = do
    print $ map' (\x -> x+1) [1,2,3]
    print $ dec2int [2,3,4,5]
    print $ altMap (+10) (+100) [0..4]

