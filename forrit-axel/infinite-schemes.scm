;;-Skilgreiningar----------------------
(define (-1+ n) (- n 1))
(define (1+ n) (+ n 1))
 
(define-syntax cons-stream
  (syntax-rules ()
    ((cons-stream head tail)
     (cons head (delay tail)))))
 
(define stream-car car)
(define (stream-cdr s) (force (cdr s)))
;; ------------------------------------
 

;;-- Hjálparföll-----------------------

;; Notkun: einn
;; Gildi:  straumurinn [1 1 ...]
(define einn
    (letrec ((temp (cons-stream 1 temp)))
      temp
    )
)
 
;; Notkun: (stream-map f s)
;; Fyrir:  f er einundaraðgerð, s=[s1 s2 ...] er óendanlegur
;;         straumur viðfanga í f
;; Gildi:  óendanlegi straumurinn [(f s1) (f s2) ...]
(define (stream-map f s)
    (cons-stream (f (stream-car s)) (stream-map f (stream-cdr s)))
)
 
 
;; Notkun: (stream-binop f x y)
;; Fyrir:  f er tvíundaraðgerð, x=[x1 x2 ...] og y=[y1 y2 ...]
;;         eru óendanlegir straumar fyrri og seinni viðfanga í f
;; Gildi:  óendanlegi straumurinn [(f x1 y1) (f x2 y2) ...]
(define (stream-binop + x y)
    (cons-stream 
        (+ (stream-car x) (stream-car y))
        (stream-binop + (stream-cdr x) (stream-cdr y))
    )
)
 
;; Notkun: heil
;; Gildi:  óendanlegi straumurinn [1 2 3 ...]
(define heil
    (letrec ((temp (cons-stream 1 (stream-map 1+ temp))))
        temp
    )
)
 
;; Notkun: (stream-list x n)
;; Fyrir:  x=[x1 x2 ...] er straumur af lengd a.m.k. n, n er heiltala >=0
;; Gildi:  listinn (x1 x2 ... xn)
(define (stream-list x n)
	(if (= n 0)
		'()
		(cons (stream-car x) (stream-list (stream-cdr x) (-1+ n)))
	)
)
 
;; Notkun: fibo
;; Gildi:  óendanlegur straumur Fibonacci talna: [1 1 2 3 5 8 ...]
(define fibo
	(cons-stream 1
	    (cons-stream 1
            (stream-binop + fibo (stream-cdr fibo))
        )
    )
)




;; Use: (cornerstream s n)
;; Pre:  s is an infinite stream of
;;         infinite streams,
;;         s=[[x11 x12 ...],[x21 x22 ...] ...].
;;         n is an integer, n>=0.
;; Value:  The list
;;         ((x11 x12 ... x1n)
;;         (x21 x22 ... x2n)
;;         ...
;;         (xn1 xn2 ... xnn))
(define (cornerstream s n)
  (stream-list (stream-map (lambda (s) (stream-list s n)) s) n))


;; Notkun: (mulstreams x y)
;; Fyrir:   x og y eru óendanlegir straumar talna,
;;          x=[x1 x2 x3 ...].
;;          y=[y1 y2 y3 ...].
;; Gildi:   Óendanlegur straumur óendanlegra strauma
;;          talna sem er
;;          [[x1*y1 x2*y1 x3*y1 ...]
;;           [x1*y2 x2*y2 x3*y2 ...]
;;           [x1*y3 x2*y3 x3*y3 ...]
;;           .
;;           .
;;           .
;;          ]
 
(define (mulstreams x y)
    (cons-stream 
        (stream-map (lambda (s) (* (stream-car y) s)) x) 
        (mulstreams x (stream-cdr y))
    )
)

;; Notkun: (cross a b) 
;; Fyrir:  a og b eru óendanlegir straumar, 
;;         a=[a1 a2 a3 ...] 
;;         b=[b1 b2 b3 ...] 
;; Gildi:  Óendanlegi straumurinn af 
;;         óendanlegum straumum af tveggja 
;;         staka listum 
;;           [[(a1 b1) (a1 b2) (a1 b3) ...] 
;;            [(a2 b1) (a2 b2) (a2 b3) ...] 
;;            [(a3 b1) (a3 b2) (a3 b3) ...] 
;;            . 
;;            . 
;;            . 
;;           ] 
;;         sem inniheldur nokkurs konar 
;;         krossmargfeldi a og b.

(define (cross a b)
    (cons-stream
        (stream-map (lambda (s) (cons (stream-car a) s)) b)
        (cross (stream-cdr a) b)
    )
)