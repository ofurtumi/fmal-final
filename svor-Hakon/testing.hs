
foldleft f u [] = u
foldleft f u (x:xs) = foldleft f (f u x) xs

foldright f [] u = u
foldright f (x:xs) u = foldright f xs (f x u)

main :: IO()
main = do
    let x = [1,2,3,4,5]
    print(foldleft (\x y -> x - y) 2 x)
    print(foldl (\x y -> x - y) 2 x)
    print("---------------------------")
    print(foldright (\x y -> x - y) x 2)
    print(foldr (\x y -> x - y) 2 x)
