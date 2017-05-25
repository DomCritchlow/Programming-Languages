;; Dominic Critchlow
;; Assignment 3 Scheme

;;#1
(define (letterGrade x )
  (cond
    ((>= x 100) (display "Error: Out of Range "))
    ((>= x 90) 'A)
    ((>= x 80) 'B)
    ((>= x 70) 'C)
    ((>= x 60) 'D)
    ((>= x 0 ) 'F)
    (else (display "Error: Out of Range "))
  )
)
;;#2
(define (countdown x)
  (do ((i x (- i 1)))
      ((= i 0) i)
      (display i)
      (display "\n"))
  (display "Blastoff!")
)

;;#3  Not done
(define (eval-poly item mlist)
  (if (null? (cdr mlist))
    (car mlist)
    (+ (car mlist) (* item (eval-poly item (cdr mlist))))
  )
)


;;#4
(define (eval-poly-tail x plist )
  (eval-poly-tail-helper x plist 0 0)
)


(define (eval-poly-tail-helper x mlist tot exp1)
  (if (null? mlist)
    tot
    (if (eq? (car mlist) 0)
      (eval-poly-tail-helper x (cdr mlist) tot (+ exp1 1))
      (eval-poly-tail-helper x (cdr mlist) (+ tot (* (car mlist) (expt x exp1))) (+ exp1 1))
    )
  )
)


;;#5
(define (split mlist)
  (cond
    ((null? mlist) (list '() '()))
    ((null? (cdr mlist)) (list mlist '()))
    (else
      (list (cons (car mlist ) (car  (split (cddr mlist))))
            (cons (cadr mlist) (cadr (split (cddr mlist))))
      )
    )
  )
)

;;#6
(define (merge list1 list2)
  (cond
        ((null? list1) list2)
        ((null? list2) list1)
        (else
          (if (< (car list1) (car list2))
              (cons (car list1) (merge (cdr list1) list2 ))
              (cons (car list2) (merge (cdr list2) list1 ))
          )
        )
  )
)

;;#7
(define (mergesort mlist)
  (cond
    ((null? mlist) '())
    ((null? (cdr mlist)) mlist)
    (else
      (merge (mergesort (car (split mlist))) (mergesort (cadr (split mlist))))
    )
  )
)
