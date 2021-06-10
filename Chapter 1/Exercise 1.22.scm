#lang sicp
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor) (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1))))) (define (divides? a b) (= (remainder b a) 0))
(define (square n)
  (* n n))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes-iter n times)
  (cond ((prime? n) (search-for-primes-iter (+ n 1) (- times 1)))
        ((> times 0) (search-for-primes-iter (+ n 1) times))))

(define (search-for-primes n)
  (let ((start-time (runtime)))
    (search-for-primes-iter n 3)
    (- (runtime) start-time)))

(search-for-primes 1000) ;21
(search-for-primes 10000) ;60
(search-for-primes 100000) ;145
(search-for-primes 1000000) ;323
;sqrt(10)的值大概是3，并不严格按照这个上升