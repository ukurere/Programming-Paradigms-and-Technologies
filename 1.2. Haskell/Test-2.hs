import Task21

main :: IO ()
main = do
    putStrLn "Тест 2 (легкий): порожній список"
    let xs = ([] :: [Int])
    putStrLn $ "Список:          " ++ show xs
    putStrLn $ "Результат:       " ++ show (splitPow2 xs)
    putStrLn   "Очікується:      ([],[])"
