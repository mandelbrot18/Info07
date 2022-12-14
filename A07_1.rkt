;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname A07_1) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Assignment 07

; Aufgabe 1

; a)

; Insert-sorted ordnet einen übergebenen Wert an der richtigen Stelle in einer Liste ein.
; Wir unterscheiden drei Fälle:
; - Die übergebene Liste ist leer => alle vorherigen Zellen wurden
;   bereits getestet, Wert ist größer als alle Listenelemente
; - Wert ist kleiner als das erste Element der übergebenen Liste
;   => Passende Stelle wurde gefunden
; - Wert ist größer-gleich dem ersten Element der übergebenen Liste
;   => Passende Stelle wurde noch nicht gefunden, es rekursiv weiteriteriert.

(: insert-sorted (real (list-of real) -> (list-of real)))
(check-expect (insert-sorted 23 (list 3 12 45 113 )) (list 3 12 23 45 113))
(check-expect (insert-sorted 7 (list 2 4 6 8 )) (list 2 4 6 7 8))
(check-expect (insert-sorted 1 (list 4 5 6)) (list 1 4 5 6))
(check-expect (insert-sorted 9 (list 4 5 6)) (list 4 5 6 9))
(check-expect (insert-sorted 4 (list 4 5 6)) (list 4 4 5 6))
(check-expect (insert-sorted 6 (list 4 5 6)) (list 4 5 6 6))
(check-expect (insert-sorted 6 empty) (list 6))


(define insert-sorted
  (lambda (value xs)
    (cond
      ((empty? xs)           (cons value empty))
      ((< value (first xs))  (cons value xs))
      ((>= value (first xs)) (cons (first xs) (insert-sorted value (rest xs)))))))




; b)

; Sort-list arbeitet die übergebene Liste Element für Element durch
; und nutzt insert-sorted, um die sortierte Liste aufzubauen 
(: sort-list ((list-of real) -> (list-of real)))
(check-expect (sort-list (list 4 1 3)) (list 1 3 4))
(check-expect (sort-list (list 1 4 1 3)) (list 1 1 3 4))
(check-expect (sort-list (list 1 4 7 6 3 9 2 8 5)) (list 1 2 3 4 5 6 7 8 9))
(check-expect (sort-list (list 1 8 1 8)) (list 1 1 8 8))
(check-expect (sort-list empty) empty)

(define sort-list
  (lambda (xs)
    (match xs
      ((cons x xs)     (insert-sorted x (sort-list xs)))
      (empty            empty))))










; ------------------------------------------------------------------------------------------------

; Version Control

#|
(define insert-sorted
  (lambda (value xs)
    (match xs
      ((cons x xs) (if (>= value x)
                       (cons x (insert-sorted value (rest xs)))
                       (cons value xs))))))
|#

#|
(define insert-sorted
  (lambda (value xs)
      (let ((first (first xs))
            (rest (rest xs)))
        (if (>= value first)
            (cons first (insert-sorted value rest))
            (cons value xs)))))
|#

#|
(define insert-sorted
  (lambda (value xs)
        (if (>= value (first xs))
            (cons (first xs) (insert-sorted value (rest xs)))
            (cons value xs))))
|#

#|
(define insert-sorted
  (lambda (value xs)
    (cond
      ((empty? xs) (cons value empty))
      ((>= value (first xs))(cons (first xs) (insert-sorted value (rest xs))))
      (else (cons value xs)))))
|#
