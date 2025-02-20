; Q1
(define (ascending? s) 
    (if
        (<= (length s) 1) 
        #t
        (let 
            ((x (car s)) (y (car(cdr s))) )
            (if (<= x y) (ascending? (cdr s)) #f)
        )    
    ))


; Q2
(define (my-filter pred s) 
    (cond 
        ((null? s) '())
        ((pred (car s))  (cons (car s)  (my-filter pred (cdr s))))
        (else (my-filter pred (cdr s)))
        ))


; Q3
(define (interleave lst1 lst2) 
    (cond 
    ((and (null? lst1) (null? lst2)) nil)
    ((null? lst1) lst2)
    ((null? lst2) lst1)
    (else 
        (cons (car lst1) 
            (cons (car lst2)
                (interleave (cdr lst1) (cdr lst2)) )))
    ))



; Q4
(define (no-repeats s) 
    (if (null? s) s
        (cons (car s)
            (no-repeats (filter (lambda (x) (not (= (car s) x))) (cdr s))))
        ))
