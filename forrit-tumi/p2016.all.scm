#!/usr/racket/bin/racket
#lang racket

; |||||||||||||||||||||||||||||||||
; ||    __    sjomli.is    __    ||
; ||  _/  |_ __ __  _____ |__|   ||
; ||  \   __\  |  \/     \|  |   ||
; ||   |  | |  |  /  Y Y  \  |   ||
; ||   |__| |____/|__|_|__/__|   ||
; ||                             ||
; |||||||||||||||||||||||||||||||||

; Notkun:   z = (myfold f u x)
; Fyrir:    f er tvíundarfall
;           u er eitthvert gildi
;           x er listi einhverra gilda
; Gildi:    z = (f ... (f (f u x1) x2) ... xN)
(define (myfold f u x)
    (if (null? x)
        u
        (myfold f (f u (car x)) (cdr x))
    )
)

(myfold + 10 '(1 2 3 4))
(myfold + 10 '())

; Notkun:   z = (helper acc n)
; Fyrir:    acc er listi
;           n er heiltala, n >=0
; Gildi:    z er listi heiltalna (1 2 ... n)
(define (helper1 acc n)
    (if (= n 0)
        acc
        (helper1 (cons n acc) (- n 1))
    )
)

; Notkun:   x = (ioata n)
; Fyrir:    n er heiltala, n >= 0
; Gildi:    x er listi heiltalna (1 2 ... n)
(define (iota n)
    (helper1 '() n)
)

(iota 5)
(iota 10)

; Notkun:   z = (helper prev x)
; Fyrir:    prev er tala
;           x er listi af tölum, má vera tómur
;           y er listi talna
; Gildi:    z = (xn+...+x2+x1+0 ... x2+x1+0 x1+0 0)
(define (helper2 prev x y)
    (if (null? x)
        (cons prev y)
        (helper2 (+ prev (car x)) (cdr x) (cons prev y))
    )
)

; Notkun:   (summer x)
; Fyrir:    x=(x1 x2 ... x3) er listi talna
;           má vera tómur
; Gildi:    listinn (xn+...+x2+x1+0 ... x2+x1+0 x1+0 0)
(define (summer x)
    (helper2 0 x '())
)

(summer (list 1 2 3))
(summer (list ))