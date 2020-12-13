#lang racket
; The Little Schemer
;    4th Ed.
(define (atom? x)
  (and (not (pair? x)) (not (null? x))))


; atoms? defined: a string of characters not beginning with a '(' or ')'
(atom? 'atom)    ;=> t
; yes because 'atom' is a string of characters
(atom? 'turkey)    ;=> t
; yes because 'turkey' is a string of characters
(atom? '1492)    ;=> t
; yes because '1492' is a string of digits
(atom? 'u)    ;=> t
; yes because u is a string of one character
(atom? '*abc$)    ;=> t
; yes because it is a string with special characters

; lists? defined: things* surrounded by '(' and ')' separated by spaces
(pair? '((atom turkey) or)) ;=> arity mismatch or t, read notes
; creates arity mismatch unless enclosed or is contained in () with (atom turkey),
; return true in that case
(car '(a b c))
; a is the car because it is the first atom in the list
(car '((a b c) x y z))
; (a b c) is the car because it is the first s-expression in the list
; car of hotdog => no answer. you can not get the car of an atom
; car of () => no answer. You can not get the car of an empty list
(car '(((hotdogs)) (and) (pickle) relish))
; ((hotdogs)) is the car because it is the first list in the list
(car '(((hotdogs)) (and)))
; (hotdogs) because it is the first list within the first list
;
; LAW OF CAR
; The primitive car is definied only for non-empty lists
;

(cdr '(a b c))
; (b c) because it is the list without car
(cdr '((a b c) x y z))
; (x y z) because the car of the list is the list (a b c)
(cdr '(hamburger))
; () because there is nothing after the car in this list
(cdr '((x) t r))
; (t r) because (x) is the car of the list
; cdr hotdogs => no answer. You can not get the cdr of an atom
; (cdr '()) => no answer yiu can not ask for the cdr of an empty list
;
; LAW OF CDR
; The primitive cdr is defined only for non-empty lists. The cdr if any non empty list is always
; another list.
;
(car (cdr '((b) (x y) ((c)))))
; (x y) because it is the first item of the cdr of the list
(cdr (cdr '((b) (x y) ((c)))))
; (((c))) because it is everything after the car of the cdr of the list
; (cdr (car '(a (b (c)) d))) => no answer because a is an atom and you can't get the car of an atom
; what does car take as an argument: any non-empty list
; what does cdr take as an argument: any non-empty list
(cons 'peanut '(butter and jelly))
; (peanut butter and jelly) because cons adds an atom to the front of a list
(cons '(banana and) '(peanut butter and jelly))
; ((banana and) peanut butter and jelly) because cons adds an s-exp to the start of a list
(cons '((help) this) '(is very ((hard) to learn)))
; (((help) this) is very ((hard) to learn))
; what does cons take as an argument? any s-exp and a list
(cons '(a b (c)) '())
; ((a b (c)))
(cons 'a '())
; (a)
; (cons '((a b c)) 'b => no answer, the second argument to cons must be a list
; (cons 'a 'b) no answer, the second argument to cons must be a list
;
; LAW OF CONS
; The primitive cons takes two arguments. The second argument must be a list. The result is a list
;
(cons 'a (car '((b) c d)))
; (a b) because the car of the list is (b)
(cons 'a (cdr '((b) c d)))
; (a c d) because the cdr of the list is (c d)
; Is it true that the () is a null list => t
(null? '())
(null? (quote ()))
; t because (quote()) is a notation for the null list
(null? '(a b c))
; f because it is not an empty list
; (null? 'spaghetti) no answer because spaghetti is not a list
;
; LAW OF NULL
; The primitive null? is defined only for lists
;
(atom? 'Harry)
; true because Harry is a string of characters
(atom? '(Harry had a heap of apples))
; false because it is a list
; How many arguments does atom? take and what are they?
;  atom? takes one argument and it returns true if the argument is a string of characters only,
;  else false