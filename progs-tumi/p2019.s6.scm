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

; Skrifið halaendurkæmt fall zipMapRev í Scheme, CAML, Morpho
; eða Haskell sem tekur tvö viðföng sem eru jafnlangir listar. Fyrra
; viðfangið skal vera listi einundarfalla, 𝑓1, ... , 𝑓𝑛, og seinna viðfangið
; skal vera listi gilda 𝑥1, ... , 𝑥𝑛 þannig að sérhvert 𝑥𝑖 er löglegt viðfang
; í samsvarandi 𝑓𝑖. Fallið skal skila viðsnúnum lista gildanna sem
; föllin skila þegar þeim er beitt á gildin, þ.e. lista með gildunum
; 𝑓𝑛(𝑥𝑛), ... , 𝑓1(𝑥1), í þeirri röð. Notið einungis einfaldar aðgerðir svo
; sem car, cdr, cons, null?. Í Morpho má nota lykkju, með fastarðingu
; lykkju.
; Write a tail-recursive function zipMapRev in Scheme, CAML,
; Morpho or Haskell that takes two arguments that are equally long
; lists. The first argument shall be a list of unary functions, 𝑓1, ... , 𝑓𝑛,
; and the second shall be a list of values 𝑥1, ... , 𝑥𝑛 such that each 𝑥𝑖
; is a valid argument for the corresponding 𝑓𝑖. The function shall
; return a reversed list of the values returned by the functions when
; applied to the values, i.e. a list with the values 𝑓𝑛(𝑥𝑛), ... , 𝑓1(𝑥1), in
; that order. Use only simple operations such as car, cdr, cons and
; null?. In Morpho a loop may be used, with a loop invariant.

; Notkun:   (helper output vals funcs)
; Fyrir:    funcs er listi af einundafalla
;           vals er listi af gildum sem eru lögleg fyrir föllin í funcs
;           output er listi af gildum sem koma út úr funcs 
;           með viðeigani vals gildi
; Eftir:    skilar output, lista í öfugri röð miðað við funcs af útkomum
;           úr funcs á öll vals
(define (helper output vals funcs)
    (if (null? vals)
        output
        (helper (cons ((car funcs) (car vals)) output) (cdr vals) (cdr funcs))
    )
)

; Notkun:   (funky f x)
; Fyrir:    f er listi einundafalla
;           x er listi gilda sem eru lögleg sem inntak í f
; Eftir:    fallið skilar lista, í öfugri röð við inntakslistann, 
;           af útkomum úr föllum f á stök x
(define (funky f x)
    (helper '() x f)
)
