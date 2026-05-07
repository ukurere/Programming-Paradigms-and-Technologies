import Task31

main :: IO ()
main = do
    putStrLn "Тест 1 (легкий): приклад з умови задачі"
    let xs = [5,4,2,8,3,1,2,6,9,5 :: Int]
    putStrLn $ "Список:      " ++ show xs
    putStrLn $ "Результат:   " ++ show (splitAtPeaks xs)
    putStrLn   "Очікується:  [[5],[4,2,8],[3,1,2,6,9],[5]]"
