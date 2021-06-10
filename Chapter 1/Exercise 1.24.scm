#lang sicp
(define (expmod base exp m) (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (square n)
  (* n n))
(define (next-odd n)
  (cond ((= n 2) 3)
        (else (+ n 2))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes-iter n times)
  (cond ((fast-prime? n 10) (search-for-primes-iter (next-odd n) (- times 1)))
        ((> times 0) (search-for-primes-iter (next-odd n) times))))

(define (search-for-primes n)
  (let ((start-time (runtime)))
    (search-for-primes-iter n 3)
    (- (runtime) start-time)))

(search-for-primes 1001) ;84
(search-for-primes 10001) ;120
(search-for-primes 100001) ;127
(search-for-primes 1000001) ;183

;如果检测一个次数的设为固定值，次数费马小定律的检测时间就只和算a^n时间相关了