Regelbasierte Systeme
=====================

Expertensystem (XPS)
--------------------

Mithilfe von Fachwissen kann das System die Schlussfolgerung von Experten in einem eng begrenzten Aufgabengebiet rekonstruieren.
Hierdurch können Fachleute auf einem bestimmten Gebiet unterstützt werden. Dies ist ein Knowledge Based System (KBS).

**Grundeigenschaften:**

- Trennung zwischen Wissensbasis und Problemlösungskomponente

Darstellung von Regeln
----------------------

Regeln stellen Wissen über allgemeine Beziehungen zwischen Sachverhalten (Fakten) dar, in der WENN-DANN-Form.

**Beispiel**

WENN der momentan betrachtete Buchstabe ein q ist
UND das Wort keine Abkürzung ist,
DANN ist der nächste Buchstabe ein u

WENN der Motor zu heiß wird
DANN prüfe die Kühlflüssigkeit


Arten von Prämissen
--------------------


1. positive Prämissen +a ist erfüllt, wenn ein entsprechendes positives Faktum a in der Faktenbasis (F) vorhanden ist; dann heißt es die Regel ist anwendbar. Prämisse ist erfüllt, wenn :math:`a \in F`. Annahme: alle in der Faktenbasis eingetragenen Fakten werden als "positive Fakten" interpretiert; Fakten, die nicht eingetragen sind, werden automatisch als "negativ" interpretiert
2. negative Prämisse :math:`\neg a` ist erfüllt, wenn die Faktenbasis des Faktum a nicht enthält
3. prozedurale Prämisse: Die Auswertung wird von einer Prozedur durchgeführt



Regelauswertung
---------------

Rückwärtsverkettende Auswertung (Rückwärtsverkettung)
**Start**: mit einer Anfrage bzw. Hypothese
Falls in F keine Fakten vorhanden ist, das die Hypothese bestätigt ist, sucht die Interferenzmaschine eine passende Regel, also eine Regel deren Konklusion die Hypothese darstellt.
Die Prämisse (oder die Prämissenteile) dieser Regel werden zu den neuen Hypothesen, die dann rekursiv wieder geprüft werden.

**Eingabe**: Faktenbasis, Regelbasis, Hypothese (Ziel)

**Aufgabe**: Bestätigung (bzw. nicht Bestätigung) der Hypothese

Definition Konfliktmenge
-------------------------

Menge der Regeln (Regelinstanzen), die momentan anwendbar sind.


Negative Hypothesen
--------------------------

(z.B.: :math:`\neg a`)

Man versucht die Hypothese +a zu verifizieren. Schlägt dieser Versuch fehl, dann ist die negative Hypothese :math:`\neg a` bestätigt.



Das Prinzip der schwachen Negation
-----------------------------------------

Eine negative Hypothese :math:`\neg a` wird dann akzeptiert, wenn alle Versuche die positive Hypothese a zu beweisen, fehlschlagen.



Das Prinzip der starken Negation
------------------------------------

Eine Hypothese :math:`\neg a` wird dann akzeptiert, wenn :math:`\neg a` in der Faktenbasis vorhanden ist.

Weiter: nur schwache Negation, da wir nur mit positiven Fakten arbeiten.

Vorwärtsverkettende Auswertung (Vorwärtsverkettung, datenorientierte Inferenz)
---------------------------------------------------------------------------------------------

**Eingabe**: Faktenbasis, Regelbasis
**Ausgabe**: Menge der gefolgerten Regeln

**Regelauswahl**: wähle die Regel, bei der die gesamte linke Seite (Prämisse) durch Faktenbasis F erfüllt ist.
**Wirkung**: (bei deduktischen Regel) Erweitere Faktenbasis. Interferenz endet, wenn die Faktenbasis nicht mehr erweitert werden kann.

Beispiel:


:math:`R_1 : A \wedge B \rightarrow H`

:math:`R_2 : C \vee D \rightarrow I`

:math:`R_3 : E \wedge F \wedge G \rightarrow J`

:math:`R_4 : H \vee I \rightarrow K`

:math:`R_5 : I \wedge J \rightarrow L`

:math:`R_6 : K \wedge L \rightarrow M`

Fertigungsprozess: A,...,G Rohstoffe, H,...,L Zwischenprodukte, M Endprodukt

Gegeben seien die Fakten {C,E,F,G,H} = Faktenbasis
Verlauf der Vorwärtsverkettung:

a) Breitensuche: den Regelbaum Schicht fpr Schicht durchlaufen
b) Tiefensuche: Verfolgen eines Pfades in die Tiefe.


Konfliktlösungsstrategien
---------------------------

**Refraktion** Filter: Löschen der im letzten Zyklus gefeuerten Regel / Regelinstanz

**Prioritätsstrategie** Filter: r' hat höhere Priorität als r => entferne (nicht lösche) alle Regeln / Regelinstanzen aus KM (für einen Zyklus)

.. image:: http://i.imgur.com/E3K5PFi.jpg

**Aktualität** Prinzip: Die entstehenden Fakten werden mit Zeitmarken versehen, im Verlauf der Sitzung. Dann wird diejenige Regelinstanz bevorzugt, die sich auf die aktuelleren Fakten bezieht, also diejenigen die späternzur Faktenbasis hinzugefügt wurden. Mit dieser Strategie kann man die Tiefensuche realisieren

Filter: Wähle die aktuellste Regelinstanz, entferne alle anderen aus der KM. Bei mehr als einem Prämissenteil, vergleiche den jeweils aktuellsten Prämissenteil.

**Spezifität** Eine Regel r' heißt spezifischer als r, wenn der Anwendungsbereich einer Teilmenge des Anwendungsbereichs von r ist. (*Anwendungskriterium*)

Anwendungskriterium: s.o.

Subsumptionskriterium: Regel r' heißt spezifischer als r, wenn sie durch Einsetzen von Variablen aus r entstehen kann.

Filter: r' sei spezifischer als r => entferne r aus der KM
