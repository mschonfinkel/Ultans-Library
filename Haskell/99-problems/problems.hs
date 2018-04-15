module Problems where

-- 1 : Find the last element of a list
myLast :: [a] -> Maybe a
myLast [] = Nothing		-- makes ghc freak out
myLast x = Just $ last x

-- 2 : Find the last but one element of a list.
myButLast :: [a] -> Maybe a
myButLast [] = Nothing
myButLast [x] = Nothing
myButLast xs = Just $ last $ init xs

-- 3: Find the K'th element of a list. The first element in the list is number 1. 
elementAt ::  [a] -> Int -> Maybe a
elementAt [] _ = Nothing
elementAt xs k
	| k < 1 = Nothing
	| otherwise = Just $ xs !! (k-1)

-- 4: Find the number of elements of a list.
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs


-- 5: Reverse a list. 
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]

-- 6: Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x). 
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome xs = head xs == last xs && (isPalindrome $ init $ tail xs)

-- 7: Flatten a nested list structure. 
data NestedList a = Elem a | List [NestedList a]
myFlatten :: NestedList a -> [a]
myFlatten (List []) = []
myFlatten (Elem a) = [a]
myFlatten (List (x:xs)) = myFlatten x ++ myFlatten (List xs)

-- 8 : Eliminate consecutive duplicates of list elements. 
compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:y:xs)
	| x == y = compress(y:xs)
	| otherwise = x : compress(y:xs) 

-- 9: Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists. 
pack :: Eq a => [a] -> [[a]]
pack [] = []
pack (x:xs) = (x : takeWhile (==x) xs) : pack (dropWhile (==x) xs)

-- 10 : Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length 
-- encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) 
-- where N is the number of duplicates of the element E

encode :: Eq a => [a] -> [(Int,a)]
encode xxs = [(length xs, head xs) | xs <- pack xxs]

-- Injust print (for ghci)
print' :: Show a => Maybe a -> IO()
print' m = case m of
	Nothing -> putStrLn "Invalid List or argument"
	Just m -> print m
	