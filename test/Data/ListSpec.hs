module Data.ListSpec (spec) where

import SpecHelper
import Data.List

spec :: Spec
spec = do 
  describe "List" $ do
     it "any" $ do
       any (>4) [1,2,3] `shouldBe` False
