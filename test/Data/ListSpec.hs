module Data.ListSpec (spec) where

import SpecHelper
import Data.List

spec :: Spec
spec = do 
  describe "List" $ do
     it "any" $ do
       any (>4) [1,2,3] `shouldBe` False
     it "transpose" $ do
       transpose [[1,2,3],[4,5,6],[7,8,9]] `shouldBe` [[1,4,7],[2,5,8],[3,6,9]]
