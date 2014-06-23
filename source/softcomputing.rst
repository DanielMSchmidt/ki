Softcomputing
==============

Genetische Algorithmen
----------------------------

Die durch die natürliche Evolution inspierierte Optimierungs und Such Algorithmen heißen evolutionäre Algorithmen (EA), Genetische Algorithmen (GA), Evolutionäre Strategien, Genetische Programmierung

Idee
^^^^^

Die künstiche Evolution einer Population von Individuen (Kandidaten - Lösungen) unter Verwendung von durch die natürliche Evolution inspirierten Operationen wie Selektion, Kreuzungen (crossover) und Mutation simulieren.

Evolutionäre Algorithmen
^^^^^^^^^^^^^^^^^^^^^^^^^

unterscheiden sich durch Kodierungsverfahren und Auswahl der o.g. Operationen

Genetische Algorithmen
^^^^^^^^^^^^^^^^^^^^^^^^^

- alle drei Operationen
- binäre Kodierung der Lösungs-Kandidaten

Jedes Individuum wird durch eine kodierte Zeile (Chromosome) bestehen aus bits (gene) repräsentiert.

z.B.: `Rucksack - Problem <http://de.wikipedia.org/wiki/Rucksackproblem>`_

Fitness Function
^^^^^^^^^^^^^^^^^

f(x) für Population :math:`F = \sum^n_{i=1} f(x_i)`

Bei der **Selektion** müssen die Individuen mit der größten "Fitness" eine größere "Überlebenschance" bekommen.
Man berechnet die Wahrscheinlichkeit des "Überlebensvermögens": :math:`p^i = f(x_i)_{/F}` und der kumulative Wahrscheinlichkeit

.. math::

  0 < P^1_{cum} &= P^1 \\
  P^2_{cum} &= P^1 + P^2 \\
  P^n_{cum} &= \sum^n_{i=1} p^i = 1

Selektionsdurchführung
^^^^^^^^^^^^^^^^^^^^^^^

Man generiert eine Zufallszahl :math:`z \in [0,1]`. Ist :math:`P^k_{cum} < z \le P^{k+1}_{cum} \rightarrow` das Chromosom :math:`X_{k+1}` sind ausgewählt.
Die Prozedur wird n-mal wiederholt.

Kreuzung
^^^^^^^^^^

Einige Chromosomen werden zufällig ausgewählt.
Beginnend mit dem sogenannten Kreuzungspunkt werden die Chromosomen ("Eltern") abgeschnitten und deren Teile (paarweise) ausgetauscht.
Die neuen Chromosomen ("Kinder") werden in die Population eingenommen.


Mutation
^^^^^^^^^

Ein zufällig ausgewähltes Bit (Gen) wird in einem zufällig ausgewählten Chromosomen geändert. Danach wird wieder die Fitness berechnet und die Selektion von n Chromosomen durchgeführt.

Anwendungsbeispiel
^^^^^^^^^^^^^^^^^^^^

- Gesucht: Max der Funktion :math:`f(x) = x^2`
- Kodierung: binäre Chromosomen mit 5 Bits (Genen)
- Anfangspopulation (willkürlich ausgewählt): 4 Chromosomen fÜr x = 13, 24, 8, 19
==  ====  ==================  ===========================  ================
i   Zahl  :math:`f(x) = x^2`  :math:`\sum^n_{i=1} f(x_i)`  :math:`P_{cum}`
==  ====  ==================  ===========================  ================
1    13    169                0.14                           0.14
2    24    576                0.49                           0.63
3     8     64                0.06                           0.69
4    19    361                0.31                           1.00
==  ====  ==================  ===========================  ================

- Selektion:
    - 0.11 < :math:`P^1_{cum}` -> Chromosom 1 ausgewählt
    - :math:`P^1_{cum}` < 0.27 < :math:`P^2_{cum}` -> Chromosom 2 ausgewählt
    - :math:`P^1_{cum}` < 0.56 < :math:`P^2_{cum}` -> Chromosom 2 ausgewählt
    - :math:`P^3_{cum}` < 0.83 < :math:`P^4_{cum}` -> Chromosom 4 ausgewählt

- Kreuzung: Kreuzungspunkt per Zufall ausgewählt
    - 4 für die Chromosomen 1 und 2 (01101 & 11000 => 01100 & 11001)
    - 2 für die Chromosomen 3 (ehem. 2, rausgefogenes wird ersetzt durch bestes) und 4 (110000 & 10011 => 11011 & 10000)

- Mutation: Wahrscheinlichkeit der Mutation (per Zufall): 0.05
    - 0.05 x 20 Bits = 1 Bit soll der Mutation unterlegen
    - z.B. (per Zufall) das dritte Bit des vierten Chromosoms

- Neue Population (2. Generation)
  - 01100
  - 11001
  - 11011
  - 10100


==  ====  ==================
i   Zahl  :math:`f(x) = x^2`
==  ====  ==================
1    12    144
2    25    625
3    27    729
4    20    400
==  ====  ==================

Vergleich: Klassische und genetische Optimierungs-Algorithmen
----------------------------------------------------------------------
