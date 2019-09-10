#lang sicp

(define (square x) (* x x))

(define (sum-of-square x y)
  (+ (square x) (square y)))
  

(define (sum-of-two-largest-squares x y z)
  (cond ((and (> x y) (> z y))
         (sum-of-square x z))
        ((and (> x y) (> y z))
         (sum-of-square x y))
        (else (sum-of-square y z))))
  