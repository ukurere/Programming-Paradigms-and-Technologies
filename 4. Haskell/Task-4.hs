module Task4 where

import Data.List (nub)

type NT = String   

data GSym = N NT | T Char deriving (Eq, Show)

type Rule = (NT, [GSym])

data Grammar = Grammar
  { nts   :: [NT]   
  , rules :: [Rule] 
  } deriving (Show)

ntsIn :: [GSym] -> [NT]
ntsIn syms = [ a | N a <- syms ]

directReach :: Grammar -> NT -> [NT]
directReach g a = nub [ b | (lhs, rhs) <- rules g, lhs == a, b <- ntsIn rhs ]

reachFrom :: Grammar -> NT -> [NT]
reachFrom g a = go (directReach g a) []
  where
    go [] visited = visited
    go (x:queue) visited
      | x `elem` visited = go queue visited
      | otherwise        = go (queue ++ directReach g x) (x : visited)

isCyclic :: Grammar -> NT -> Bool
isCyclic g a = a `elem` reachFrom g a

richNTs :: Grammar -> [NT]
richNTs g =
  let cyclics    = filter (isCyclic g) (nts g)
      reachable a = a : reachFrom g a  
  in nub [ a | a <- nts g, any (`elem` reachable a) cyclics ]

poorNTs :: Grammar -> [NT]
poorNTs g = filter (`notElem` richNTs g) (nts g)

classifyNTs :: Grammar -> ([NT], [NT])
classifyNTs g = (poorNTs g, richNTs g)
