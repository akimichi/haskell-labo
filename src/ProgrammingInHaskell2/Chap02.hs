module ProgrammingInHaskell2.Chap02  where

factorial:: Integer -> Integer
factorial n = product [1..n]


average ns = sum ns `div` length ns
