; Exercise 1.2
(/ (+ 5
      4
      (- 2(-  3  (+ 6 (/ 4 5)))) )
   (* 3
      (- 6 2)
      (- 2 7)))

; Exercise 1.3. Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
(define (squareBiggerNums n1 n2 n3) (
                                     cond ((and (< n1 n2) (< n1 n3)) (+ (* n2 n2) (* n3 n3)))
                                     ((> n2 n3) (+ (* n1 n1) (* n2 n2)))
                                     (else (+ (* n1 n1) (* n3 n3)))))
; Official solution
(define (square x) (* x x))
(define (sumsquares x y) (+ (square x) (square y)))
(define (sqsumlargest a b c)
  (cond
    ((and (>= a c) (>= b c)) (sumsquares a b))
    ((and (>= b a) (>= c a)) (sumsquares b c))
    ((and (>= a b) (>= c b)) (sumsquares a c))))

; Exercise 1.4. Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b)) ; The if statement returns either a - or a +, which is then applied to the operands.
; (a + |b|)
; A plus the absolute value of B

; Exercise 1.5. Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

; Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)

; Using applicative-order evaluation, the evaluation of (test 0 (p)) never terminates, because (p) is infinitely expanded to itself:
; (test 0 (p))
; (test 0 (p))
; (test 0 (p))
; ...

; Using normal-order evaluation, the expression evaluates, step by step, to 0:
; (test 0 (p))
; (if (= 0 0) 0 (p))
; (if #t 0 (p))
; 0



