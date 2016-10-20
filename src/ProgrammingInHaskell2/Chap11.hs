module ProgrammingInHaskell2.Chap11  where

import Data.Char
import Data.List
import System.IO

size :: Int
size = 3

type Grid = [[Player]]

data Player = O | B | X
            deriving (Eq, Ord, Show)

next :: Player -> Player
next O = X
next B = B
next X = O


empty :: Grid
empty = replicate size (replicate size B)


-- interleave inserts a value between each element in a list.
interleave :: a -> [a] -> [a]
interleave x [] = []
interleave x [y] = [y]
interleave x (y:ys) = y : x : interleave x ys
