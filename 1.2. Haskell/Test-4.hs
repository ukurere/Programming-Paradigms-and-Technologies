import System.IO

isPow2 :: Int -> Bool
isPow2 1 = True
isPow2 n = n > 0 && even n && isPow2 (n `div` 2)

splitPow2 :: [Int] -> ([Int], [Int])
splitPow2 xs = (filter isPow2 xs, filter (not . isPow2) xs)

main :: IO ()
main = do
    hSetEncoding stdout utf8
    putStrLn "Test 4 (hard): large powers of 2 among other numbers"
    let xs = [64,100,128,200,256]
    putStrLn $ "List:       " ++ show xs
    putStrLn $ "Result:     " ++ show (splitPow2 xs)
    putStrLn   "Expected:   ([64,128,256],[100,200])"
