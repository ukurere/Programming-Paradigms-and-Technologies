-- Test 1 (easy): S -> AB, A -> aA | a, B -> b
-- A is cyclic (A -> aA), B and S are not.
-- S can reach A (cyclic) -> S is rich.
-- B reaches nothing cyclic -> B is poor.
-- Expected: Poor = ["B"], Rich = ["S","A"]

import System.IO
import Data.List (nub)

type NT = String
data GSym = N NT | T Char deriving (Eq, Show)
type Rule = (NT, [GSym])
data Grammar = Grammar { nts :: [NT], rules :: [Rule] }

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
  let cyclics     = filter (isCyclic g) (nts g)
      reachable a = a : reachFrom g a
  in nub [ a | a <- nts g, any (`elem` reachable a) cyclics ]

poorNTs :: Grammar -> [NT]
poorNTs g = filter (`notElem` richNTs g) (nts g)

classifyNTs :: Grammar -> ([NT], [NT])
classifyNTs g = (poorNTs g, richNTs g)

-- Grammar: S -> AB,  A -> aA | a,  B -> b
g :: Grammar
g = Grammar
  { nts   = ["S", "A", "B"]
  , rules = [ ("S", [N "A", N "B"])
            , ("A", [T 'a', N "A"])
            , ("A", [T 'a'])
            , ("B", [T 'b'])
            ]
  }

main :: IO ()
main = do
  hSetEncoding stdout utf8
  putStrLn "Test 1 (easy): S -> AB | A -> aA | a | B -> b"
  let (poor, rich) = classifyNTs g
  putStrLn $ "Result:   Poor = " ++ show poor ++ ", Rich = " ++ show rich
  putStrLn   "Expected: Poor = [\"B\"],    Rich = [\"S\",\"A\"]"
