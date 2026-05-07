import Task21

main :: IO ()
main = do
    putStrLn "Тест 1 (легкий): базовий випадок"
    let xs = [1,2,3,4,5,6,7,8]
    putStrLn $ "Список:          " ++ show xs
    putStrLn $ "Результат:       " ++ show (splitPow2 xs)
    putStrLn   "Очікується:      ([1,2,4,8],[3,5,6,7])"
