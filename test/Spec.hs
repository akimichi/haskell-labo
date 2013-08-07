-- file Spec.hs
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

double :: Int -> Int
double x = x * x

main :: IO ()
main = hspec $ do
  describe "Introduction to Functional Programming using Haskell" $ do
    -- it "define lambda expression" $ do
    --   succ = \x  -> x + 1
    --   succ 10 `shouldBe` (4 :: Int)

    it "double returns the doubled value" $ do
      double 2 `shouldBe` (4 :: Int)
    
  describe "Prelude.head" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)

    it "returns the first element of an *arbitrary* list" $
      property $ \x xs -> head (x:xs) == (x :: Int)

    it "throws an exception if used with an empty list" $ do
      evaluate (head []) `shouldThrow` anyException
