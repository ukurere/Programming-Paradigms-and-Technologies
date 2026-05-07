import Task21

main :: IO ()
main = do
    putStrLn "Тест 3 (важкий): нулі та від'ємні числа"
    let xs = [0,-4,1,2,16,15]
    putStrLn $ "Список:          " ++ show xs
    putStrLn $ "Результат:       " ++ show (splitPow2 xs)
    putStrLn   "Очікується:      ([1,2,16],[0,-4,15])"
