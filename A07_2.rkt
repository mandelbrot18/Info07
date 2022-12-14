;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname A07_2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Assignment 07

; Aufgabe 02

; ----------------------------------------------------------------
; a)

; bildet die Summe aller Elemente in xs
(: sum ((list-of number) -> number))
(check-expect (sum empty) 0)
(check-expect (sum (list 18)) 18)
(check-expect (sum (list 1 2 3)) 6)
(define sum
  (lambda (xs)
    (match xs
      (empty      0)
      ((cons y ys)( + y (sum ys))))))


; ----------------------------------------------------------------
; b)

; multipliziert alle Elemente von xs mit einem Faktor
(: mult (number (list-of number) -> (list-of number)))
(check-expect (mult 4 empty) empty)
(check-expect (mult 1 (list 4 1 3)) (list 4 1 3))
(check-expect (mult 3 (list 1 2 3)) (list 3 6 9))
 
(define mult
  (lambda (factor xs)
    (match xs
      (empty          empty)
      ((cons x empty) (cons (* factor x) empty))
      ((cons y ys)    (cons (* factor y) (mult factor ys))))))



; ----------------------------------------------------------------
; c)

; entfernt die ersten n Elemente aus der Liste
;(: drop (natural (list-of %a) -> (list-of %a)))
;(check-expect (drop 4 (list 4 1 3)) empty)


#|
(check-expect (drop 2 (list 1 2 3 4)) (list 3 4))
(check-expect (drop 2 (list 4 3 2 1)) (list 2 1))
(check-expect (drop 1 (list 4 3 2 1)) (list 3 2 1))
(check-expect (drop 2 (list 4 1 3)) (list 3))

<






(define my-n 1)


(define drop
  (lambda (n xs)
    (if (< (length xs) n) empty
        (if (= n (- (length xs) n)) xs
            (drop n (rest xs))))))

|#

(define my-xs (list 1 2 3 4 5))

(define drop
  (lambda (n xs)
    (if (= (length xs) (desired-length? n xs)) xs
        (drop n (rest xs)))))


()




(define desired-length?
  (lambda (n xs)
    (- (length xs) n)))



(drop 1 my-xs)

; ----------------------------------------------------------------
; d)



; ----------------------------------------------------------------
; e)



; ----------------------------------------------------------------
; f)


