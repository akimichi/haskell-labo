module ProgrammingInHaskell2.Chap06Spec (spec) where
 
import SpecHelper
import ProgrammingInHaskell2.Chap06

spec :: Spec
spec = do 
  describe "6.2 Recursion on lists" $ do
     it "insert x xs は、整列済リストxsにxを挿入する" $ do
       insert 3 [1,2,4,5] `shouldBe` [1,2,3,4,5]
     it "isort xs は、insertion sortを実行する" $ do
       isort [3,2,4,5] `shouldBe` [2,3,4,5]
