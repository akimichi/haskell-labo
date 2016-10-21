module ProgrammingInHaskell2.Chap12Spec (spec) where
 
import SpecHelper
import Data.String
import Prelude hiding (Functor, Maybe, Nothing, Just, fmap, map)  -- Prelude を隠蔽する
import ProgrammingInHaskell2.Chap12 
-- import qualified ProgrammingInHaskell2.Chap12 as Chap12

spec :: Spec
spec = do 
  describe "12 Monads and more" $ do
    describe "12.1 Functors" $ do
     it "map" $ do
       -- let inc = Chap12.map (+1)
       let inc = map (+1)
       inc [0,1,2] `shouldBe` [1,2,3]
     it "fmap" $ do
       fmap (+1) Nothing `shouldBe` Nothing 
       fmap (+1) (Just 3) `shouldBe` Just 4
     it "Tree" $ do
       -- fmap length (Leaf "abc") `shouldBe` (Leaf 0)
       fmap even (Node (Leaf 1) (Leaf 2)) `shouldBe` Node (Leaf False) (Leaf True)
     it "List" $ do
       fmap id [1,2] `shouldBe` [1,2] 
       fmap (not . even) [1,2] `shouldBe` [True, False] 
