
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