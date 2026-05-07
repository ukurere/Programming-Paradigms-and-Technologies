module Task21 where

isPow2 :: Int -> Bool
isPow2 1 = True
isPow2 n = n > 0 && even n && isPow2 (n `div` 2)

splitPow2 :: [Int] -> ([Int], [Int])
splitPow2 xs = (filter isPow2 xs, filter (not . isPow2) xs)
