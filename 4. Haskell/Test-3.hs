-- Test 3 (hard): S -> AC | A -> aAb | ab | C -> cD | D -> d
-- A is cyclic (A -> aAb contains A).
-- D -> d, no nonterminals -> D reaches nothing -> D is poor.
-- C -> cD, C reaches only D (not cyclic) -> C is poor.
-- S -> AC, S reaches A (cyclic) -> S is rich.
-- Expected: Poor = ["C","D"], Rich = ["S","A"]

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

-- Grammar: S -> AC | A -> aAb | ab | C -> cD | D -> d
g :: Grammar
g = Grammar
  { nts   = ["S", "A", "C", "D"]
  , rules = [ ("S", [N "A", N "C"])
            , ("A", [T 'a', N "A", T 'b'])
            , ("A", [T 'a', T 'b'])
            , ("C", [T 'c', N "D"])
            , ("D", [T 'd'])
            ]
  }

main :: IO ()
main = do
  hSetEncoding stdout utf8
  putStrLn "Test 3 (hard): S -> AC | A -> aAb | ab | C -> cD | D -> d"
  let (poor, rich) = classifyNTs g
  putStrLn $ "Result:   Poor = " ++ show poor ++ ", Rich = " ++ show rich
  putStrLn   "Expected: Poor = [\"C\",\"D\"], Rich = [\"S\",\"A\"]"
