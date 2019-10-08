
(define (f n)
  (define (f-iter count f1 f2 f3)
    (if (= n count)
        f1
        (f-iter (+ count 1) (+ f1 (* 2 f2) (* 3 f3)) f1 f2)))
  (if (< n 3)
      n
      (f-iter 3 4 2 1)))

