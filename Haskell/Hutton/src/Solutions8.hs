module Solutions8 where

data Nat
  = Zero
  | Succ Nat
  deriving (Show)

add :: Nat -> Nat -> Nat
add m n = int2nat (nat2int m + nat2int n)

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n - 1))

nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

-- Ex. 1
mult :: Nat -> Nat -> Nat
mult m Zero     = Zero
mult m (Succ n) = add m (mult m n)

-- Ex. 3
data Tree' a
  = Leaf a
  | Node (Tree' a)
         (Tree' a)
  deriving (Show)

numOfLeaves :: Tree' a -> Int
numOfLeaves (Leaf _)   = 1
numOfLeaves (Node l r) = numOfLeaves l + numOfLeaves r

balanced :: Tree' a -> Bool
balanced (Leaf _) = True
balanced (Node l r) =
  abs (numOfLeaves l - numOfLeaves r) <= 1 && balanced l && balanced r

-- Ex. 4
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
  where
    n = length xs `div` 2

balance :: [a] -> Tree' a
balance [x] = Leaf x
balance zs = Node (balance xs) (balance ys)
  where
    (xs, ys) = halve zs
