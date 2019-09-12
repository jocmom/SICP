;; Exercise 1.7.  The good-enough? test used in computing square roots
;; will not be very effective for finding the square roots of very
;; small numbers. Also, in real computers, arithmetic operations are
;; almost always performed with limited precision. This makes our test
;; inadequate for very large numbers. Explain these statements, with
;; examples showing how the test fails for small and large numbers. An
;; alternative strategy for implementing good-enough? is to watch how
;; guess changes from one iteration to the next and to stop when the
;; change is a very small fraction of the guess. Design a square-root
;; procedure that uses this kind of end test. Does this work better
;; for small and large numbers?

;; ANSWER ------------------------------------------------------------

;; Small numbers will not be very accurate. Large numbers may cause
;; the algorithm to iterate more often than would be strictly necessary.
;;
;; Making the epsilon relative to the guess corrects both of these
;; issues.

#lang sicp

;; helper for square root function
(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

;; new good-enough? version
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (/ guess 10000)))

;; Square Roots by Newton’s Method with new-if
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))