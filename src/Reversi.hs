module Reversi  where

import Data.Char
import Data.List
import System.IO

size :: Int
size = 8

type Grid = [[Player]]
type Pos = (Int,Int)
type Move = (Player,Pos)

data Player = O | B | X
            deriving (Eq, Ord, Show)

next :: Player -> Player
next O = X
next B = B
next X = O


empty :: Grid
empty = replicate size (replicate size B)

full :: Grid -> Bool
full = all (/= B) . concat

count :: Grid -> Player -> Int
count grid player = length (filter (== player) pieces)
  where
    pieces = concat grid

data GameResult = Lost | Draw | Won
            deriving (Eq, Ord, Show)

wins :: Player -> Grid -> GameResult
wins player grid = if aPlayerCount > anotherPlayerCount then
                     Won
                   else
                     if aPlayerCount < anotherPlayerCount then
                       Lost
                     else
                       Draw
                    where
                        aPlayerCount = count grid player 
                        anotherPlayerCount = count grid (next player)

diag :: Grid -> [Player]
diag grid = [grid !! n !! n | n <- [0..size-1]]

piece :: Grid -> Pos -> Player
piece grid pos = (grid !! (fst pos)) !! (snd pos)

isVacant :: Grid -> Pos -> Bool
isVacant grid pos = (piece grid pos) == B
