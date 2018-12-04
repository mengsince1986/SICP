; Exercise 1.11-1.13

; Exercise 1.11. A function `f` is defined by the rule that
f(n) = n if n<3
; and
f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3
; Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; recursive process solution:
(define (f n)
  (cond ((< n 3) n)
        ((>= 3)
         (+ (f (- n 1))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3)))))))

; iterative process solution:
(define (f n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))

(define (f-iter a b c count)
  (if (< count 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))

; alternative iterative process solution:
(define (f n)
  (if (< n 3)
      n
      (f-iter n 2 0 1 2)))

(define (f-iter n
                i
                f-of-i-minus-2
                f-of-i-minus-1
                f-of-i)
  (if (= i n)
      f-of-i
      (f-iter n
              (+ i 1)
              f-of-i-minus-1
              f-of-i
              (+ f-of-i
                 (* 2 f-of-i-minus-1)
                 (* 3 f-of-i-minus-2)))))

; Exercise 1.12. The following pattern of numbers is called Pascal’s triangle.

;    1
;   1 1
;  1 2 1
; 1 3 3 1
;1 4 6 4 1

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.35 Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

; Solution:
(define (pascal r c)
  (if (or (= c 1) (= r c))
      1
      (+ (pascal (- r 1) (- c 1))
         (pascal (- r 1) c))))

; Exercise 1.13. Prove that Fib(n) is the closest integer to φⁿ/√5, where
;      φ = (1+√5)/2 ≈ 1.6180339887.
; Hint: Let
;      ψ = (1-√5)/2 = 1-φ = -(1/φ) ≈ -0.6180339887.
; Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that
; Fib(n) = (φⁿ-ψⁿ)/(φ-ψ) = (φⁿ-ψⁿ)/√5
