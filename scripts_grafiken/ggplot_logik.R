# Schritt-für-Schritt ggplot2: Plot-Objekt bauen und erweitern
# install.packages("ggplot2")
library(ggplot2)

# (Falls du den Datensatz noch nicht hast:)
set.seed(42)
n <- 30
musik <- data.frame(
  bekanntheit = round(runif(n, 1, 10), 1),
  gefallen    = round(2 + 0.75*round(runif(n, 1, 10), 1) + rnorm(n, 0, 0.9), 1)
)
# Tipp: besser konsistent erzeugen (Alternative):
set.seed(42)
musik <- transform(
  data.frame(bekanntheit = round(runif(n, 1, 10), 1)),
  gefallen = round(2 + 0.75*bekanntheit + rnorm(n, 0, 0.9), 1)
)

# 1) Basis-Plot (nur "Rahmen" + Mapping)
korrelation_geschmack_bekanntheit <- ggplot(
  data = musik,
  mapping = aes(x = bekanntheit, y = gefallen)
)

# Anzeigen (wird noch leer sein)
korrelation_geschmack_bekanntheit

# 2) Punkte hinzufügen
korrelation_geschmack_bekanntheit_punkte <-
  korrelation_geschmack_bekanntheit +
  geom_point()

korrelation_geschmack_bekanntheit_punkte

# 3) Achsentitel + Titel
korrelation_geschmack_bekanntheit_labels <-
  korrelation_geschmack_bekanntheit_punkte +
  labs(
    title = "Bekanntheit vs. Gefallen",
    x = "Bekanntheit der Musik",
    y = "Gefallen der Musik"
  )

korrelation_geschmack_bekanntheit_labels

# 4) Lineares Modell (Slope) hinzufügen
korrelation_geschmack_bekanntheit_lm <-
  korrelation_geschmack_bekanntheit_labels +
  geom_smooth(method = "lm", se = FALSE)

korrelation_geschmack_bekanntheit_lm

# 5) Optional: Theme (z.B. schlicht)
korrelation_geschmack_bekanntheit_final <-
  korrelation_geschmack_bekanntheit_lm +
  theme_minimal()

korrelation_geschmack_bekanntheit_final

# Kurzvariante (gleiche Logik, nur ohne Zwischenobjekte):
korrelation_geschmack_bekanntheit +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Bekanntheit vs. Gefallen",
       x = "Bekanntheit der Musik",
       y = "Gefallen der Musik") +
  theme_minimal()
