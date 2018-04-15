module Problems2 where

import Problems (encode)

data ListItem a = Single a | Multiple Int a
    deriving (Show)

-- 11 : Modified run-length encoding. 
encodeModified :: Eq a => [a] -> [ListItem a]
encodeModified = map encode' . encode
	where
		encode' (1,x) = Single x
		encode' (k,x) = Multiple k x

-- 12 : Decode a run-length encoded list. 

decodeModified :: [ListItem a] -> [a]
decodeModified [] = []
decodeModified (x:xs) = dec x ++ decodeModified xs
	where
		dec (Single x) = [x]
		dec (Multiple k x) = replicate k x


-- 13 : Run-length encoding of a list (direct solution). 

-- 14 : Duplicate the elements of a list. 
dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = x:x:dupli xs

-- 15: Replicate the elements of a list a given number of times. 
repli :: [a] -> Int -> [a]
repli [] _ = []
repli (x:xs) k
	| k <= 0 = []
	| otherwise = rep x k ++ repli xs k
	where rep y q
		| q == 0 = []
		| otherwise = y : rep y (q - 1)

-- 16: Drop every N'th element from a list. 
dropEvery :: [a] -> Int -> [a]
dropEvery [] _ = []
dropEvery xs 0 = []
dropEvery xs k = take (k-1) xs ++ dropEvery (drop k xs) k

-- 17: Split a list into two parts; the length of the first part is given. 
split :: [a] -> Int -> ([a],[a])
split xs k = (take k xs, drop k xs)

-- 18: Extract a slice from a list.
-- Given two indices, i and k, the slice is the list containing the elements between 
-- the i'th and k'th element of the original list (both limits included). Start counting the elements with 1. 
slice :: [a] -> Int -> Int -> [a]
slice xs n m = take (m - n + 1) $ drop (n - 1) xs 

-- 19: Rotate a list N places to the left. 
rotate :: [a] -> Int -> [a]
rotate [] _ = []
rotate xs k = drop n xs ++ take n xs
	where n = (length xs + k) `mod` length xs

-- 20: Remove the K'th element from a list. 
removeAt :: Int -> [a] -> (Maybe a,[a])
removeAt 0 xs = (Nothing, xs)
removeAt _ [] = (Nothing, [])
removeAt k xs = (Just $ xs !! (k - 1), take (k-1) xs ++ drop k xs)