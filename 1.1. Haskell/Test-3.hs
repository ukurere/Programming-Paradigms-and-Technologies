import Task11

main :: IO ()
main = do
    putStrLn "Тест 3 (важкий): елемент двічі у першому і двічі у другому"
    let l1 = [1,1,2,3,3]
        l2 = [1,1,3,3]
    putStrLn $ "Список 1:    " ++ show l1
    putStrLn $ "Список 2:    " ++ show l2
    putStrLn $ "Результат:   " ++ show (removeIfTwice l1 l2)
    putStrLn   "Очікується:  [2]"
