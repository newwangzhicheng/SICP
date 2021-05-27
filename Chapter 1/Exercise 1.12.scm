#lang sicp
(define (pascal x y)
  (cond ((or (= y 1) (= x y)) 1)
        (else (+ (pascal (- x 1) (- y 1))
                 (pascal (- x 1) y)))))
(pascal 5 3)