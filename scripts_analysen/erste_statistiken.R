# Deskriptive Statistik

mean(x)        # Mittelwert
median(x)      # Median
sd(x)          # Standardabweichung
var(x)         # Varianz
summary(x)     # 5-Punkte-Summary
table(x)       # Häufigkeiten
prop.table(table(x))  # Prozentwerte
table(x, y)    # Kreuztabelle
chisq.test(table(x, y))

# Zusammenhänge

cor(x, y)                      # Pearson
cor(x, y, method = "spearman") # Spearman
cor.test(x, y)                 # Signifikanztest
mod <- lm(y ~ x1 + x2, data = df) # Regression
summary(mod)

# Gruppenunterschiede

t.test(x, y)                   # unabhängige Gruppen
t.test(x, y, paired = TRUE)    # gepaart
t.test(x ~ gruppe, data = df)  # Formel-Schreibweise
mod <- aov(y ~ gruppe, data = df) # ANOVA
summary(mod)

musik["gefallen"]
