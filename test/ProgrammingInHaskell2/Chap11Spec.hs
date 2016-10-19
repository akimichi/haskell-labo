module ProgrammingInHaskell2.Chap11Spec (spec) where
 
import SpecHelper
import ProgrammingInHaskell2.Chap11

spec :: Spec
spec = do 
  describe "11 Unbeatable tic-tac-toe" $ do
    describe "11.3" $ do
     it "empty" $ do
       empty `shouldBe` [[B,B,B],[B,B,B],[B,B,B]]
