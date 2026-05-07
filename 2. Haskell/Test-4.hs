import Task31

main :: IO ()
main = do
    putStrLn "Тест 4 (важкий): три піки — чотири підсписки"
    let xs = [2,5,1,4,3,6,1 :: Int]
    putStrLn $ "Список:      " ++ show xs
    putStrLn $ "Результат:   " ++ show (splitAtPeaks xs)
    putStrLn   "Очікується:  [[2,5],[1,4],[3,6],[1]]"
