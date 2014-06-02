Constraints
============

Darstellung von Constraintsproblemen
---------------------------------------

Beispiele

- Färbeproblem (siehe Kopie)
- n-Damen-Problem (siehe Kopie)
  Beispiel für lokale Konsistenz: Betrachte :math:`c' = \{c(x_1 , x_2)\}`
- Suchproblem: CP mit Variablen :math:`x_1 ,..., x_n` (Wertebereich :math:`D(x_1), ..., D(x_n)`). *Ziel*: globale konsistente Markierung. *Die einfachste Methode*: die Variablen sikzessiv (z.B. Reihenfolge und Tiefensuche mit Backtracking) mit Werten belegen und die Konsistenz gegenüber allen Bedingungen prüfen, die diese Variable enthalten.

Heuristiken für Contraintproblem
-------------------------------------------


Constraintnetz
---------------

Dies ist ein Graph, dessen Knoten den Variablen eines CP entsprechen und dessen Kanten mit Beschränkungen (constraints) markiert sind.
Dies gilt nur für binäre Contraintproblems (die nur ein oder zweistellige constraints enthalten)

Heuristik der minimalen Breitenordnung
-----------------------------------------------
Idee
^^^^^^

Zuerst solche Variablen belegen, die den meisten anderen Variablen durch Knoten verbunden sind.

Vorgangsweise
^^^^^^^^^^^^^

- wähle Knoten mit dem größten Grad (und der größten Kantenzahl) und belege entsprechende Variable
- löse den Knoten und ausgehende Kanten
- wiederhole mit dem restgraphen
