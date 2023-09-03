(define (square x) (* x x))

(define (sum-of-squares x y)
    (+ (square x) (square y))
)

(define (f a)
    (sum-of-squares (+ a 1) (* a 2))
)

(define (abs x)
    (cond ((> x 0) x)
          ((= x 0) 0)
          ((< x 0) (- x))
    )
)
(define (abs x)
    (cond ((< x 0) (- x))
          (else x)
    )
)
(define (abs x)
    (if (< x 0)
        (- x)
        x
    )
)

(define (>= x y)
    (or (> x y) (= x y))
)
(define (>= x y)
    (not (< x y))
)

; < Exercise

; # 1.1
; ;value: 10
; ;value: 12
; ;value: 8
; ;value: 3
; ;value: 6
; ;value: a
; ;value: b
; ;value: 19
; ;value: #f
; ;value: 4
; ;value: 16
; ;value: ６
; ;value: 16

; # 1.2
(/
    (+ 5 4
        (- 2
            (- 3
                (+ 6
                    (/ 4 5)
                )
            )
        )
    )
    (* 3
        (- 6 2)
        (- 2 7)
    )
)

; # 1.3
(define (min x y)
    (if (< x y)
        x
        y
    )
)
(define (max x y)
    (if (> x y)
        x
        y
    )
)
(define (sum-squares-larger2 x y z)
    (-
        (+ (square x) (square y) (square z))
        (square (min (min x y) z))
    )
)

; # 1.4
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b)
)

; # 1.5
(define (p) (p))
(define (test x y)
    (if (= x 0)
        0
        y
    )
)
; normal-order evaluation return ;value: 0
; applicative-order evaluation loop will not return

; Exercise >

(define (average x y)
    (/ (+ x y) 2)
)

(define (improve guess x)
    (average guess (/ x guess))
)

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001)
)

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (sqrt x)
    (sqrt-iter 1.0 x)
)


; < Exercise

; # 1.6
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)
    )
)

(define (new-sqrt-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (new-sqrt-iter (improve guess x) x)
    )
)
; 由于先替换再计算，导致 new-if 会出现 maximum recursion depth exceeded 的问题

(define (new-sqrt x)
    (new-sqrt-iter 1.0 x)
)

; # 1.7
(define (new-good-enough? guess x)
    (< (abs (- (improve guess x) guess)) 0.000001)
)

(define (new-sqrt-iter guess x)
    (if (new-good-enough? guess x)
        guess
        (new-sqrt-iter (improve guess x) x)
    )
)

(define (new-sqrt x)
    (new-sqrt-iter 1.0 x)
)

; # 1.8
(define (cube-improve guess x)
    (/
        (+
            (* 2 guess)
            (/ x (square guess))
        )
        3
    )
)

(define (cube-good-enough? guess x)
    (< (abs (- (cube-improve guess x) guess)) 0.000001)
)

(define (cube-iter guess x)
    (if (cube-good-enough? guess x)
        guess
        (cube-iter (cube-improve guess x) x)
    )
)

(define (cube x)
    (cube-iter 1.0 x)
)

; Exercise >

(define (cube x)
    (define (cube-improve guess)
        (/ (+ (* 2 guess) (/ x (square guess))) 3)
    )
    (define (cube-good-enough? guess)
        (< (abs (- (cube-improve guess) guess)) 0.000001)
    )
    (define (cube-iter guess)
        (if (cube-good-enough? guess)
            guess
            (cube-iter (cube-improve guess))
        )
    )
    (cube-iter 1.0)
)
