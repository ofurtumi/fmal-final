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

;; Notkun: (foldl f u x)
;; Fyrir: u er gildi,
;; x=(x1 ... xN) er listi gilda,
;; f er tvíundarfall.
;; Gildi: (f (f ... (f (f u x1) x2)...) xN)
(define (foldl f u x)
    (if (null? x)
        u
        (foldl f (f u (car x)) (cdr x))
    )
)

;; Notkun: (foldr f x u)
;; Fyrir: u er gildi,
;; x=(x1 ... xN) er listi gilda,
;; f er tvíundarfall.
;; Gildi: (f x1 (f x2 (f ... (f xN u)...)))
(define (foldr f x u)
    (if (null? x)
        u
        (f (car x) (foldr f (cdr x) u))
    )
)

(foldl (lambda (i j) (* i j)) 2 (list 1 2 3 4))
(foldl (lambda (i j) (* i j)) 1 (list 1 2 4 5))
(foldr (lambda (i j) (* i j)) (list 1 2 3 4) 2)
(foldr (lambda (i j) (* i j)) (list 1 2 4 5) 1)