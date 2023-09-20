(import (rnrs))

(define (collatz n)
  (if (= 1 n)
    0
    (1+ (collatz (if (even? n) (/ n 2) (+ 1 (* 3 n)))))))
