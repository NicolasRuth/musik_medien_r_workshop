############################################################
## Analyse-LÖSUNGEN!!!
## Bitte nur anschauen, wenn alle anderen Lösungsversuche
## nicht funtkioniert haben!
############################################################

# Lade benötigte Pakete
library(tidyverse) # oder auch nur library(ggplot2)

### --------------------------------
### 1. Inhaltsanalyse Musikvideos
### --------------------------------

musik <- read.csv("daten/musikvideos.csv")

# Deskriptive Statistik
table(musik$Genre)
table(musik$Platzierung)
prop.table(table(musik$Platzierung))

# Visualisierung: Platzierung pro Genre (Anteile)
p_musik_genre_platzierung <- ggplot(musik, aes(x = Genre, fill = Platzierung)) +
  geom_bar(position = "fill") +
  labs(
    title = "Produktplatzierungen in Musikvideos nach Genre",
    y = "Anteil",
    x = "Genre"
  ) +
  theme_minimal()

p_musik_genre_platzierung

ggsave(
  "grafiken/musikvideos_genre_platzierung.png",
  plot = p_musik_genre_platzierung,
  width = 8,
  height = 5
)

# Kreuztabelle + Chi2-Test
table_genre_platz <- table(musik$Genre, musik$Platzierung)
chisq.test(table_genre_platz)

## Hier folgen noch etwas anspruchsvoller Auswertungen:

# Durchschnittliche Anzahl PP bei Platzierung == "ja" (pro Genre)
musik %>%
  filter(Platzierung == "ja") %>%
  group_by(Genre) %>%
  summarise(
    Mittelwert_PP = mean(Anzahl_PP),
    SD_PP = sd(Anzahl_PP),
    .groups = "drop"
  )

# Mittelwert + SD + SE pro Genre (nur wenn Platzierung vorhanden ist)
platz_summary <- musik %>%
  filter(Platzierung == "ja") %>%
  group_by(Genre) %>%
  summarise(
    Mittelwert_PP = mean(Anzahl_PP),
    SD_PP = sd(Anzahl_PP),
    N = n(),
    SE = SD_PP / sqrt(N),
    .groups = "drop"
  )

platz_summary

# Visualisierung mit Fehlerbalken (SE)
p_musik_pp_pro_genre <- ggplot(platz_summary, aes(x = Genre, y = Mittelwert_PP)) +
  geom_col(color = "black") +
  geom_errorbar(
    aes(ymin = Mittelwert_PP - SE, ymax = Mittelwert_PP + SE),
    width = 0.2
  ) +
  labs(
    title = "Durchschnittliche Anzahl an Platzierungen (bei vorhandener Platzierung)",
    y = "Ø Anzahl Produktplatzierungen",
    x = "Genre"
  ) +
  theme_minimal()

p_musik_pp_pro_genre


### --------------------------------
### 2. Beobachtung Silent Disco
### --------------------------------

disco <- read.csv("daten/silent_disco.csv")

# Deskriptiv
summary(disco$tanzen)
summary(disco$Dauer_Kopfhoerer_Min)
table(disco$Grund_Abnehmen)

# Visualisierung: Verteilung der Gründe
p_disco_gruende <- ggplot(disco, aes(x = Grund_Abnehmen)) +
  geom_bar() +
  labs(
    title = "Gründe für das Abnehmen der Kopfhörer",
    x = NULL,
    y = "Anzahl"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

p_disco_gruende

ggsave(
  "grafiken/disco_gruende.png",
  plot = p_disco_gruende,
  width = 7,
  height = 5
)

# Chi2-Test: Erwartete Gleichverteilung der Gründe?
chisq.test(table(disco$Grund_Abnehmen))

### --------------------------------
### 3. Befragung Musiker*innen
### --------------------------------

musikbefragung <- read.csv("daten/musikerbefragung.csv")

# Deskriptiv
summary(musikbefragung)

# Korrelationen
library(psych)   # install.packages("psych")

# Variablen auswählen
vars <- musikbefragung[, c("Lampenfieber",
                           "Extraversion",
                           "Jahre_Erfahrung")]

# Korrelationen + p-Werte
cor_results <- corr.test(vars)

# Korrelationsmatrix
cor_results$r

# p-Werte
cor_results$p

# Visualisierung: Extraversion vs. Lampenfieber
p_lampenfieber_extraversion <- ggplot(musikbefragung, aes(x = Extraversion, y = Lampenfieber)) +
  geom_jitter(width = 0.2, height = 0.2) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Zusammenhang zwischen Extraversion und Lampenfieber",
    x = "Extraversion",
    y = "Lampenfieber"
  ) +
  theme_minimal()

p_lampenfieber_extraversion

ggsave(
  "grafiken/lampenfieber_extraversion.png",
  plot = p_lampenfieber_extraversion,
  width = 7,
  height = 5
)

# Regression: Lampenfieber ~ Extraversion + Jahre_Erfahrung
modell <- lm(Lampenfieber ~ Extraversion + Jahre_Erfahrung, data = musikbefragung)
summary(modell)

### --------------------------------
### 4. Experiment Festivalwerbung
### --------------------------------

exp <- read.csv("daten/experiment.csv")

# Deskriptiv
exp %>%
  group_by(Bedingung) %>%
  summarise(
    M = mean(Spendenbereitschaft),
    SD = sd(Spendenbereitschaft)
  )

# Visualisierung: Spendenbereitschaft
p_exp_spenden <- ggplot(exp, aes(x = Bedingung, y = Spendenbereitschaft)) +
  geom_boxplot() +
  labs(
    title = "Spendenbereitschaft nach Bedingung",
    y = "Spendenbereitschaft (1–7)",
    x = NULL
  ) +
  theme_minimal()

p_exp_spenden

ggsave(
  "grafiken/experiment_spendenbereitschaft.png",
  plot = p_exp_spenden,
  width = 7,
  height = 5
)

# Visualisierung: Festivalinteresse
p_exp_interesse <- ggplot(exp, aes(x = Bedingung, y = Festivalinteresse)) +
  geom_boxplot() +
  labs(
    title = "Festivalinteresse nach Bedingung",
    y = "Interesse (1–7)",
    x = NULL
  ) +
  theme_minimal()

p_exp_interesse

ggsave(
  "grafiken/experiment_interesse.png",
  plot = p_exp_interesse,
  width = 7,
  height = 5
)

# t-Test: Spendenbereitschaft
t.test(Spendenbereitschaft ~ Bedingung, data = exp)

# t-Test: Festivalinteresse
t.test(Festivalinteresse ~ Bedingung, data = exp)
