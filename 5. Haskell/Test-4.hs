-- Test 4 (hard): binary v(x,n) and comp2(x) = v(u1(x), u2(x))
-- comp2Do  uses do-notation
-- comp2Bind uses >>= (bind)
--
-- v(x,n) = 1 / (lg x + n)
--
-- x = 4:
--   u1(4) = 1/17 ~ 0.0588
--   u2(4) = 1/lg(3) ~ 2.096
--   v(0.0588, 2.096) = 1/(lg(0.0588) + 2.096) = 1/(-1.230 + 2.096) ~ 1.155 -> Just
--
-- x = 1:
--   u2(1) -> 1 - 13 = -12 <= 0 -> Nothing -> comp2 returns Nothing

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

v :: Double -> Double -> Maybe Double
v x n
  | x <= 0        = Nothing
  | lg x + n == 0 = Nothing
  | otherwise     = Just (1 / (lg x + n))

-- comp2(x) = v(u1(x), u2(x)) with do-notation
comp2Do :: Double -> Maybe Double
comp2Do x = do
  a <- u1 x
  b <- u2 x
  v a b

-- comp2(x) = v(u1(x), u2(x)) with >>= (bind)
comp2Bind :: Double -> Maybe Double
comp2Bind x = u1 x >>= \a -> u2 x >>= \b -> v a b

main :: IO ()
main = do
  hSetEncoding stdout utf8
  putStrLn "Test 4 (hard): v(x,n) and comp2(x) = v(u1(x), u2(x))"
  putStrLn ""
  putStrLn "-- binary function v --"
  putStrLn $ "v 4 2.096 = " ++ show (v 4 2.096)
  putStrLn   "Expected: Just ~2.092"
  putStrLn $ "v (-1) 3  = " ++ show (v (-1) 3)
  putStrLn   "Expected: Nothing  (x <= 0)"
  putStrLn ""
  putStrLn "-- do-notation --"
  putStrLn $ "comp2Do 4 = " ++ show (comp2Do 4)
  putStrLn   "Expected: Just ~1.155"
  putStrLn $ "comp2Do 1 = " ++ show (comp2Do 1)
  putStrLn   "Expected: Nothing  (u2(1) fails)"
  putStrLn ""
  putStrLn "-- bind (>>=) --"
  putStrLn $ "comp2Bind 4 = " ++ show (comp2Bind 4)
  putStrLn   "Expected: Just ~1.155"
  putStrLn $ "comp2Bind 1 = " ++ show (comp2Bind 1)
  putStrLn   "Expected: Nothing"
