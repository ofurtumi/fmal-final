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



; Notkun:   (powlist x)
; Fyrir:    x er listi talna
; Eftir:    útkoma er summa talna í x á forminu
;           (x1) + (x1 + x2) + ... + (x1 + x2 + ... + xN)
(define (powlist x)
    ; Notkun:   (helper acc done rest)
    ; Fyrir:    acc er heildarsumma, verður skilað í lokin
    ;           lastsum er summa fyrri talna úr rest, utan acc
    ;           rest er listi talna sem eftir á að reikna
    ; Eftir:    summa allra talna 
    (define (helper acc lastsum rest)
        (if (null? rest)
            acc
            (helper 
                (+ acc lastsum (car rest)) 
                (+ lastsum (car rest))
                (cdr rest)
            )
        )
    )

    (helper 0 0 x)
)

(powlist '(1 2 3))
(powlist '(1 2))
(powlist '(1))