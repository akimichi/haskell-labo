module ReversiSpec (spec) where
 
import SpecHelper
import Reversi
import qualified Data.List as L 

spec :: Spec
spec = do 
  describe "Grid" $ do
     it "empty" $ do
       empty `shouldBe` [[B,B,B,B,B,B,B,B],[B,B,B,B,B,B,B,B],[B,B,B,B,B,B,B,B],[B,B,B,B,B,B,B,B],[B,B,B,B,B,B,B,B],[B,B,B,B,B,B,B,B],[B,B,B,B,B,B,B,B],[B,B,B,B,B,B,B,B]]
     it "count" $ do
       count empty O `shouldBe` 0
       count empty X `shouldBe` 0
     it "wins" $ do
       wins O empty `shouldBe` Draw 
     context "diag" $ do
        it "diag empty" $ do
          diag empty `shouldBe` [B,B,B,B,B,B,B,B]
        it "diag grid" $ do
          let grid = [[B,B,B,B,B,B,B,B],
                   [B,B,B,B,B,B,O,B],
                   [B,B,B,B,B,O,B,B],
                   [B,B,B,B,O,B,B,B],
                   [B,B,B,O,B,B,B,B],
                   [B,B,O,B,B,B,B,B],
                   [B,O,B,B,B,B,B,B],
                   [O,B,B,B,B,B,B,B]]
          (diag grid) `shouldBe` [B,B,B,B,B,B,B,B]
          (diag (L.transpose grid)) `shouldBe` [B,B,B,B,B,B,B,B]
     context "piece" $ do
        it "piece empty" $ do
            piece empty (0,0) `shouldBe` B 
            piece empty (1,0) `shouldBe` B 
        it "piece grid" $ do
          let grid = [[B,B,B,B,B,B,B,B],
                   [B,B,B,B,B,B,O,B],
                   [B,B,B,B,B,O,B,B],
                   [B,B,B,B,O,B,B,B],
                   [B,B,B,O,B,B,B,B],
                   [B,B,O,B,B,B,B,B],
                   [B,O,B,B,B,B,B,B],
                   [O,B,B,B,B,B,B,B]]
          piece grid (0,0) `shouldBe` B 
          piece grid (7,0) `shouldBe` O 
          isVacant grid (1,1) `shouldBe` True 
          isVacant grid (7,0) `shouldBe` False 
