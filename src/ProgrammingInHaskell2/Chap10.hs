module ProgrammingInHaskell2.Chap10  where

cls :: IO ()
cls = putStr "\ESC[2J"


type Pos = (Int, Int)

writeAt :: Pos -> String -> IO()
writeAt pos string = do goto pos
                        putStr string

goto :: Pos -> IO()
goto (x,y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

width :: Int
width = 10

height :: Int
height = 10

type Board = [Pos]

glider :: Board
glider = [(4,2),(2,3),(4,3),(3,4),(4,4)]

showcells :: Board -> IO()
showcells board = sequence_ [writeAt pos "O" | pos <- board]

isAlive :: Board -> Pos -> Bool
isAlive board pos = elem pos board

isEmpty :: Board -> Pos -> Bool
isEmpty board pos = not (isAlive board pos)

neighbs :: Pos -> [Pos]
neighbs (x,y) = map wrap [(x-1,y-1),(x,y-1),
                           (x+1,y-1),(x-1,y),
                           (x+1,y),(x-1,y+1),
                           (x,y+1),(x+1,y+1)]
wrap :: Pos -> Pos
wrap (x,y) = (((x-1) `mod` width) + 1,
               ((y-1) `mod` height) + 1)

liveneighbs :: Board -> Pos -> Int
liveneighbs board = length . filter (isAlive board) . neighbs

survivors :: Board -> [Pos]
survivors board = [pos | pos <- board, elem (liveneighbs board pos) [2,3]]

births :: Board -> [Pos]
births board = [(x,y) | x <- [1..width],
                 y <- [1..height],
                 isEmpty board (x,y),
                 liveneighbs board (x,y) == 3]
               
nextgen :: Board -> Board
nextgen board = survivors board ++ births board

wait :: Int -> IO()
wait n = sequence_ [return () | _ <- [1..n]]
