import Task21

main :: IO ()
main = do
    putStrLn "Тест 4 (важкий): великі степені двійки серед інших чисел"
    let xs = [64,100,128,200,256]
    putStrLn $ "Список:          " ++ show xs
    putStrLn $ "Результат:       " ++ show (splitPow2 xs)
    putStrLn   "Очікується:      ([64,128,256],[100,200])"
