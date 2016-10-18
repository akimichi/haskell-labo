module Life  where

import ProgrammingInHaskell2.Chap10

life :: Board -> IO()
life board = do cls
                showcells board
                wait 50000000
                life (nextgen board)
main :: IO ()
main = life glider
