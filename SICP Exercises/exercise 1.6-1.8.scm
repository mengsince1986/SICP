; Exercises 1.6-1.8

; Exercise 1.6.
; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. ‘‘Why can’t I just define it as an ordinary procedure in terms of cond?’’ she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5)
;5
(new-if (= 1 1) 0 5)
;0

; Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; What happens when Alyssa attempts to use this to compute square roots? Explain.

; The default if statement is a special form which means that even when an interpreter follows applicative substitution, it only evaluates one of it's parameters- not both. However, the essence of the newly created new-if is a normal procedure so it applies the applicative-order evaluation and evaluate all its sub-expressions before running the cond expression. Hence, it results in an infinite recursion by calling `(sqrt-inter (improve guess x) x)`.

; new-if does not use normal order evaluation, it uses applicative order evaluation. That is, the interpreter first evaluates the operator and operands and then applies the resulting procedure to the resulting arguments. As with Excercise 1.5, this results in an infinite recursion because the else-clause is always evaluated, thus calling the procedure again ad infinitum.

; The if statement is a special form and behaves differently. if first evalutes the predictate, and then evaluates either the consequent (if the predicate evalutes to #t) or the alternative (if the predicate evalues to #f). This is key difference from new-if -- only one of the two consequent expressions get evaluated when using if, while both of the consequent expressions get evaluated with new-if.

; **********************************************************

; Exercise 1.7.
; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

; original good enough procedure
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; The absolute tolerance of 0.001 is significantly large when computing the square root of a small value. For example, on the system I am using, (sqrt 0.0001) yields 0.03230844833048122 instead of the expected 0.01 (an error of over 200%).

; On the other hand, for very large values of the radicand, the machine precision is unable to represent small differences between large numbers. The algorithm might never terminate because the square of the best guess will not be within 0.001 of the radicand and trying to improve it will keep on yielding the same guess [i.e. (improve guess x) will equal guess]. Try (sqrt 1000000000000) [that's with 12 zeroes], then try (sqrt 10000000000000) [13 zeroes]. On my 64-bit intel machine, the 12 zeroes yields an answer almost immediately whereas the 13 zeroes enters an endless loop. The algorithm gets stuck because (improve guess x) keeps on yielding 4472135.954999579 but (good-enough? guess x) keeps returning #f.

; If good-enough? uses the alternative strategy (a relative tolerance of 0.001 times the difference between one guess and the next), sqrt works better both for small and large numbers.

; Modified version to look at difference between iterations
(define (good-enough? guess x)
  (<= (abs (- (improve guess x) guess))
      (* guess .001)))

;;Alternate version, which adds an "oldguess" variable to the main function.
(define (sqrt-iter guess oldguess x)
  (if (good-enough? guess oldguess)
      guess
      (sqrt-iter (improve guess x) guess
                 x)))

(define (good-enough? guess oldguess)
  (<= (abs (- guess oldguess))
      (* guess 0.001)))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

; **********************************************************

; Exercise 1.8. Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value

(/ (+ (/ x y*y) 2y) 3)

; Use this formula to implement a cube-root procedure analogous to the square-root procedure.

(define (cubt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubt-iter (improve guess x) x)))

; improve procedure

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

; good-enough procedure

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess .001)))

; the absolute value procedure
(define (abs x)
  (if (< x 0)
      (- x)
      x))

; the square procedure
(define (square x)
  (* x x))

; Finally, we need a way to get started. For instance, we can always guess that the square root of any number is 1:
(define (cubt x)
  (cubt-iter 1.0 x))
