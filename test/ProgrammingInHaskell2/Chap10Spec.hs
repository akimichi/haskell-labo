module ProgrammingInHaskell2.Chap10Spec (spec) where
 
import SpecHelper
import ProgrammingInHaskell2.Chap10

spec :: Spec
spec = do 
  describe "10.8 Life" $ do
     it "isAlive" $ do
       isAlive [(0,0),(0,1)] (0,0) `shouldBe` True 
