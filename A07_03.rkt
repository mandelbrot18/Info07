;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname A07_03) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Assignment 07

; Aufgabe 3

; a)


;(: split-list ((list-of %a) -> (tuple-of (list-of %a) (list-of %a))))

(define split-list
(lambda (xs)
(match
(empty empty)
((cons x empty) (make-tuple (cons x empty) empty))
((cons x xs)    (make-tuple (cons x (split-list xs) (cons x (split-list xs)))))))









; Parametrisch Polymorpher Record-Typ analog zu cons
(: make-tuple (%a %a -> (tuple-of %a %a)))
(: tuple-fst ((tuple-of %a) -> %a))
(: tuple-snd ((tuple-of %a) -> %a))
(define-record (tuple-of t1 t2) 
  make-tuple
  tuple?
  (tuple-fst  t1)
  (tuple-snd  t2))


