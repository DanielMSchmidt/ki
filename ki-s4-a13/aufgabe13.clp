=================== Aufgabe 13b (Vorwaertsverkettung) ===================
; Regeln fuer Vorwaertsverkettung
(watch rules)
(watch facts)
(watch activations)

; Breiten- oder Tiefensuche
;(set-strategy breadth)
(set-strategy depth)

; Regelmenge
(defrule R1 (A) (B) 		=> (assert (F)))
(defrule R2 (C)			=> (assert (G)))
(defrule R3 (or (D) (E))	=> (assert (H)))
(defrule R4 (or (F) (G))	=> (assert (I)))
(defrule R5 (G)			=> (assert (J)))
(defrule R6 (G) (H)		=> (assert (K)))
(defrule R7 (H)			=> (assert (L)))
(defrule R8 (or (I) (J) (K)) 	=> (assert (M)))
(defrule R9 (K) (L)		=> (assert (N)))
(defrule R11 (declare (salience -100)) => (facts))
