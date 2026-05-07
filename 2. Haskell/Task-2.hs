module Task31 where

splitAtPeaks :: Ord a => [a] -> [[a]]
splitAtPeaks [] = []
splitAtPeaks [x] = [[x]]
splitAtPeaks xs = splitBy xs peakIdxs
  where
    n = length xs
    peakIdxs = [i | i <- [0..n-1], isPeak i]
    isPeak 0      = head xs > xs !! 1
    isPeak i
      | i == n-1  = xs !! i > xs !! (i-1)
      | otherwise = xs !! i > xs !! (i-1) && xs !! i > xs !! (i+1)
    splitBy ys [] = [ys]
    splitBy ys (p:ps) =
      take (p+1) ys : splitBy (drop (p+1) ys) (map (subtract (p+1)) ps)
