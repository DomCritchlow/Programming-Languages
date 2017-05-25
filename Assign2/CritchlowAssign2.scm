; Dominic Critchlow
; Assignment 2
; Scheme Functions

; #1
(define (slope a b)
      (/ (- (cdr b) (cdr a)) (- (car b) (car a)))
)

;#2
(define (square? a)
      (if (integer? (sqrt a)) #t #f )
)

;#3
(define (replace_first item list)
      (cons item (cdr list))
)

;#4
(define (replace_first! item list)
      (if (null? list) '()  (set-car! list item) )
)

;#5
(define (all-odd list)
    (if (null? list)
      #t
      (if (odd? (car list))
        (all-odd (cdr list))
        #f
      )
    )
)

;#6
(define (filter-odd list)
    (if (null? list)
      '()
      (if (odd? (car list))
        (cons (car list) (filter-odd (cdr list)))
        (filter-odd (cdr list))
      )
    )
)

;#7
(define (product list)
  (if (null? list)
    1
    (* (car list) (product (cdr list)))
  )
)

;#8
(define (smallest list)
  (if (null? (cdr list))
    (car list)
    (if (< (car list) (smallest (cdr list)))
      (car list)
      (smallest (cdr list))
    )
  )
)

;#9
(define (remove-first item list)
  (if (null? list)
    '()
    (if (equal? item (car list))
      (cdr list)
      (cons (car list)(remove-first item (cdr list)))
    )
  )
)

;#10
(define (selection-sort list)
  (if (null? list)
    '()
    (cons (smallest list) (selection-sort (remove-first (smallest list) list)))
  )
)
