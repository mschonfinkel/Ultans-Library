module Cipher where

import Data.Char

-- Utils functions

lowers :: String -> Int
lowers xs = length [x | x <- xs, x >= 'a' && x <= 'z']

count :: Char -> String -> Int
count x xs = sum [1 | x' <- xs, x' == x]

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x',i) <- zip xs [0..n], x == x']
    where n = length xs - 1

-- Encode/Decode

let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` 26)
          | otherwise = c

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- Frequency Tables

table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0,
         0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0,
         6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]


percent :: Int -> Int -> Float
percent n m = (fromIntegral n/ fromIntegral m)*100

freqs :: String -> [Float]
freqs xs = [percent (count x xs) n | x <- ['a'..'z']]
            where n = lowers xs

-- Cracking the Cipher
-- Chi-Square Test

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o-e)^2)/e | (o,e) <- zip os es]

-- Rotates an encoded string mod 26

rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

-- Example:
-- > rotate 3 [1,2,3,4,5]
-- [5,1,2,3,4] => [4,5,1,2,3]
-- [4,5] ++ [1,2,3;

crack :: String -> String
crack xs = encode (-factor) xs
    where
        factor = head (positions (minimum chitab) chitab)
        chitab = [chisqr (rotate n table') table | n <- [0..26]]
        table' = freqs xs

