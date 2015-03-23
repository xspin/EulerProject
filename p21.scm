;Amicable numbers
;Problem 21
;Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
;If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.

;For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

;Evaluate the sum of all the amicable numbers under 10000.
;

(define (range_ cs a b)
  (if (> a b) cs
    (range_ (cons a cs) (+ a 1) b)))

(define (range a b)
  (range_ `() a b))


(define (divisors n)
  (filter (lambda (m) (= 0 (modulo n m))) (range 1 (- n 1)))
  )

(define (sum as)
  (if (null? as) 0 (+ (car as) (sum (cdr as))))
  )

;(define (d n) (sum (divisors n)))


(define (amicable n)
  (define t (d n))
  (and (not (= t n)) (= n (d t)))
  )

;(disp (amicable 10000))
;(define sel 
  ;(filter amicable (range 1 10000))
  ;)

;(disp sel)
;(disp (sum sel))

(define (sums s n)
  ;(disp n)
  (if (> n 1) 
    (sums (+ s n) (- n 1))
    ;(if (amicable n) (sums (+ s n) (- n 1)) (sums s (- n 1)))
    s
    )
  )
;(disp (sums 0 100))
;(disp (d 10000))

;(disp (cdr `(1 2 3)))
(define (elem a as)
   (if (null? as) #f 
     (if (= a (car as)) #t (elem a (cdr as)))))

(disp (elem 2 `()))

(define (d n)
  (define (helper n m)
    (if (= n m) 
      0
      (if (= (modulo n m) 0) 
        (+ m (helper n (+ m 1)))
        (helper n (+ m 1)))))
  (helper n 1))

(disp (d 220))

(define (sum-amicable n tmp)
  (define t (d n))
  (if (<= n 1) 
    tmp
    (if (and (not (= t n)) (not (elem n tmp)) (= n (d t))) 
      (sum-amicable (- n 1) (cons t (cons n tmp)))
      (sum-amicable (- n 1) tmp))))

(define sa (sum-amicable 10000 `()))
(disp (sum sa))
