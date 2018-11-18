; Newton’s method

; Now let’s formalize the process in terms of procedures. We start with a value for the radicand (the number whose square root we are trying to compute) and a value for the guess. If the guess is good enough for our purposes, we are done; if not, we must repeat the process with an improved guess. We write this basic strategy as a procedure:
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

; A guess is improved by averaging it with the quotient of the radicand and the old guess:
(define (improve guess x)
  (average guess (/ x guess)))
; where
(define (average x y)
  (/ (+ x y) 2))

; good enough procedure
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; the absolute value procedure
(define (abs x)
  (if (< x 0)
      (- x)
      x))

; the square procedure
(define (square x)
  (* x x))

; Finally, we need a way to get started. For instance, we can always guess that the square root of any number is 1:
(define (sqrt x)
  (sqrt-iter 1.0 x))
