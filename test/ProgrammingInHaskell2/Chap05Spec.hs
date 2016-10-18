module ProgrammingInHaskell2.Chap05Spec (spec) where
 
import SpecHelper
import ProgrammingInHaskell2.Chap05

spec :: Spec
spec = do 
  describe "5.1" $ do
     it "[x^2 | x <- [1..5]]" $ do
       [x^2 | x <- [1..5]] `shouldBe` [1,4,9,16,25]
  describe "5.2 Guards" $ do
     it "factors" $ do
       factors 15 `shouldBe` [1,3,5,15] 
     it "prime" $ do
       prime 15 `shouldBe` False
     it "primes" $ do
       primes 40 `shouldBe` [2,3,5,7,11,13,17,19,23,29,31,37]
     it "find" $ do
       find 'b' [('a', 1),('b', 2),('c', 3),('b', 4)] `shouldBe` [2,4] 

  describe "5.3 The zip function" $ do
     it "zip ['a', 'b', 'c'] [1,2,3,4]" $ do
       zip ['a','b','c'] [1,2,3,4] `shouldBe` [('a',1),('b',2),('c',3)]
     it "pairs" $ do
       pairs [1,2,3,4] `shouldBe` [(1,2),(2,3),(3,4)]
     it "sorted xsは、リストxsが整列済かどうかを判断する" $ do
       sorted [1,2,3,4] `shouldBe` True
       sorted [1,3,2,4] `shouldBe` False
     it "positions" $ do
       positions 2 [1,2,3,2] `shouldBe` [1,3]
