import System.IO

splitAtPeaks :: Ord a => [a] -> [[a]]
splitAtPeaks [] = []
splitAtPeaks [x] = [[x]]
splitAtPeaks xs = splitBy xs peakIdxs
  where
    n = length xs
    peakIdxs = [i | i <- [0..n-1], isPeak i]
    isPeak 0      = xs !! 0 > xs !! 1
    isPeak i
      | i == n-1  = xs !! i > xs !! (i-1)
      | otherwise = xs !! i > xs !! (i-1) && xs !! i > xs !! (i+1)
    splitBy ys [] = [ys]
    splitBy ys (p:ps) =
      take (p+1) ys : splitBy (drop (p+1) ys) (map (subtract (p+1)) ps)

main :: IO ()
main = do
    hSetEncoding stdout utf8
    putStrLn "Test 1 (easy): example from the task"
    let xs = [5,4,2,8,3,1,2,6,9,5 :: Int]
    putStrLn $ "List:       " ++ show xs
    putStrLn $ "Result:     " ++ show (splitAtPeaks xs)
    putStrLn   "Expected:   [[5],[4,2,8],[3,1,2,6,9],[5]]"
