-- Test 4 (hard): S -> AB | CD | A -> aA | a | B -> bB | b | C -> c | D -> d
-- A is cyclic (A -> aA). B is cyclic (B -> bB).
-- C -> c, D -> d: no nonterminals -> both are poor.
-- S -> AB | CD: S reaches A (cyclic) -> S is rich.
-- Expected: Poor = ["C","D"], Rich = ["S","A","B"]

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

-- Grammar: S -> AB | CD | A -> aA | a | B -> bB | b | C -> c | D -> d
g :: Grammar
g = Grammar
  { nts   = ["S", "A", "B", "C", "D"]
  , rules = [ ("S", [N "A", N "B"])
            , ("S", [N "C", N "D"])
            , ("A", [T 'a', N "A"])
            , ("A", [T 'a'])
            , ("B", [T 'b', N "B"])
            , ("B", [T 'b'])
            , ("C", [T 'c'])
            , ("D", [T 'd'])
            ]
  }

main :: IO ()
main = do
  hSetEncoding stdout utf8
  putStrLn "Test 4 (hard): S -> AB | CD | A -> aA | a | B -> bB | b | C -> c | D -> d"
  let (poor, rich) = classifyNTs g
  putStrLn $ "Result:   Poor = " ++ show poor ++ ", Rich = " ++ show rich
  putStrLn   "Expected: Poor = [\"C\",\"D\"], Rich = [\"S\",\"A\",\"B\"]"
