Nicht - monotones Schließen
===========================

Einführung
----------------

Probleme der Wissensrepräsentation und Wissensverarbeitung:

- **Unvollständigkeit**: Man muss bereit sein Wissen zu aktualisieren und zu revidieren (sowohl Anfangsfaktenbasis, als auch abgeleitetes Wissen). *Aufgabe:* Aktualisierung / Änderung der Wissensbasis
- **Inkonsistenz**: (z.B. widersprüchliche Schlussfolgerungen) *Aufgabe:* Konsistenz - Prüfung - Überwachung
- **Unpräzision, Unsicherheit**: Fuzzy Logic, Denster-Shafer-Verfahren

**Beispiel:** für Notwendigkeit der Aktualisierung / Änderung der Wissensbasis

:math:`r_1: +vogel(x) \rightarrow Legt\_eier(x) \\ r_2: +vogel(x) \rightarrow kann\_fliegen(x)`

:math:`r_1` gilt ausnahmslos, :math:`r_2` nicht, also umformulieren zu:

:math:`r_2' +vogel(x), \neg pinguin(x), \neg strauß(x) \rightarrow kann\_fliegen(x)`


KM - abgeleitetes Faktum

r1, r2' - legt_eier(Hansi) & r_2 - kann_fliegen(Hansi) => pinguin(Hansi) [r2' nicht mehr anwendbar, abgeleitetes Wissen muß revidiert werden => nicht monotones Schließen]

Kennzeichen klassischer Logik: Zusätzliche Information kann alte Schlüsse nicht ungültig machen (die Wissensbasis wächst mit dem Hinzufügen neuen Wissens monoton an)

Probleme
-----------

ökonomische Änderung von Fakten in Wissensbasen (ohne unnötige Nebenberechnungen)


Verfahren
------------

Begründungsverwaltung (truth maintenance system, TMS) - Eine Zusätzliche Kompononete eines wissensbasierten Systems

Aufgaben eines TNS
-------------------

- effektive Aktualisierung einer Wissensbasis
- Erzeugen von Begründungen für abgeleitete Fakten
- Konsistenzüberwachung der Wissensbasis (keine Widersprüche)

TMS Arten
---------

- Rechtfertigungsbasierte Systeme (justifcation-based TMS) [JTMS]
- Annahmenbasierte Systeme (assumption-based TMS) [ATMS]

Rechtfertigungsbasierte Systeme (JTMS)
------------------------------------------

Die Blattknoten des Regelbaums werden Annahmen genannt (bei freien Variablen mehrere Annahmen für ein Blatt möglich)

Rechtfertigungstabelle
^^^^^^^^^^^^^^^^^^^^^^

Tabelle mit allen möglichen Annahmen und sämtlichen Hypothesen, die irgendwann abgeleitet werden können. Markiere in dieser Tabelle alle vorhande Fakten und abgeleiteten Hypothesen mit "IN" und notiere alle Regeln, die diese Hypothese "rechtfertigen"; Alle anderen mit "NOT". Graphische Darstellung heißt Rechtfertigungsnetz

Aktualisierung und Konsistenzprüfung einer Wissensbasis mit Hilfe der RF-Tabelle
------------------------------------------------------------------------------------

Nach der Änderung der Faktenbasis (Hinzufügen oder Löschen eines Faktums) wird die Anwendbarkeit aller Regeln, die dieses Faktum in der Prämisse haben geprüft.

- Gewinnt eine Regelinstanz R ihre Anwendbarkeit, dann werden ihre Schlüsse mit "IN" markiert und die Regel als "Rechtfertigung" eingetragen.
- Verliert eine Regelinstanz ihre Anwendbarkeit, dann werden ihre Schlussfolgerungen zurückgezogen

*(Siehe Zettel)*

Konsistente Markierung
------------------------
*Rechtfertigungstabelle nicht prüfungsrelevant*

Ziel
^^^^^^^^^^

Das System soll anhand einer (vom Besitzer) gegebenen Markierung der Annahmen eine konsistente Markierung des gesamten Netzes durchzuführen.

Definition
^^^^^^^^^^^^^^^

Sei N ein markiertes RF-Netz, dann heißt eine Markierung konsistent, wenn für jeden Nicht-Blatt-Knoten k (keine Annahme) gilt:

- k mit IN markiert :math:`\Longleftrightarrow` k ist durch eine nichtleere Menge von Regeln, denen positive Bedingungen mit IN und negative Bedingungen mit OUT markiert sind, gerechtfertigt.
- k mit OUT markiert :math:`\Longleftrightarrow` k nicht mit IN markiert.


Annahmenbasierte Systeme (ATMS)
--------------------------------

Definition
^^^^^^^^^^

Sei k ein Knoten eines RF-Netzes. Ein Kontext für k ist eine bzgl. Mengeninklusion minimale Menge K von positive und negative Annahmen mit folgender Eigenschaft:

Ist jede positive Annahme mit IN markiert und jede negative mit OUT, so muss in einer konsistenten Markierung des ganzen Netzes auch k mit IN markiert sein.

Aufgabe
^^^^^^^^

Finde alle Kontexte, die einen gegebenen Knoten im RF-Netz begründen.

Aktualisierung von Wissensbasen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ändert sich z.B. die Markierung der Annahme A von OUT nach IN, dann muss das System diejenigen Kontexte die :math:`\neg A` enthalten als Begründungen deaktivieren und diejenigen Kontexte, die A enthalten als Begründungen aktivieren.


Allgemeines Verfahren zur Kontexterstellung eines Knotens (z.B. des Knotens k)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Regeln in aussagenlogische Formel transformieren.
2. Kontexte durch eine aussagenlogische Transformation (in die disjunktiv Normalform) erstellen.
3. redundante Kontexte (subsumierte und tautologische) löschen
