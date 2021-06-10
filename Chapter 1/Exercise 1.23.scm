#lang sicp
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-odd test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (square n)
  (* n n))
(define (next-odd n)
  (cond ((= n 2) 3)
        (else (+ n 2))))
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
  (cond ((prime? n) (search-for-primes-iter (next-odd n) (- times 1)))
        ((> times 0) (search-for-primes-iter (next-odd n) times))))

(define (search-for-primes n)
  (let ((start-time (runtime)))
    (search-for-primes-iter n 3)
    (- (runtime) start-time)))

(search-for-primes 1001) ;23 vs 21
(search-for-primes 10001) ;56 vs 60
(search-for-primes 100001) ;111 vs 145
(search-for-primes 1000001) ;319 vs 323

;时间并没有减少一半，原因是一个偶数的只要测试2是不是它的因数，时间小于一个奇数的测试
;所以即使第一个程序多消耗的时间也只是遍历偶数的时间
