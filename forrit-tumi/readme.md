# forrit upp úr prófum

## 2019 - almennt
forritin úr 2019 prófinu eru öll skrifuð í **scheme** ég bæti hugsanlega við fleiri lausnum í öðrum málum ef ég nenni  

> ath. spurning 6, ef ehv getur útskýrt hana betur fyrir mér væri það vel þegið  
> búinn að vera reyna keyra hana í tvo tíma  
> fór út með hundinn, prófaði að keyra aftur en nota `(list (lambda ...) ...)` í stað `'((lambda ...) ...)` og nú virkar það  B)

## 2019 - inntök og útkomur
dæmi um inntök og úttök hægt að nota til að athuga hvort forrit sé að keyra rétt, eins og svo oft áður bendi ég á að það gætu verið villur í svörunum, endilega láttu mig vita ef svo er
### spurning 5
**inntak**
```scheme
    (squarelist (list 1 2 3))
    (squarelist (list 3 2 1))
    (squarelist (list 5 7 9))
```

<details>
    <summary style="font-weight: bold; cursor: pointer;">útkoma</summary>
    <pre>
    14
    14
    155</pre>
</details>

### spurning 6
**inntak**
```scheme
    (funky 
        (list (lambda (n) (+ n 3)) (lambda (n) (+ n 2))) 
        (list 2 3)
    )
    (funky
        (list (lambda (n) (* n 69)) (lambda (n) (/ n 2)))
        (list 10 138)
    )
```
<details>
    <summary style="font-weight: bold; cursor: pointer;">útkoma</summary>
    <pre>
    '(5 5)
    '(69 690)</pre>
</details>

### spurning 7
**inntak**
```scheme
    (foldl (lambda (i j) (* i j)) 2 (list 1 2 3 4))
    (foldl (lambda (i j) (* i j)) 1 (list 1 2 4 5))
    (foldr (lambda (i j) (* i j)) (list 1 2 3 4) 2)
    (foldr (lambda (i j) (* i j)) (list 1 2 4 5) 1)
```

<details>
    <summary style="font-weight: bold; cursor: pointer;">útkoma</summary>
    <pre>
    48
    40
    48
    40</pre>
</details>

### spurning 8
**inntak**
```scheme
    (mapreduce + (lambda (n) (- n 2)) '(1 2 3 4) 5)
    (mapreduce + (lambda (n) (+ n 3)) '(1 2 3 4) 5)
    (mapreduce - (lambda (n) (- n 3)) '(1 2 3 4) 5)
```
<details>
    <summary style="font-weight: bold; cursor: pointer;">útkoma</summary>
    <pre>
    7
    27
    3</pre>
</details>