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

; Notkun:   (zippy u z f)
; Fyrir:    z er listi talna
;           f er listi tvíundaraðgerða sem 
;           taka tölur sem inntak og skila tölu
;           u er tala
; Eftir:    útkoma fallsins er u f1 x1 f2 x2 ... fn xN
(define (zippy u f z)
    (if (null? z)
        u
        (zippy ((car f) u (car z)) (cdr f) (cdr z))
    )
)

(zippy 2 (list * /) (list 3 2))