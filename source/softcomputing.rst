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

- GA suchen nicht mit einem Punkt, sondern mit der Population der Punkte (schließt ein mögliches Steckenbleiben im lokalen Funktionsextremen praktisch aus)
- GA benutzen wahrscheinlichkeitsbasierte Regeln anstatt deterministische Regeln

Wahrscheinlichkeitsbedingte Schlussfolgerungen
----------------------------------------------

Ansatz von Bayes
^^^^^^^^^^^^^^^^^

if B then H with p

Sei :math:`\Omega` - endlicher Ereignisraum

Grundidee:
""""""""""

Jede Aussage, die sich auf ein wirklich eingetretenes Ereignis bezieht, kann als Teilmenge :math:`A \subseteq \Omega` repräsentiert werden.
Eine Aussage heißt wahr, wenn die Aussage entsprechende Teilmenge :math:`A \subseteq \Omega` das tatsächlich eingetretene Ereignis :math:`\omega` enthalten.

Beispiel: Aussage: "Es wurde eine gerade Zahl gewürfelt"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Die Aussage ist wahr, wenn eine 2, eine 4 oder eine 6 gewürfelt wurde. :math:`A = \{ 2,4,6 \}`
Seien A und B Ereignisse, so sind :math:`A \cup B, A \cap B` und Komplement von A und B sind Ereignisse


Definition (Bedingte Wahrscheinlichkeit)
"""""""""""""""""""""""""""""""""""""""""

Sei P eine Wahrscheinlichkeit über :math:`\Omega` und :math:`B \subseteq \Omega` ein Ereignis, für das P(B) > 0 gilt.
Dann heißt für jedes Ereignis :math:`H \subseteq \Omega` der Ausdruck

.. math::

  P(H|B) = \frac{P(H \cap B)}{P(B)}

bedingte Wahrscheinlichkeit von H under der Bedingung B. Die bedingte Wahrscheinlichkeit ist undefiniert, falls P(B) = 0 gilt.

.. math::

  P(H|B) = \frac{P(B|H) \times P(H)}{P(B)}

Vertrauensintervalle nach Dempster-Shafter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ziel
"""""

Grad der Glaubwürdigkeit von Aussagen verschiedenen Zeugen / Experten zu modellisieren.

Annahme
""""""""

Ein Vertrauen (belief) in die Wahrheit einer Aussage, die als Teilmenge :math:`A \subseteq \Omega` repräsentierbar ist, kann durch eine reele Zahl :math:`bel(A) \in [0, 1]` modelliert werden.

Definition Basiswahrscheinlichkeit
""""""""""""""""""""""""""""""""""""

Eine Funktion :math:`m: 2^{\Omega} \rightarrow [0, 1]` heißt Basiswahrscheinlichkeit, wenn sie die Bedingungen :math:`m(\emptyset) = 0` und :math:`\sum_{A \subseteq \Omega} m(A) = 1` erfüllt.


m wird als Basisvertrauen interpretiert(m(A) = Basisvertrauen in A). Die Menge A, für die m(A) > 0 gilt, werden als Fokalelemente bezeichnet.

Definition Belief-Funktion
""""""""""""""""""""""""""

Sei :math:`m: 2^{\Omega} \rightarrow [0, 1]` eine Basiswahrscheinlichkeit.
Dann heißt die durch

.. math::

  bel&: 2^{\Omega} \rightarrow [0, 1] \\
  bel&(A) = \sum_{B \subseteq A} m(B)

für :math:`A \subseteq \Omega` definierte Funktion Belief-Funktion (bel).
bel(A) interpretiert man als Mindestvertrauen in das Ereignis A.

Die zu Belief-Funktion duale Funktion heißt Plausibilitäts-Funktion pl

.. math::

  \forall A \subseteq \Omega: pl(A) = 1 - bel(\overline{A})

pl(A) interpretiert man als Maximum an Vertrauen in A.
[bel(A), bel(A)] - Vertrauensintervall nach Dempster-Shafer

Kombinationsregel
^^^^^^^^^^^^^^^^^^

Kombination unabhängiger Informationsquellen, z.B. unsicherer Bewertung von Ereignissen durch verschiedene Experten oder Ergebnisse von verschiedenen Marktstudien.


Gegeben: :math:`\Omega` und :math:`m_1: 2^{\Omega} \rightarrow [0,1]`, :math:`m_2: 2^{\Omega} \rightarrow [0,1]`. :math:`A_i` und :math:`B_j` entsprechende Fokalelemente.

+----------------+--------------------------------+------------------+------+------------------+
|:math:`m_1(A_1)`| ....                           | :math:`m_1(A_i)` | .... | :math:`m_1(A_k)` |
+================+================================+==================+======+==================+
|:math:`m_2(B_1)`|:math:`m_1(A_1) \cdot m_2(B_1)` |...               |  ... | .............    |
+----------------+--------------------------------+------------------+------+------------------+
|:math:`m_2(B_2)`|...                             |...               |  ... | .............    |
+----------------+--------------------------------+------------------+------+------------------+
|...             |...                             |...               |  ... | .............    |
+----------------+--------------------------------+------------------+------+------------------+
|...             |...                             |...               |  ... | .............    |
+----------------+--------------------------------+------------------+------+------------------+
|...             |...                             |...               |  ... | .............    |
+----------------+--------------------------------+------------------+------+------------------+
|...             |...                             |...               |  ... | .............    |
+----------------+--------------------------------+------------------+------+------------------+
|...             |...                             |...               |  ... | .............    |
+----------------+--------------------------------+------------------+------+------------------+
|...             |...                             |...               |  ... | .............    |
+----------------+--------------------------------+------------------+------+------------------+

Es ist möglich dass :math:`A_i \cup B_j = \emptyset` und in der Tabelle math:`m_1(A_i) \cdot m_2(B_j) \neq 0` ist. Dies ist ein Wiederspruch mit der Definition von m, da math:`m(\emptyset) = 0`. Es muss eine Nominierung vorgenommen werden.

Konfliktmenge: :math:`K = \sum_{A,B \subset \Omega, A \cup B \neq 0} m_1(A) \cdot m_2(B)`

Dempster Kombinationsregel
--------------------------

Seien :math:`m_1, m_2` Basiswahrscheinlichkeiten über den selben Ereignisraum :math:`\Omega` und K Konfliktgrad (K < 1). Dann definiert :math:`m(\emptyset) = 0` und :math:`m(c) = \frac{\sum_{A,B \subset \Omega, A \cup B \neq 0} m_1(A) \cdot m_2(B)}{1-K}` für :math:`c \subseteq \Omega, c \neq \emptyset` die Kombination :math:`m(c) = m_1(A) + m_2(B)` der beiden Basiswahrscheinlichkeiten.
