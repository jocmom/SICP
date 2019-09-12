;; Exercise 1.6.  Alyssa P. Hacker doesn't see why if needs to be
;; provided as a special form. ``Why can't I just define it as an
;; ordinary procedure in terms of cond?'' she asks. Alyssa's friend
;; Eva Lu Ator claims this can indeed be done, and she defines a new
;; version of if:

#lang sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; helper for square root function
(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; Square Roots by Newton’s Method with new-if
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; What happens when Alyssa attempts to use this to compute square roots? Explain. 

;; ANSWER ------------------------------------------------------------
;;
;; "if" is a special form in Scheme, meaning that the interpreter
;; treats it special.  It is not a function, so applicative order
;; evaluation does not apply in its case.
;; To evaluate an if expression, the interpreter starts by evaluating
;; the ⟨predicate⟩ part of the expression. If the ⟨predicate⟩ evaluates
;; to a true value, the interpreter then evaluates the ⟨consequent⟩ and
;; returns its value. Otherwise it evaluates the ⟨alternative⟩ and
;; returns its value.
;;
;; Unfortunately, Alyssa's new-if is a function, and the applicative
;; order rules say that the sqrt-iter recursion happens before the
;; new-if has a chance to choose between the true/false branches.