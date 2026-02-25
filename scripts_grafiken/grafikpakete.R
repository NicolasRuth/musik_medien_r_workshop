## 1) Kleiner Beispiel-Datensatz (positive Korrelation)
set.seed(42)

n <- 30
bekanntheit <- round(runif(n, 1, 10), 1)                 # 1..10
gefallen    <- round(2 + 0.75*bekanntheit + rnorm(n, 0, 0.9), 1)  # positiv korreliert

musik <- data.frame(
  bekanntheit = bekanntheit,
  gefallen    = gefallen
)

# Optional: Korrelation checken
cor(musik$bekanntheit, musik$gefallen)

## Lineares Modell
mod <- lm(gefallen ~ bekanntheit, data = musik)

# ------------------------------------------------------------
## 2) Base R: Scatterplot + Regressionsgerade
plot(gefallen ~ bekanntheit, data = musik,
     pch = 19,
     xlab = "Bekanntheit der Musik",
     ylab = "Gefallen der Musik",
     main = "Base R: Scatterplot + lm-Slope")
abline(mod, lwd = 2)

# ------------------------------------------------------------
## 3) ggplot2: Scatterplot + lm-Slope
# install.packages("ggplot2")
library(ggplot2)

ggplot(musik, aes(x = bekanntheit, y = gefallen)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "ggplot2: Scatterplot + lm-Slope",
    x = "Bekanntheit der Musik",
    y = "Gefallen der Musik"
  )

# ------------------------------------------------------------
## 4) lattice: Scatterplot + lm-Slope
# install.packages("lattice")
library(lattice)

xyplot(gefallen ~ bekanntheit, data = musik,
       xlab = "Bekanntheit der Musik",
       ylab = "Gefallen der Musik",
       main = "lattice: Scatterplot + lm-Slope",
       panel = function(x, y, ...) {
         panel.xyplot(x, y, pch = 19, ...)
         panel.abline(lm(y ~ x), lwd = 2)
       })
