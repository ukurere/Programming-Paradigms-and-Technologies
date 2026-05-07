import Task11

main :: IO ()
main = do
    putStrLn "Тест 4 (важкий): елемент тричі у другому списку — не вилучається"
    let l1 = [1,2,3,4]
        l2 = [1,1,1,2,2,3,3,3]
    putStrLn $ "Список 1:    " ++ show l1
    putStrLn $ "Список 2:    " ++ show l2
    putStrLn $ "Результат:   " ++ show (removeIfTwice l1 l2)
    putStrLn   "Очікується:  [1,3,4]"
