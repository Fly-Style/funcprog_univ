module Main where

import Data.Tuple

-- Convert @String param to @Int
rInt :: String -> Int
rInt = read

canGo :: (Int, Int) -> Int -> Int -> Int -> Bool
canGo pos inc1 inc2 size = do
    let a = fst $ pos
    let b = snd $ pos
    if a + inc1 < size && b + inc2 < size
        then True
        else False



changePos :: (Int, Int) -> Int -> Int -> (Int, Int)
changePos pos inc1 inc2 = do
     let a = fst $ pos
     let b = snd $ pos
     let val = ( a + inc1, b + inc2 )
     val



main :: IO()
main = do
    sizeStr <- getLine
    print $ rInt $ sizeStr


