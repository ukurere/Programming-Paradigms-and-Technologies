module Task5 where

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

compDo :: Double -> Maybe Double
compDo x = do
  a <- u3 x
  b <- u2 a
  u1 b

compBind :: Double -> Maybe Double
compBind x = u3 x >>= u2 >>= u1

v :: Double -> Double -> Maybe Double
v x n
  | x <= 0        = Nothing
  | lg x + n == 0 = Nothing
  | otherwise     = Just (1 / (lg x + n))

comp2Do :: Double -> Maybe Double
comp2Do x = do
  a <- u1 x
  b <- u2 x
  v a b

-- Without do-notation (using >>=)
comp2Bind :: Double -> Maybe Double
comp2Bind x = u1 x >>= \a -> u2 x >>= \b -> v a b
