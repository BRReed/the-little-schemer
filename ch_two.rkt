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

(define (member? a l)
  (cond
    ((null? l) #f)
    ((eq? a (car l)) #t)
    (else (member? a (cdr l)))))
     

(lat? '(Jack Sprat could eat no chicken fat))
; true bcause each s-exp in list is an atom
(lat? '((Jack) Sprat could eat no chicken fat))
; false because (jack) is a list
(lat? '(Jack (Sprat could) eat no chicken fat))
; false because cdr of list has a list in it
(lat? '())
; true because it is an empty list
; True or False a lat is a list of atoms (true, but also an empty list)
; how do we determine the answer #t for the application (lat? l)
    ; recursively - if the list is null it is true, if not it checks the
    ; car of l to confirm it is an atom, if it is it sends the cdr of l through
    ; (lat? l) until list is null
; what is the first question asked by (lat? l)
    ; is l a null list
; what is the meaning of the cond-line ((null? l) #t) where l is (bacon and eggs)
    ; l is not a null list, so it moves to the next question
; what is the next question?
    ; is the car of l an atom
; what is the meaning of the line ((atom? (car l) (lat? (cdr l)))
    ; if the car of l (bacon) is an atom, send the cdr of l (and eggs) through lat? again
; what is the meaning of (lat? (cdr l))
    ; it sends l through lat? except for the first s-exp.
; now what is the argument l for lat?
    ; (and eggs)
; what is the next question?
    ; is l (and eggs) an empty list (null? l)
; what is the meaning of (null? l)where null is now (and eggs)
    ; l is not an empty list, so it moves to the next question
; what is the next question?
    ; (atom? (car l)) where l is (and eggs) which evaluates true
; what is the meaning of the line ((atom? (car l) (lat? (cdr l)) in this case
    ; it evaluates if the first s expression in (and eggs) is an atom, and if so
    ; sends the cdr of l (eggs) through lat?
; what is the next question?
    ; (null? l) where l is now equal to eggs
; what is the meaning of the line ((null? l) #t) where l is (eggs)
    ; the list is not empty, so it moves to the next question
; what is the next question?
    ; ((atom? (car (eggs)) (lat? (cdr? (eggs))))
; what is the meaning of (lat? (cdr? (eggs)))?
    ; it sends an empty list through lat
; now what is the argument for lat?
    ; () or an empty list
; what is the meaning of the line ((null? l) #t) where l is ()
    ; return True
; do you remember the question of (lat? l)
    ; is the list l a list of only atoms
; describe what the function lat? does in your own words
    ; recursively goes through each s-expression in a list starting from the
    ; front of the list. if the first s-expression in the list is an atom,
    ; it sends the cdr of the list (or everything in the list except the first s-exp
    ; back through the function, and continues until it either finds an s-exp
    ; that is not an atom, or where l is an empty list
; what is the value of (lat? l) where l is now (bacon (and eggs))
    ; false because (car (cdr l) is a list
; what is the first question?
    ; (null? l)
; what is the meaning of (null? l) where l is (bacon (and eggs))
    ; the list is not empty, so move to the next question
; what is the next question?
    ; (atom? (car l))
; meaning of the line ((atom? (car l)) (lat? (cdr l)))
    ; is bacon an atom (true) ok send ((and eggs)) through the lat function
; what is the meaning of (lat? (cdr l))
    ; send ((and eggs)) through the lat function
; meaning of the line (null? l) where null is ((and eggs))
    ; it is not an empty list, so move to next question
; next question is ((atom? (car ((and eggs))))
    ; which is false, due to the car of l being a list of 2 atoms
; what is the next question?
    ; not a question, but else: false
; what is the meaning of the question else?
    ; else asks if else is true.
; is else true?
    ; yes because else is always true
; why is else the last question?
    ; because we don't need to ask any more questions to arrive at the answer
; why do we not need to ask any more questions?
    ; because weve arrived at our answer
; what is the meaning of the line (else #f)
    ; if the conditions of all other questions arent met, return false
; what is )))
    ; 3 closing parens
; describe how we determined the value #f for (lat? l) where l is (bacon (and eggs))
    ; check if (bacon (and eggs)) is an empty list, it isn't
    ; check if (car (bacon (and eggs))) is true, it is so send (cdr (bacon (and eggs))) through (lat?)
    ; check if ((and eggs)) is an empty list, it isn't
    ; check if (car ((and eggs))) is true, it isn't
    ; check if else is true, it always is, return false
; is (or (null? l1) (atom? l2)) true or false where l1 is () and l2 is (d e f g)
    ; true because l1 is a null list
; is (or (null? l1) (null? l2)) true or false where l1 is (a b c) and l2 is ()
    ; true because l2 is an empty list
; is (or (null? l1) (null? l2)) true or false where l1 is (a b c) and l2 is (atom)
    ; false because neither list is empty
; what does or do
    ; it evaluates 2 variables if either one is true it returns true, if both are false it returns false
; is it true or falsethat a is a member of lat where a is tea and lat is (coffee tea or milk)
    ; true because one of the atoms is tea;
; is (member? a lat) true or false where a is poached and lat is (friend eggs and scrambled eggs)
    ; false because poached is not a member of lat
(member? 'poached '(fried eggs and scrambled eggs))
(member? 'scrambled '(fried eggs and scrambled eggs))
; what is the value of (member? a lat) when a is meat and lat is (mashed potatoes and meat gravy)
    ; true because a is the atom meat and meat is an atom in the lat
; how do we determine the value #t for the member? application
    ; recursively. the first question is null? lat and returns false if it is empty because
    ; the atom a can't be in an empty list, or we have reached the end of the list without
    ; finding a matching member
    ; the second question is the atom a equal to the car of l, if this is true we return true
    ; otherwise we move on to the last question else, which is always true, and we call member?
    ; with the member a staying the same and the list l with the car removed (cdr l)
;
; THE FIRST COMMANDMENT
; Always ask null? as the first question in expressing any function
;
; what is the meaning of the line ((null? lat #f) where lat is (mashed potatoes and meat gravy)
    ; the lat is not empty, so we move on to the next question. if it were empty there wouldnt be
    ; a reason to ask any more questions
; what is the next question
    ; does the atom a equal the car of l. * my function is written differently from the book,
    ; so my answers are going to differ slightly for the specifics of the member functions
; the next question is
    ; else; in which we call the function again by limiting the new lat to the cdr of current lat
; is (eq? a (car lat)) true or false where a is meat and lat is (mashed potatoes and meat gravy)
    ; false, the value of (car lat) is (mashed)
; what is the second question of or?
    ; in the books case it is the call to the function which i took care of in my separated else func
; now what are the arguments of member?
    ; a stays the same as meat, and lat gets reduced to (potatoes and meat gravy)
; what is the next question?
    ; is the lat null?
; is (null? lat) true or false where lat is (potatoes and meat gravy)
    ; false because it is not an empty list
; what do we do now?
    ; in my function - ask if a meat is equal to (car lat) potatoes
; then we ask else, which is always true,
    ; in my function - calls the member? function again with lat limited to (cdr lat)
; what is the meaning of (or (eq? (car lat) a) (member? a (cdr lat)))
    ; if the car of lat is not equal to the atom a, call the member? function where a stays the same
    ; and lat is shortened to the cdr of lat
; is a equal to the car of lat
    ; no
; so what do we do next?
    ; call the member? function again with a staying the same and lat becoming equal to the cdr of lat
; now what are the arguments of member?
    ; a is meat and lat is (and meat gravy)
; what is the next question?
    ; is lat null?
; what do we do now?
    ; in my function ask if a, meat, is equal to the car of lat, and
    ; in the books function it is else
; what is the value of (or eq? (car lat) a) (member? a (cdr lat)))
    ; the value of (member? a (cdr lat))
; why?
    ; because the car of lat does not equal a
; what do we do now?
    ; ask if lat is null (recur - refer to the function with new arguments)
; what are the new arguments?
    ; a is still meat, lat is now (meat gravy)
; what is the next question
    ; ask if lat is null
; what do we do now
    ; in my function ask if a is equal to the car of lat, which in this case is true
; what is the value of (or (eq? (car lat) a) (member? a (cdr lat)))
    ; true
; what is the value of (or (eq? (car lat) a) (member? a (cdr lat))) where a is meat and lat is
; (meat gravy)
    ; true because the car of lat is meat and a is meat
; what is the value of (or (eq? (car lat) a) (member? a (cdr lat))) where a is meat and lat is
; (and meat gravy)
    ; true because the answer to (member? a (cdr lat)) is true
; what is the value of (or (eq? (car lat) a) (member? a (cdr lat))) where a is meat and lat is
; (potatoes and meat gravy
    ; true because the answer to (member? a (cdr lat)) is true
; what is the value of (or (eq? (car lat) a) (member? a (cdr lat))) where a is meat and lat is
; (mashed potatoes and meat gravy)
    ; true because the answer to (member? a (cdr lat)) is true
; what is the value of (member? a lat) where a is meat and lat is (masshed potatoes and meat gravy)
    ; true
; (null? lat) #f
; else; always #t
; (or (eq? (car lat) a) (member? a (cdr lat))) # we have to go deeper but #t
; (eq? (car lat) a) #f
; recur with a staying the same and the new lat being the cdr of current lat (potatoes and meat gravy)
; (null? lat) #f
; else; always #t
; (eq? (car lat) a) (member? a (cdr lat))) # even deeper!, but still #t obviously
; recur with a staying the same and the new lat being the cdr of the current lat (and meat gravy)
; (null? lat) #f
; else; always #t
; (eq? (car lat) a) (member? a (cdr lat))) # deeper still! still #t
; recur with a staying the same and the new lat being the cdr of the current lat (meat gravy)
; (null? lat) #f
; else; always true
; (eq? (car lat) a) #t!
; what is the value of (member? a lat) where a is meat and lat is (meat gravy)
; true
; what is the value of (member? a lat) where a is meat and the lat is (and meat gravy)
; true
; what is the value of (member? a lat) where a is meat and the lat is (potatoes and meat gravy)
; true
; what is the value of (member? a lat) where a is meat and the lat is (mashed potatoes and meat gravy)
; true
; what is the value of (member? a lat) where a is liver and lat is (bagels and lox)
; false because there is no member liver in lat
; what is the first question?
; (null? lat) #f
; else; always #t
; (eq? (car lat) a) #f,
; recur with a staying the same and the new lat being the cdr of the old lat (and lox)
; (null? lat) #f
; else; always #t
; (eq? (car lat) a) #f
; recur with a staying the same and the new lat being the cdr of the old lat (lox)
; (null? lat) #f
; else; always #t
; (eq? (car lat) a) #f
; recur with a staying the sme and the new lat being the cdr of the old lat()
; (null? lat) #t return false
; we then return false to each previous recursion until we answer the first question






