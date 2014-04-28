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
