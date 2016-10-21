module ProgrammingInHaskell2.Chap12  where

import Prelude hiding (Functor, Maybe, Nothing, Just, Tree, Node, Leaf,fmap, map)  -- Prelude を隠蔽する

map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs


class Functor f where
  fmap :: (a -> b) -> f a -> f b

-- instance Functor [] where
--   fmap = map


data Maybe a = Nothing | Just a
                       deriving (Eq, Show)

instance Functor Maybe where
  fmap _ Nothing = Nothing
  fmap f (Just x) = Just (f x)


data Tree a = Leaf a | Node (Tree a) (Tree a)
                       deriving (Eq, Show)

instance Functor Tree where
  fmap f (Leaf x) = Leaf (f x)
  fmap f (Node left right) = Node (fmap f left) (fmap f right)
  
instance Functor [] where
  fmap f [] = []
  fmap f (x:xs) = [f x] ++ fmap f xs 
  
