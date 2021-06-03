(gcd 206 40)
(gcd 40 (remainder 206 40)) ;判断(remainder 206 40)的值为6，remainder+1
(gcd (remainder 206 40) (remainder 40 (remainder 206 40))) 
;判断(remainder 40 (remainder 206 40))的值为4，remainder+2
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;判断(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))的值为2，remainder+4
;下一次判断的值为0，remainder+7 输出结果(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) remadiner+4
;所以正则序remainder总共执行1+2+4+7+4=18次

;应用序执行4次