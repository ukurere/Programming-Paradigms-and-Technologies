-- Test 1 (easy): u1, u2, u3 with valid input x = 4
-- u1(4) = 1/(4+13)       = 1/17           ~ 0.0588
-- u2(4) = 1/lg(16-13)    = 1/lg(3)        ~ 2.096
-- u3(4) = 1/(lg(4)+13)   = 1/13.602       ~ 0.0735
-- All three return Just

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
  putStrLn "Test 1 (easy): u1, u2, u3 with valid input x = 4"
  putStrLn $ "u1(4)  = " ++ show (u1 4)
  putStrLn   "Expected: Just 5.882...e-2  (~0.0588)"
  putStrLn $ "u2(4)  = " ++ show (u2 4)
  putStrLn   "Expected: Just 2.096..."
  putStrLn $ "u3(4)  = " ++ show (u3 4)
  putStrLn   "Expected: Just 7.352...e-2  (~0.0735)"
