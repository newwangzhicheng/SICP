#lang sicp
(define (square x)
  (* x x))
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q n)
  (cond ((= n 0) b)
        ((even? n) (fib-iter a
                             b
                             (+ (square p) (square q))
                             (+ (* 2 p q) (square q))
                             (/ n 2)))
        ((odd? n) (fib-iter (+ (* b q) (* a p) (* a q))
                            (+ (* b p) (* a q))
                            p
                            q
                            (- n 1)))))