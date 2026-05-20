module Task11 where

countOcc :: Eq a => a -> [a] -> Int
countOcc x = length . filter (== x)

removeIfTwice :: Eq a => [a] -> [a] -> [a]
removeIfTwice list1 list2 = filter (\x -> countOcc x list2 /= 2) list1 