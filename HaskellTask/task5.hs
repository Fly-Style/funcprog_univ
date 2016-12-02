module Warshall where

import Data.Char ( isAlpha )
import Data.List ( nub, sort )
import System.Environment ( getArgs )
import Text.Parsec
import Text.Parsec.String
import Text.Printf ( printf )

type Vertex a = a
type Edge a = (a, a)

data Graph a = Graph { vertices :: [Vertex a]
                     , edges :: [Edge a] }

instance (Show a) => Show (Graph a) where
    show g = printf "Vertices: %s\nEdges:\n%s"
                    (unwords . map show $ vertices g)
                    (unlines . map showEdge $ edges g)
        where
          showEdge (x, y) = printf "%s -> %s" (show x) (show y)

edge :: Parser (Edge String)
edge = do
  u <- many1 alphaNum
  spaces >> string "->" >> spaces
  v <- many1 alphaNum
  spaces
  return (u, v)

readGraph :: FilePath -> IO (Graph String)
readGraph fp = do
  r <- parseFromFile (many1 edge) fp
  case r of
    Left err -> error (show err)
    Right es -> return $ Graph { edges = es
                              , vertices = nub . uncurry (++) $ unzip es }

warshall :: (Eq a) => Graph a -> Graph a
warshall g = Graph { edges = go (vertices g) (edges g)
                   , vertices = vertices g }
    where
      go [] es     = es

main :: IO ()
main = do
  [f] <- getArgs
  print =<< return . warshall =<< readGraph f
