module Chap02 where
 
import Test.Hspec
 
left x y = x
infiniteLoop = infiniteLoop

-- main :: IO ()
-- main = hspec $ do
main :: IO ()
main = hspec spec

spec :: Spec
spec = do 
  describe "2.3" $ do
     it "head [1,2,3,4,5]" $ do
       head [1,2,3,4,5] `shouldBe` 1
