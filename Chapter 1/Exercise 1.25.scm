;理论上正确

;但是expmod每次运算都对乘幂做了remainder操作，数值不超过n；不但加快了remainder计算还避免溢出降
;而先fast-exp再remainder可能会求出一个很大的溢出的值
;两者用时差距很大

#lang sicp
(define (expmod1 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod1 base (/ exp 2) m))
                                m))

        (else (remainder (* base (expmod1 base (- exp 1) m))
                    m))))
(define (square n)
  (* n n))
(expmod1 100000000 100000000 3)

(define (fast-exp b n)
  (exp-iter b n 1))
(define (exp-iter b n product)
  (cond ((= n 0) product)
        ((even? n) (exp-iter (square b) (/ n 2) product))
        ((odd? n) (exp-iter b (- n 1) (* product b)))))
(define (expmod2 base exp m)
    (remainder (fast-exp base exp) m))
(expmod2 100000000 100000000 3)