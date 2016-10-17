module ProgrammingInHaskell2.Chap02Spec (spec) where
 
import SpecHelper
import ProgrammingInHaskell2.Chap02

spec :: Spec
spec = do 
  describe "2.3" $ do
     it "head [1,2,3,4,5]" $ do
       head [1,2,3,4,5] `shouldBe` 1
     it "tail [1,2,3,4,5]" $ do
       tail [1,2,3,4,5] `shouldBe` [2,3,4,5]
  describe "2.5" $ do
     it "factorial 10" $ do
       factorial 10 `shouldBe` 3628800
     it "average [1,2,3,4,5]" $ do
       average [1,2,3,4,5] `shouldBe` 3
