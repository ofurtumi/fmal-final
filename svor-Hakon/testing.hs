{-
Notkun: foldleft f u x
Fyrir:  f er tvíundarfall,
        u er heiltala,
        x er listi af heiltölum
Eftir:  (((f u x1) f x2)f .. )f xN
-}

foldleft f u [] = u
foldleft f u (x:xs) = foldleft f (f u x) xs
{-
Notkun: foldright f x u
Fyrir:  f er tvíundarfall
        x er listi
        u er tala
Eftir:  f x1(f x2(f .. (f xN u)))
-}
foldright f [] u = u
foldright f (x:xs) u = foldright f xs (f x u)

atoi i n = [n, n-1 .. i]
itoa i n = [i .. n]

sqsum (x:xs) = help (x:xs) 0
    where
        help [] sum = sum
        help (l:ls) sum = help ls (sum + (l^2)) 

main :: IO()
main = do
    let x = [1,2,3,4,5]
    print(foldleft (\x y -> x - y) 2 x)
    print(foldl (\x y -> x - y) 2 x)
    print("---------------------------")
    print(foldright (\x y -> x - y) x 2)
    print(foldr (\x y -> x - y) 2 x)
    print("---------------------------")
    print(atoi 1 5)
    print(itoa 1 5)
    print("---------------------------")
    print(sqsum x)
