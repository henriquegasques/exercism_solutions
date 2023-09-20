(import (rnrs))

(define (binary-search array target)
  (search array target 0 (- (vector-length array) 1)))

(define (search array target from to)
  (if (> from to)
    'not-found
    (let ((middle (floor (/ (+ from to) 2))))
        (let ((middle-elem (vector-ref array middle)))
            (if (= middle-elem target)
                middle
                (if (< target middle-elem)
                    (search array target from (- middle 1))
                    (search array target (+ middle 1) to)))))))

