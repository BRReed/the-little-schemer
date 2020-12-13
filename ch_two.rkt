#lang racket
; The Little Schemer
;    4th Ed.
(define (atom? x)
  (and (not (pair? x)) (not (null? x))))
