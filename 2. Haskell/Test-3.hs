import Task31

main :: IO ()
main = do
    putStrLn "Тест 3 (важкий): два піки — три підсписки"
    let xs = [1,5,2,4,3 :: Int]
    putStrLn $ "Список:      " ++ show xs
    putStrLn $ "Результат:   " ++ show (splitAtPeaks xs)
    putStrLn   "Очікується:  [[1,5],[2,4],[3]]"
