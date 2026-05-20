-- Task 5, Section 3:
-- For a given word w, determine if the finite automaton accepts
-- at least one word of the form w++y (for some word y, possibly empty).
-- If yes, provide an example of such word w++y.

module Task3 where

import Data.List (nub)

type State  = Int
type Symbol = Char

-- | A nondeterministic finite automaton (NFA / DFA)
data FA = FA
  { delta  :: [(State, Symbol, State)]  -- transition relation
  , q0     :: State                     -- initial state
  , qFinal :: [State]                   -- set of accepting states
  , sigma  :: [Symbol]                  -- alphabet
  } deriving (Show)

-- | All states reachable from state q by reading one symbol c
step :: FA -> State -> Symbol -> [State]
step fa q c = [r | (s, a, r) <- delta fa, s == q, a == c]
  
-- | Set of states reached after reading word w from the initial state
runWord :: FA -> [Symbol] -> [State]
runWord fa = foldl nextLayer [q0 fa]
  where
    nextLayer qs c = nub $ concatMap (\q -> step fa q c) qs

-- | BFS from a set of start states.
--   Finds the shortest suffix y such that reading y from some start state
--   leads to an accepting state.
--   Returns Just y if such y exists, Nothing otherwise.
findSuffix :: FA -> [State] -> Maybe [Symbol]
findSuffix fa starts = bfs [(q, []) | q <- nub starts] []
  where
    bfs [] _ = Nothing
    bfs queue visited =
      case filter (\(q, _) -> q `elem` qFinal fa) queue of
        (_, y) : _ -> Just y      -- found: return the suffix
        []         ->
          let visited'  = visited ++ map fst queue
              nextQueue = nubFirst
                [ (r, path ++ [c])
                | (q, path) <- queue  -- for each current state
                , c         <- sigma fa  -- try every symbol
                , r         <- step fa q c  -- compute next state
                , r `notElem` visited'  -- skip already-visited states
                ]
          in bfs nextQueue visited'

    -- keep only the first (shortest-path) occurrence of each state
    nubFirst = foldr
      (\x acc -> if fst x `elem` map fst acc then acc else x : acc) []

-- | For a given automaton fa and word w,
--   determine whether fa accepts some word of the form w ++ y.
--   Returns Just (w ++ y) if yes, Nothing otherwise.
canExtend :: FA -> [Symbol] -> Maybe String
canExtend fa w = fmap (w ++) (findSuffix fa (runWord fa w))
