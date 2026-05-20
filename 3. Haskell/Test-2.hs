-- Test 2 (easy): w = "11" (binary 3), automaton accepts w itself (y = "")

import System.IO
import Data.List (nub)

type State  = Int
type Symbol = Char

data FA = FA
  { delta  :: [(State, Symbol, State)]
  , q0     :: State
  , qFinal :: [State]
  , sigma  :: [Symbol]
  }

step :: FA -> State -> Symbol -> [State]
step fa q c = [r | (s, a, r) <- delta fa, s == q, a == c]

runWord :: FA -> [Symbol] -> [State]
runWord fa = foldl (\qs c -> nub $ concatMap (\q -> step fa q c) qs) [q0 fa]

findSuffix :: FA -> [State] -> Maybe [Symbol]
findSuffix fa starts = bfs [(q, []) | q <- nub starts] []
  where
    bfs [] _ = Nothing
    bfs queue visited =
      case filter (\(q, _) -> q `elem` qFinal fa) queue of
        (_, y) : _ -> Just y
        [] ->
          let visited'  = visited ++ map fst queue
              nextQueue = foldr (\x acc -> if fst x `elem` map fst acc then acc else x : acc) []
                [ (r, path ++ [c])
                | (q, path) <- queue
                , c         <- sigma fa
                , r         <- step fa q c
                , r `notElem` visited' ]
          in bfs nextQueue visited'

canExtend :: FA -> [Symbol] -> Maybe String
canExtend fa w = fmap (w ++) (findSuffix fa (runWord fa w))

-- DFA over {'0','1'} accepting binary numbers divisible by 3
-- State 0: remainder 0 (start, accepting)
-- State 1: remainder 1
-- State 2: remainder 2
fa :: FA
fa = FA
  { delta  = [ (0,'0',0), (0,'1',1)
             , (1,'0',2), (1,'1',0)
             , (2,'0',1), (2,'1',2) ]
  , q0     = 0
  , qFinal = [0]
  , sigma  = "01"
  }

main :: IO ()
main = do
  hSetEncoding stdout utf8
  putStrLn "Test 2 (easy): w = \"11\" (binary 3) -- w itself is accepted, so y = \"\""
  let w = "11"
  case canExtend fa w of
    Just wy -> do
      putStrLn $ "Result:   Yes, example word wy = \"" ++ wy ++ "\""
      putStrLn   "Expected: Yes, wy = \"11\"  (binary 11 = 3, divisible by 3)"
    Nothing ->
      putStrLn   "Result:   No"
