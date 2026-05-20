import System.IO

countOcc :: Eq a => a -> [a] -> Int
countOcc x = length . filter (== x)

removeIfTwice :: Eq a => [a] -> [a] -> [a]
removeIfTwice list1 list2 = filter (\x -> countOcc x list2 /= 2) list1

main :: IO ()
main = do
    hSetEncoding stdout utf8
    putStrLn "Test 3 (hard): duplicates in first list"
    let l1 = [1,1,2,3,3]
        l2 = [1,1,3,3]
    putStrLn $ "List 1:     " ++ show l1
    putStrLn $ "List 2:     " ++ show l2
    putStrLn $ "Result:     " ++ show (removeIfTwice l1 l2)
    putStrLn   "Expected:   [2]"
