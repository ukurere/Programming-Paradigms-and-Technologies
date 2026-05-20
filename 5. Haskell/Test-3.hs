-- Test 3 (hard): superposition comp(x) = u1(u2(u3(x)))
-- compDo  uses do-notation
-- compBind uses >>= (bind)
--
-- x = 4:    u3(4) ~ 0.0735, u2(0.0735) -> 0.0735^2 - 13 < 0 -> Nothing
-- x = 8e-14: lg(8e-14) ~ -13.097
--            u3(8e-14) = 1/(-13.097+13) ~ -10.31
--            u2(-10.31) = 1/lg(106.3-13) = 1/lg(93.3) ~ 0.507
--            u1(0.507)  = 1/(0.507+13)   ~ 0.074  -> Just 0.074

import System.IO

lg :: Double -> Double
lg x = log x / log 10

u1 :: Double -> Maybe Double
u1 x
  | x + 13 == 0 = Nothing
  | otherwise   = Just (1 / (x + 13))

u2 :: Double -> Maybe Double
u2 x
  | x^2 - 13 <= 0      = Nothing
  | lg (x^2 - 13) == 0 = Nothing
  | otherwise          = Just (1 / lg (x^2 - 13))

u3 :: Double -> Maybe Double
u3 x
  | x <= 0         = Nothing
  | lg x + 13 == 0 = Nothing
  | otherwise      = Just (1 / (lg x + 13))

-- Superposition with do-notation
compDo :: Double -> Maybe Double
compDo x = do
  a <- u3 x
  b <- u2 a
  u1 b

-- Superposition with >>= (bind)
compBind :: Double -> Maybe Double
compBind x = u3 x >>= u2 >>= u1

main :: IO ()
main = do
  hSetEncoding stdout utf8
  putStrLn "Test 3 (hard): comp(x) = u1(u2(u3(x)))"
  putStrLn ""
  putStrLn "-- do-notation --"
  putStrLn $ "compDo 4     = " ++ show (compDo 4)
  putStrLn   "Expected: Nothing  (u3(4)~0.074, then u2(0.074) fails)"
  putStrLn $ "compDo 8e-14 = " ++ show (compDo 8e-14)
  putStrLn   "Expected: Just ~0.074"
  putStrLn ""
  putStrLn "-- bind (>>=) --"
  putStrLn $ "compBind 4     = " ++ show (compBind 4)
  putStrLn   "Expected: Nothing"
  putStrLn $ "compBind 8e-14 = " ++ show (compBind 8e-14)
  putStrLn   "Expected: Just ~0.074"
