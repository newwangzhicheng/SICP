#lang sicp
(define (yh-r n)
  (cond ((< n 3) n)
        ((+ (yh-r (- n 1))
           (* 2 (yh-r (- n 2)))
           (* 3 (yh-r (- n 3)))))))
(define (yh-i n)
  (if (< n 3) n
      (yh-i-iter 2 1 0 3 n)))
(define (yh-i-iter v1 v2 v3 c n)
    (cond ((> c n) v1)
          ((yh-i-iter (+ v1 (* 2 v2) (* 3 v3)) v1 v2 (+ c 1) n))))