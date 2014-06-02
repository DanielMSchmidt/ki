; Regeln fuer Vorwaertsverkettung
;(watch rules)
;(watch facts)
;(watch activations)

; Breiten- oder Tiefensuche
;(set-strategy breadth)
;(set-strategy depth)

(do-backward-chaining M)
(do-backward-chaining N)

; Regelmenge
(defrule R1 (A) (B) (need-M)			=> (assert (F)))
(defrule R2 (C) (or (need-M) (need-N))		=> (assert (G)))
(defrule R3 (or (D) (E)) (need-N)		=> (assert (H)))
(defrule R4 (or (F) (G)) (need-M)		=> (assert (I)))
(defrule R5 (G) (need-M)			=> (assert (J)))
(defrule R6 (G) (H) (or (need-M) (need-N))	=> (assert (K)))
(defrule R7 (H) (need-N)			=> (assert (L)))
(defrule R8 (or (I) (J) (K)) (need-M) 		=> (assert (M)))
(defrule R9 (K) (L) (need-N)			=> (assert (N)))
(defrule R11 (declare (salience -100)) 		=> (facts))

(defrule TRUE_M (M) => (printout t "------> M is true <-------" crlf))
(defrule TRUE_N (N) => (printout t "------> N is true <-------" crlf))

(defrule NO_N (declare (salience -100)) (need-N) (not (N)) => (printout t "N cannot be confirmed for given facts" crlf))
(defrule NO_M (declare (salience -100)) (need-M) (not (M)) => (printout t "M cannot be confirmed for given facts" crlf))
