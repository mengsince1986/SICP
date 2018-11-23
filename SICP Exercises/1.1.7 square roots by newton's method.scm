; Newton’s method

;*******************dependency procedures*******************
; the absolute value procedure
(define (abs x)
  (if (< x 0)
      (- x)
      x))

; the square procedure
(define (square x)
  (* x x))

;*********************sqrt-iter procedure*******************
;We start with a value for the radicand (the number whose square root we are trying to compute) and a value for the guess.
;If the guess is good enough for our purposes, we are done;
;if not, we must repeat the process with an improved guess.
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

;***********************improve procedure*******************
; A guess is improved by averaging it with the quotient of the radicand and the old guess:
(define (improve guess x)
  (average guess (/ x guess)))
; where
(define (average x y)
  (/ (+ x y) 2))

;*******************good-enough? procedure******************

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; We will usually give predicates names ending with question marks, to help us remember that they are predicates. This is just a stylistic convention. As far as the interpreter is concerned, the question mark is just an ordinary character.

;***********************sqrt procedure**********************

; Test
(sqrt 36)
(sqrt 0.001)
