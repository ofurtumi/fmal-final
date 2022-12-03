#!/usr/racket/bin/racket
#lang racket

 |||||||||||||||||||||||||||||||||
 ||    __    sjomli.is    __    ||
 ||  _/  |_ __ __  _____ |__|   ||
 ||  \   __\  |  \/     \|  |   ||
 ||   |  | |  |  /  Y Y  \  |   ||
 ||   |__| |____/|__|_|__/__|   ||
 ||                             ||
 |||||||||||||||||||||||||||||||||

;; Usage:   (help z a b w)
;; Pre:     z is a list, w is a list of numbers
;;          a and b are numbers
;; Value:   A list that contains all the values in z
;;          plus all the values v in w such that a <= v <= b

(define (help z a b w))

;; Usage:   (between x a b)
;; Pre:     x is a list of numbers,
;;          a and b are numbers.
;; Value:   A list that contains all the numbers v in x
;;          such that a <= v <= b

(define (between x a b))