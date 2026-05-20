-- Task, Section 5: Maybe-functions (n = 13)
-- u1(x) = 1 / (x + 13)       [f4]
-- u2(x) = 1 / lg(x^2 - 13)   [f7]
-- u3(x) = 1 / (lg x + 13)    [f3]
-- v(x,n) = 1 / (lg x + n)    [f3, n as argument]

module Task5 where

-- | Logarithm base 10
lg :: Double -> Double
lg x = log x / log 10

-- | u1(x) = 1 / (x + 13)
-- Nothing when x = -13 (division by zero)
u1 :: Double -> Maybe Double
u1 x
  | x + 13 == 0 = Nothing
  | otherwise   = Just (1 / (x + 13))

-- | u2(x) = 1 / lg(x^2 - 13)
-- Nothing when x^2 - 13 <= 0 (log of non-positive)
-- Nothing when x^2 - 13 = 1  (log = 0, division by zero)
u2 :: Double -> Maybe Double
u2 x
  | x^2 - 13 <= 0      = Nothing
  | lg (x^2 - 13) == 0 = Nothing
  | otherwise          = Just (1 / lg (x^2 - 13))

-- | u3(x) = 1 / (lg x + 13)
-- Nothing when x <= 0 (log undefined)
-- Nothing when lg x = -13 (division by zero)
u3 :: Double -> Maybe Double
u3 x
  | x <= 0         = Nothing
  | lg x + 13 == 0 = Nothing
  | otherwise      = Just (1 / (lg x + 13))

-- | Superposition: comp(x) = u1(u2(u3(x)))
-- With do-notation
compDo :: Double -> Maybe Double
compDo x = do
  a <- u3 x
  b <- u2 a
  u1 b

-- Without do-notation (using >>=)
compBind :: Double -> Maybe Double
compBind x = u3 x >>= u2 >>= u1

-- | Binary function: v(x, n) = 1 / (lg x + n)
-- Nothing when x <= 0 (log undefined)
-- Nothing when lg x + n = 0 (division by zero)
v :: Double -> Double -> Maybe Double
v x n
  | x <= 0        = Nothing
  | lg x + n == 0 = Nothing
  | otherwise     = Just (1 / (lg x + n))

-- | Superposition: comp2(x) = v(u1(x), u2(x))
-- With do-notation
comp2Do :: Double -> Maybe Double
comp2Do x = do
  a <- u1 x
  b <- u2 x
  v a b

-- Without do-notation (using >>=)
comp2Bind :: Double -> Maybe Double
comp2Bind x = u1 x >>= \a -> u2 x >>= \b -> v a b
