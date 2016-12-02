module Main where
import Control.Monad.Cont
import Control.Monad.Fail
import Control.Monad.Fix
import Control.Monad.Logic

import Data.List
import Data.Maybe
import Data.Ord
import Data.Ix
import qualified Data.Map as Map
import System.Environment

successors n b = sortWith (length . succs) . succs
 where sortWith f = map fst . sortBy (comparing snd) . map (\x -> (x, f x))
       succs (i,j) = [ (i', j') | (dx,dy) <- [(1,2),(2,1)]
                                , i' <- [i+dx, i-dx] , j' <- [j+dy, j-dy]
                                , isNothing (Map.lookup (i',j') b)
                                , inRange ((1,1),(n,n)) (i',j') ]

tour n k s b | k > n*n   = return b
             | otherwise = do next <- msum . map return $ successors n b s
                              tour n (k+1) next $ Map.insert next k b

showBoard n b = unlines . map (\i -> unwords . map (\j ->
                  pad . fromJust $ Map.lookup (i,j) b) $ [1..n]) $ [1..n]
 where k = ceiling . logBase 10 . fromIntegral $ n*n + 1
       pad i = let s = show i in replicate (k-length s) ' ' ++ s

main = do (n:_) <- map read `fmap` getArgs
          let b = observe . tour n 2 (1,1) $ Map.singleton (1,1) 1
          putStrLn $ showBoard n b