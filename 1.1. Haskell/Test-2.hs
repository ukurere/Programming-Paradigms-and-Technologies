import Task11

main :: IO ()
main = do
    putStrLn "Тест 2 (легкий): порожній перший список"
    let l1 = ([] :: [Int])
        l2 = [1,1,2,2,3]
    putStrLn $ "Список 1:    " ++ show l1
    putStrLn $ "Список 2:    " ++ show l2
    putStrLn $ "Результат:   " ++ show (removeIfTwice l1 l2)
    putStrLn   "Очікується:  []"
