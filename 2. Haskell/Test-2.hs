import Task31

main :: IO ()
main = do
    putStrLn "Тест 2 (легкий): один пік у середині"
    let xs = [1,3,2 :: Int]
    putStrLn $ "Список:      " ++ show xs
    putStrLn $ "Результат:   " ++ show (splitAtPeaks xs)
    putStrLn   "Очікується:  [[1,3],[2]]"
