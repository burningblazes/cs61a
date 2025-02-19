; Q1
(define (over-or-under num1 num2) 
  (cond 
    ((< num1 num2) -1)
    ((= num1 num2) 0)
    (else 1)))


; Q2
(define (make-adder num) 
  (lambda (x) (+ x num) ))


; Q3
(define (composed f g) 
(lambda (x) (f (g x))))


; Q4
(define (repeat f n) 
  (if (= n 1)  f (composed f (repeat f (- n 1))))
  )


; Q5
(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
(if 
  (= (modulo (max a b) (min a b)) 0)
  (min a b)
  (gcd (min a b) (modulo (max a b) (min a b)))
))
