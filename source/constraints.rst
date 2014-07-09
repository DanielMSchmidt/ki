Constraints
============

Darstellung von Constraintsproblemen
---------------------------------------

Beispiele
^^^^^^^^^^

- Färbeproblem (siehe Kopie)
- n-Damen-Problem (siehe Kopie)
  Beispiel für lokale Konsistenz: Betrachte :math:`c' = \{c(x_1 , x_2)\}`
- Suchproblem: CP mit Variablen :math:`x_1 ,..., x_n` (Wertebereich :math:`D(x_1), ..., D(x_n)`). *Ziel*: globale konsistente Markierung. *Die einfachste Methode*: die Variablen sikzessiv (z.B. Reihenfolge und Tiefensuche mit Backtracking) mit Werten belegen und die Konsistenz gegenüber allen Bedingungen prüfen, die diese Variable enthalten.

Definition Contraintproblem
-----------------------------

Ein Contraintproblem (CP) besteht aus folgenden Komponenten

- eine endliche Menge V an Variablen
- zu jeder Variable :math:`x \in V` ein endlicher Wertebereich D(x) (Domäne)
- Eine endliche Menge C von Beschränkungen, :math:`c \in C`, :math:`c(x_1, ..., x_n)` heißt n-stelliger Constraint
- V(c) ist die Menge der in c vorkommenden Variablen


Definition Markierung eines Contraintproblems
-----------------------------------------------

Eine Abbildung :math:`\omega`, die einer Variable :math:`x_i \in V` einen Wert aus :math:`D(x_i)` zuordnet, heißt Belegung bzw Markierung eines Contraintproblems.

Definition Konsistenz
---------------------

Sei :math:`C' \subseteq C`. Eine Markierung heißt konsistent bzgl C' wenn alle Bedingungen aus C' durch die Belegung :math:`\omega` erfüllt sind. Bei :math:`C' \subset C` spricht man auch von lokaer Konsistenz, bei Konsistenz bzgl. C spricht man von globaler Konsistenz


Lösung eines CP
--------------------

Finden einer globalen Markierung


Heuristiken für Contraintproblem
-------------------------------------------

Heuristik der maximal eingeschränkten Variablen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ordne die zu markierenden Variablen nach Anzahl der freien Werte in ihrem Wertebereich. Bevorzuge die Variable, die die wenigsten freien Werte besitzt.

Heuristik des minimalen Konflikts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ordne die möglichen Werte für eine Variable nach der Anzahl der Konflikte, die ein Wert mit den noch zu markierenden Variablen erzeugt. Bevorzuge den Wert, der die wenigsten Konflikte erzeugt.

Heuristik der minimalen Breitenordnung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Constraintnetz
"""""""""""""""

Dies ist ein Graph, dessen Knoten den Variablen eines CP entsprechen und dessen Kanten mit Beschränkungen (constraints) markiert sind.
Dies gilt nur für binäre Contraintproblems (die nur ein oder zweistellige constraints enthalten)

Idee
""""""

Zuerst solche Variablen belegen, die den meisten anderen Variablen durch Knoten verbunden sind.

Vorgangsweise
"""""""""""""

- wähle Knoten mit dem größten Grad (und der größten Kantenzahl) und belege entsprechende Variable
- löse den Knoten und ausgehende Kanten
- wiederhole mit dem restgraphen


Propagierung von Constraints
-------------------------------

Grundidee
^^^^^^^^^

durch lokale Constraint-Anwendung zur globalen Lösung kommen

Prinzip
^^^^^^^^

schränke die Wertebereiche der Variablen iterativ durch (lokale) Betrachtung der Constraints ein
