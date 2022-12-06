
;;****************************
;;******** Spurning 6 ********
;;****************************

;; Notkun (help x l)
;; Fyrir x er tala, l er listi, (cons x l) er listi af tölum
;; Eftir minnsta talan úr þessum lista
(define (help x l)
    (if (null? l)
        x
        (if (> x (car l))
            (help (car l) (cdr l))
            (help x (cdr l)))))

;; Notkun: (minlist l)
;; Fyrir:  l er listi talna á bilinu [0,1]
;; Eftir;  talan sem er minnsta talan úr listanum
(define (minlist l)
    (if (null? l)
        1                        
        (help (car l) (cdr l))))

;; Notkun: (help2 m l)
;; Fyrir:  m er listi af tölum, l er listi af listum af tölum.
;;         (cons m l) er listi af listum af tölum.
;; Eftir   Stærsta talan er menginu sem inniheldur 
;;         minnstu töluna ú hverjum lista.

(define (help2 m l)
    (if (null? l)
        m
        (if (< m (minlist (car l)))
            (help2 (minlist (car l)) (cdr l))
            (help2 m (cdr l)))))


;;`main` fallið
;;****************************
;; Notkun (maxmin l)
;; Fyrir l er listi af listum af tölum á bilinu [0,1].
;; Eftir   Stærsta talan er menginu sem inniheldur 
;;         minnstu töluna ú hverjum lista.
(define (maxmin l)
    (if (null? l)
        0
        (help2 (minlist (car l)) (cdr l))))

;; Dæmi um keyrslu
(maxmin(list (list 0.2 0.1 0.5) (list 0.7 0.9 0.3)))
;; >> 0.3


;;****************************
;;******** Spurning 7 ********
;;****************************

;; Notkun: (zip2 f l1 l2)
;; Fyrir:  f er tvíundaraðgerð af tagi a -> b.
;;         l1, l2 eru jafnlangir listar af tagi a.
;; Eftir:  listinn af tagi b, (f(l1_1,l2_1),f(l1_2,l2_2),...,f(l1_n,l2_n)).
(define (zip2 f l1 l2)
    (if (null? l1)
        l1
        (cons (f (car l1) (car l2)) (ziphelp f (cdr l1) (cdr l2)))))

;; Dæmi um keyrslu
(zip2 + '(1 2 3) '(4 5 6))
;; >> (5 7 9)


;;****************************
;;******** Spurning 8 ********
;;****************************

;; Notkun: (myLeft f x l)
;; Fyrir:  f er tvíundaraðgerð (b -> a -> b)
;;         x er af tagi b og l inniheldur gildi af tagi a
;; Eftir:  gildið af tagi b, (f ... (f (f x l_1) l_2) ... l_n)
(define (myLeft f x l)
    (if (null? l)
        x
        (myLeft f (f x (car l)) (cdr l))))

;; Notkun: (myRight f x l)
;; Fyrir:  f er tvíundaraðgerð (b -> a -> b)
;;         x er af tagi b og l inniheldur gildi af tagi a
;; Eftir:  gildið af tagi b, (f l_1 (f l_2 ... (f l_n x))...)
(define (myRight f x l)
    (if (null? l)
        x
        (f (car l) (myRight f x (cdr l)))))