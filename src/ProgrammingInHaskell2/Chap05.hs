module ProgrammingInHaskell2.Chap05  where

concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

find :: Eq k => k -> [(k,v)] -> [v]
find key tuples = [value | (key', value) <- tuples, key == key']

pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs]


positions :: Eq a => a -> [a] -> [Int]
positions key xs = [index | (key',index) <- zip xs [0..], key == key']
