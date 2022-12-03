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

;; Usage:   (mapreduce op f u x)
;; Pre:     op is a binary operation,
;;          f is a unary operation,
;;          u is some value that is valid as the first argument to op,
;;          x = (x1 x2 ... xN) is a list such that (f x1), (f x2)... are valid
;;          second arguments to op
;; Value:   u!(f x1)!(f x2)!...!(f xN) where a!b = (op a b)
;;          computed from left to right

(define (mapreduce op f u x)
    (if (null? x)
        u
        (mapreduce op f (op u (f car (x))) (cdr x))
    )
)

