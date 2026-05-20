-- Test 2 (easy): u1, u2, u3 with invalid inputs -> Nothing
-- u1(-13): x + 13 = 0           -> division by zero -> Nothing
-- u2(1):   1 - 13 = -12 <= 0    -> log of negative  -> Nothing
-- u3(-5):  x <= 0               -> log undefined    -> Nothing

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

main :: IO ()
main = do
  hSetEncoding stdout utf8
  putStrLn "Test 2 (easy): u1, u2, u3 with invalid inputs"
  putStrLn $ "u1(-13) = " ++ show (u1 (-13))
  putStrLn   "Expected: Nothing  (x + 13 = 0)"
  putStrLn $ "u2(1)   = " ++ show (u2 1)
  putStrLn   "Expected: Nothing  (1 - 13 = -12, log of negative)"
  putStrLn $ "u3(-5)  = " ++ show (u3 (-5))
  putStrLn   "Expected: Nothing  (x <= 0, log undefined)"
