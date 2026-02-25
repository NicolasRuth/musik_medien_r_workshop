############################################################
## ÜBUNG 1: Produktplatzierungen in Musikvideos
## Ziel: Daten einlesen → inspizieren → deskriptiv → plotten → Inferenz
############################################################

## 0) Vorbereitung: Pakete laden
## Falls ggplot2 noch nicht installiert ist:
## install.packages("ggplot2")
# Wie lade ich das Paket ggplot2?



############################################################
## 1) Daten einlesen
############################################################

## Aufgabe:
## Lies die Datei "daten/musikvideos.csv" ein und speichere sie als Objekt "musik".

## Tipp: In RStudio bekommst du Hilfe zu Funktionen mit:
## ?read.csv
## oder
## help(read.csv)



## Checkpoint:
## Was ist "musik" jetzt? (Data Frame? Welche Spalten?)
## Tipp:
## ?str
## str(musik)

############################################################
## 2) Daten inspizieren (immer zuerst!)
############################################################

## Aufgabe:
## Schau dir die ersten Zeilen an und fasse Variablen zusammen.

## Tipp: Hilfe-Funktion:
## ?head
## ?summary



## Optional (sehr hilfreich):
## str(musik)      # Struktur: Datentypen + Spalten
## names(musik)    # Spaltennamen
## View(musik)     # Tabelle im Viewer (RStudio)

############################################################
## 3) Erste deskriptive Statistik
############################################################

## Aufgabe:
## 1) Wie verteilen sich die Genres?
## 2) Wie verteilt sich die Platzierung insgesamt?
## 3) Berechne zusätzlich die relativen Häufigkeiten (Anteile/Prozent).

## Tipp: Hilfe:
## ?table
## ?prop.table




############################################################
## 4) Visualisierung (ggplot2)
############################################################

## Aufgabe:
## Visualisiere die Platzierung pro Genre als gestapeltes Balkendiagramm,
## und zwar als ANTEILE (nicht absolute Zahlen).

## Tipp:
## - Schau ins ggplot2 Cheatsheet (sehr nützlich):
##   https://web.stanford.edu/class/stats32/assets/lecture-3/ggplot2-cheatsheet.pdf
## - Wichtige Ideen:
##   ggplot(data, aes(...)) + geom_...
##   geom_bar() zählt automatisch Fälle
##   position = "fill" macht Anteile (0..1)



## Nun speichere den Plot in dem Grafik-Ordner des Projekts.
## Tipp: Hilfe
## ?ggsave



############################################################
## 5) Inferenzstatistik: Zusammenhang testen (Chi-Quadrat)
############################################################

## Leitfrage:
## Hängt die Produktplatzierung mit dem Genre zusammen?

## Aufgabe:
## 1) Erstelle eine Kreuztabelle Genre x Platzierung
## 2) Führe einen Chi-Quadrat-Test durch

## Tipp: Hilfe
## ?chisq.test


