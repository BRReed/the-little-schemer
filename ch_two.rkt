#lang racket
; The Little Schemer
;    4th Ed.
(define (atom? x)
  (and (not (pair? x)) (not (null? x))))

(define (lat? l)
  (cond
    ((null? l) #t)
    ((atom? (car l)) (lat? (cdr l)))
    (else #f)))
  

(lat? '(Jack Sprat could eat no chicken fat))
; true bcause each s-exp in list is an atom
(lat? '((Jack) Sprat could eat no chicken fat))
; false because (jack) is a list
(lat? '(Jack (Sprat could) eat no chicken fat))
; false because cdr of list has a list in it
(lat? '())
; true because it is an empty list
; True or False a lat is a list of atoms (true, but also an empty list)
