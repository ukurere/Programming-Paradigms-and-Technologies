import Task11

main :: IO ()
main = do
    putStrLn "Тест 1 (легкий): базовий випадок"
    let l1 = [1,2,3,4,5]
        l2 = [1,1,2,3,3,4]
    putStrLn $ "Список 1:    " ++ show l1
    putStrLn $ "Список 2:    " ++ show l2
    putStrLn $ "Результат:   " ++ show (removeIfTwice l1 l2)
    putStrLn   "Очікується:  [2,4,5]"
