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

; reviota

; Notkun:   z = (reviota n)
; Fyrir:    n er heiltala, n >= 0
; Gildi:    z er listi, (n ... 2 1)
(define (reviota n)
    ; Fyrir:    (inner i acc)
    ; Gildi:    i er tala
    ;           acc er listi
    (define (inner i acc)
        (if (> i n)
            acc
            (inner (+ i 1) (cons i acc))
        )
    )

    (inner 1 '())
)

(reviota 0)
(reviota 10)

