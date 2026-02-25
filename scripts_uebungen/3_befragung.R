############################################################
## ÜBUNG 3: Befragung Musiker*innen
## Ziel: Daten einlesen → inspizieren → Korrelationen (inkl. p) → Plot →
## Regression
############################################################

# Optional: Ordner für Grafiken anlegen (falls noch nicht vorhanden)
if (!dir.exists("grafiken")) dir.create("grafiken")

### --------------------------------
### 3. Befragung Musiker*innen
### --------------------------------

## Frage:
## Welches Paket ist praktisch, wenn wir eine Korrelationsmatrix
## inkl. p-Werten berechnen wollen?



############################################################
## 1) Daten einlesen
############################################################

## Aufgabe:
## Lies die Datei "daten/musikerbefragung.csv" ein und speichere sie als "musikbefragung".



############################################################
## 2) Daten inspizieren (immer zuerst!)
############################################################

## Aufgabe:
## Verschaffe dir einen Überblick:
## - Welche Variablen gibt es?
## - Wie sehen die Verteilungen grob aus?



############################################################
## 3) Korrelationen berechnen (inkl. p-Werte)
############################################################

## Aufgabe:
## Wähle die drei Variablen aus:
## Lampenfieber, Extraversion, Jahre_Erfahrung
##
## Tipp: Base R Subsetting:
## df[, c("Spalte1", "Spalte2")]



## Aufgabe:
## Berechne Korrelationen + p-Werte



## Gib die Korrelationsmatrix aus (r)



## Gib die p-Werte aus (p)



############################################################
## 4) Visualisierung: Scatterplot mit Regressionslinie
############################################################

## Aufgabe:
## Visualisiere Extraversion (x) vs. Lampenfieber (y)
## mit Punkten und einer Trendlinie.
##
## Tipp:
## ?geom_jitter
## ?geom_smooth




## Speichere die Grafik als PNG im Ordner "grafiken".



############################################################
## 5) Inferenzstatistik: Multiple lineare Regression
############################################################

## Leitfrage:
## Bleibt der Zusammenhang zwischen Extraversion und Lampenfieber bestehen,
## wenn wir für die Erfahrung (in Jahren) kontrollieren?

## Tipp: Regressionen sind linear models und Programmierer*innen lieben
## Abkürzungen...


