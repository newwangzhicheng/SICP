#lang sicp
(define (cal-cube-root x y last-y)
  (if (good-enough y last-y)
      y
      (cal-cube-root x (improved x y) y)))
(define (good-enough y last-y)
  (if (> (abs (- y last-y)) 0.1)
      #f
      #t))
(define (abs a)
  (if (> a 0)
      a
      (- a)))
(define (improved x y)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))
(define (cube-root x)
  (cal-cube-root x 1 0))