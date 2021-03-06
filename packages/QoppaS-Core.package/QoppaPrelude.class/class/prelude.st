as yet unclassified
prelude
^'((vau (name-of-define null) env
    (set-car! env (cons
        (cons name-of-define
            (cons (vau (name exp) defn-env
                    (set-car! defn-env (cons
                        (cons name (cons (eval defn-env exp) null))
                        (car defn-env))))
                null))
        (car env))))
    define ())

(define if (vau (b t f) env
    (eval env (bool (eval env b) t f))))

(define quote (vau (x) _ x))

(define list (vau xs env
    (if (null? xs)
       ''()
        (cons
            (eval env (car xs))
            (eval env (cons list (cdr xs)))))))

(define wrap (vau (operative) oper-env
    (vau args args-env
        (operate args-env
            (eval    oper-env operative)
            (operate args-env list args)))))

(define lambda (vau (params body) static-env
    (wrap
        (eval static-env
            (list vau params ''_ body)))))

(define fact (lambda (n)
    (if (<= n 1)
        1
        (* n (fact (- n 1))))))

(define last (lambda (xs)
    (if (null? (cdr xs))
        (car xs)
        (last (cdr xs)))))

(define begin (lambda xs (last xs)))

(define set! (vau (name exp) env
    (set-cdr!
        (lookup name env)
        (list (eval env exp)))))

(set! lambda
    ((lambda (base-lambda)
        (vau (param . body) env
            (eval env (list base-lambda param (cons begin body)))))
    lambda))

(set! define
    ((lambda (base-define)
        (vau (param . body) env
            (if (pair? param)
                (eval env
                    (list base-define (car param)
                        (cons lambda (cons (cdr param) body))))
                (eval env (cons base-define (cons param body))))))
    define))

(define (compose f g)
    (lambda (x) (f (g x))))

(define caar  (compose car  car))
(define cadr  (compose car  cdr))
(define caddr (compose cadr cdr))

(define (fib n)
    (display n)
    (display "\n")
    (if (<= n 1)
        n
        (+ (fib (- n 1)) (fib (- n 2)))))

(define (map f xs)
    (if (null? xs)
        ''()
        (cons (f (car xs)) (map f (cdr xs)))))

(define let (vau (binds . body) env
    (eval env
        (cons
            (cons lambda (cons (map car binds) body))
            (map cadr binds)))))

(define (to-bool x)
    (if x #t #f))

(define (not x)
    (if x #f #t))

(define (and-or ident) (vau args env
    (if (null? args)
        ident
        (if (eq? ident (to-bool (eval env (car args))))
            (eval env (cons (list and-or ident) (cdr args)))
            (not ident)))))

(define or  (and-or #f))
(define and (and-or #t))

(define (eval-list eval env l)
	(let ((val (eval env (car l))))
		(if (null? (cdr l))
			val
			(eval-list eval env (cdr l)))))

(define cond (vau alts env
    (if (null? alts)
        #f
        (let (( ((test . body) . rest) alts ))
            (if (or (eq?  test ''else)
                    (eval env test))
                (eval-list eval env body)
                (eval env (cons cond rest)))))))

(define (assq key alist) (cond
    ((null? alist)
        #f)
    ((eq? key (caar alist))
        (car alist))
    (else
        (assq key (cdr alist)))))

(define (foldr f z xs)
    (if (null? xs)
        z
        (f (car xs) (foldr f z (cdr xs)))))

(define (filter f z)
    (cond
		((null? z) z)
		((not (f (car z))) (filter f (cdr z)))
		(else (cons (car z) (filter f (cdr z))))))

(define (append a b)
    (foldr cons b a))

(define apply (wrap (vau (operative args) env
    (eval env (cons
        operative
        (map (lambda (x) (list quote x)) args))))))

; vim: ft=scheme'