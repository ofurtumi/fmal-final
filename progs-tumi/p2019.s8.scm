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

; Notkun:   (mapreduce op f x u)
; Fyrir:    op er tvíundarfall 
;           f er einundarfall
;           x er liti gilda sem eru gild fyrir f
;           u er gildi
; Gildi:    skilagildið er (f x1) + (x x2) + ... +(f xN) + u
;           þar sem + stendur fyrir op

(define (mapreduce op f x u)
    (if (null? x)
        u
        (op (f (car x)) (mapreduce op f (cdr x) u))
    )
)