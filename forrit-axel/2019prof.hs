{-2019 próf-}

{-
**************
* Spurning 5 *
**************
-}

{-
Notkun: help l acc
Fyrir : l er listi af gerð [a]
        acc er af týpu a.
Eftir : Summan af tölunum í l í öðru veldi að viðbættu acc.
-}

help :: Num a => [a] -> a -> a
help [] a = a
help (x:xs) a = help (xs) ((x*x) + a) 

{-
Notkun: squareSum l 
Fyrir : l er listi af gerð [a].
Eftir : Summan af tölunum í l í öðru veldi.
-}

squareSum :: Num a => [a] -> a
squareSum (l:ls) = help ls (l*l)


{-
**************
* Spurning 6 *
**************
-}

{-
Notkun: help f x acc
Fyrir : f er listi einundarfalla (a -> b)
        og x er listi af taginu [a].
        Þeir eru jafnlangir og acc er listi af taginu [b]
Eftir : Listinn af taginu b [(f_n x_n), (f_n-1 x_n-1),...,(f_1 x_1), acc_1, acc_2,...,acc_n]
-}

help2 :: [(a -> b)] -> [a] -> [b] -> [b]
help2 [] [] acc = acc
help2 (f:fs) (x:xs) acc = 
    help2 fs xs ((f x) : acc)

{-
Notkun: zipMapRev f x
Fyrir : f er listi einundarfalla (a -> b)
        og x er listi af gildum af taginu a.
        Þeir eru jafnlangir
Eftir : Listinn af taginu b [(f_n x_n), (f_n-1 x_n-1),...,(f_1 x_1)]
-}

zipMapRev :: [(a -> b)] -> [a] -> [b]
zipMapRev f x = help2 f x []


{-
**************
* Spurning 7 *
**************

-}
{-Haldaendurkvæmt-}
{-foldl-}
myLeft :: (b -> a -> b) -> b -> [a] -> b
myLeft f u [] = u
myLeft f u (x:xs) = 
    myLeft f (f u x) xs

{-foldr-}
myRight :: (a -> b -> b) -> b -> [a] -> b
myRight f u [] = u
myRight f u (x:xs) =
    f x (myRight f u xs)

{-
**************
* Spurning 8 *
**************
-}

{-
Notkun: mapreduce op f x u
Fyrir : f er einundarfall
        op er tvíundarfall
        x er listi
        u er gildi
Eftir : gildið (f x1) ! (f x2) ! ... ! (f x_n) ! u
        þar sem ! er op í infix form. Reiknað frá hægri til vinstri
-}
mapreduce2 :: (b -> c -> c) -> (a -> b) -> [a] -> c -> c
mapreduce2 op f [] u = u
mapreduce2 op f (x:xs) u =
    (op (f x) (mapreduce2 op f xs u))

{-Testing-}
main :: IO()
main = do
    print (zipMapRev [(\y -> y*y),(\y -> y*y),(\y -> y*y),(\y -> y*y)] [1,2,3,4])
    print (myRight (\y x -> y - x) 5 [1,2,3,4])
    print (mapreduce2 (\y x -> y - x) (\f -> f*f) [1,2,3,4] 5)    
    print (foldr (\y x -> y - x) 5 (map (\f -> f*f) [1,2,3,4]))
