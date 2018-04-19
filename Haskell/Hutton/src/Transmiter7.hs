-- Enhaced binary transmiter, exercise 7

module Transmiter7 where

import Data.Char

type Bit = Int

-- Utils

bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2*y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

-- Parity Checking
paritybit :: [Bit] -> [Bit]
paritybit bits = (parity bits) : bits

parity :: [Bit] -> Bit
parity bits
    | odd (sum bits) = 1
    | otherwise = 0

check :: [Bit] -> [Bit]
check (x:xs)
    | x == parity xs = xs
    | otherwise = error "Wrong parity"

-- Transmission

encode :: String -> [Bit]
encode = concat . map (paritybit . make8 . int2bin . ord)

chop9 :: [Bit] -> [[Bit]]
chop9 [] = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int . check) . chop9

-- Testing

transmit :: String -> String
transmit = decode . faltychannel . encode

channel :: [Bit] -> [Bit]
channel = id

faltychannel :: [Bit] -> [Bit]
faltychannel (x:xs) = x : ((head xs + 1) `mod` 2) : tail xs
