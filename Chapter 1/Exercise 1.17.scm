#lang sicp
(define (double n)
  (+ n n))
(define (halve n)
  (/ n 2))
; 自己写
(define (* a b)
  (multi-iter a b a 0))
(define (multi-iter a b n product)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= n 0) product)
        ((even? n) (multi-iter a (double b) (halve n) product))
        ((odd? n) (multi-iter a b (- n 1) (+ product b)))))

; 答案
(define (multi a b)
  (cond ((= b 0) 0)
        ((even? b) (double (multi a (halve b))))
        ((odd? b) (+ a (multi a (- b 1))))))