; Exercises 1.1-1.5

; Exercise 1.1 Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.
10 ;10
(+ 5 3 4) ;12
(- 9 1) ;8
(/ 6 2) ;3
(+ (* 2 4) (- 4 6)) ;6

;----------------------------
(define a 3) ;a = 3
(define b (+ a 1)) ;b = 4

(+ a b (* a b)) ;19

(= a b) ;#f

(if (and (> b a) (< b (* a b))) ;#t
    b ;4
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a)) ;16
      (else 25))

(+ 2 (if (> b a) b a)) ;6

(* (cond ((> a b) a) ;16
         ((< a b) b) ;4
         (else -1))
   (+ a 1)) ;4

;**********************************************************

; Exercise 1.2 Translate the following expression into prefix form.
; 5+4+(2−(3−(6+4/5))) / 3(6−2)(2−7)
(/ (+ 5
      4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

;**********************************************************

; Exercise 1.3. Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
(define (square x) (* x x))
(define (sumSquares x y) (+ (square x) (square y)))
(define (squareSumLarger a b c)
  (cond
    ((and (< a b) (< a c)) (sumSquares b c))
    ((> b c) (sumSquares a b))
    (else (sumSquares a c))))

;**********************************************************

; Exercise 1.4. Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; The if statement returns either a - or a +, which is then applied to the operands.
; (a + |b|)
; A plus the absolute value of B

;**********************************************************

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
