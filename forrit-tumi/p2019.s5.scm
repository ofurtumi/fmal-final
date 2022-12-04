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

; Skrifið halaendurkvæmt fall í Scheme, CAML, Morpho eða Haskell,
; sem tekur lista talna 𝑥1, ... , 𝑥𝑛 sem viðfang og skilar summunni
; (x1^2 + x2^2 + ... + xn^2) 
; Þið munið þurfa hjálparfall og munið að skrifa réttar
; notkunarlýsingar. Einungis má nota einföld innbyggð föll svo sem
; +, *, null? car, cdr og cons, en ekki flóknari föll svo sem foldl eða
; map.
; Write a tail-recursive function in Scheme, CAML, Morpho or
; Haskell, that takes as argument a list of numbers 𝑥1, ... , 𝑥𝑛 and
; returns the sum ∑ 𝑥𝑖
; 2𝑛
; 𝑖=1 . You will need a helper function and
; remember to write correct usage descriptions. You may only use
; simple built-in functions such as +, *, null?, car, cdr and cons, but
; not more complicated functions such as foldl or map.


; Notkun:   (helper acc rest)
; Fyrir:    acc er summa útreikninga sem hafa verið gerðir
;           rest er listi af tölum sem á eftir að nota í útreikninga
; Eftir:    skilar summu allra talna í rest eftir að þær hava verið settar í annað veldi
(define (helper acc rest)
    (if (null? rest)
        acc
        (helper (+ acc (* (car rest) (car rest))) (cdr rest))
    )
)

; Notkun:   (squarelist x)
; Fyrir:    x er listi talna
; Eftir     fallið skilar summu allra talna listans 
;           eftir að þær hafa verið settar í annað veldi

(define (squarelist x)
    (helper 0 x)
)

(squarelist (list 1 2 3))
(squarelist (list 3 2 1))
(squarelist (list 5 7 9))