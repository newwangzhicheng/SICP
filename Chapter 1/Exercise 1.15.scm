;12.15/3 = 4.5 p执行一次 共两个sin4.5
;4.5/3 = 1.5 p执行2次 共4个sin1.5
;1.5/3 = 0.5 p执行4次 共8个sin0.5
;0.5/3 = 0.16667 p执行8次 共16个sin0.16667
;0.16667/3 = 0.05555 p执行16次 共32个sin0.05555
;p执行次数1+2+4+8+16 = 31

;当a*3^(-n) < -0.1 或 a*3^(-n) > 0.1时执行p，其中n时树的深度
;计算得出n<log3(|10a|)即树的深度为ceil(log3(|10a|)
;当n=1时，p执行1次，当n=2时p执行1+2次
;所以执行的占用的时间和空间都为为2^n-1，其中n=ceil(log3(|10a|)


;纠正
;树的深度即执行的次数，所以p执行了5次

;树的深度n=ceil(log3(|10a|)，所以之间和空间复杂度都为O(loga)