# ==============================================================================
# Project: Environmental Toxicology (Pesticide Poisoning)
# Description: One-way ANOVA, square-root transformations, and post-hoc 
#              testing on pesticide incidents across animal groups.
# ==============================================================================

# 1. Setup and Data Import
options(scipen = 999)
pest <- read.csv("PesticidePoisoning.csv", stringsAsFactors = TRUE)

# 2. Exploratory Data Analysis
par(mar = c(5, 5, 2, 2), mfrow = c(1, 1))
boxplot(PI ~ Animal, data = pest, col = rainbow(7), cex.axis = 0.8, main = "Poisoning Incidents by Animal")

# 3. Initial ANOVA Modelling (Fails residual assumptions)
pest.m1 <- aov(PI ~ Animal, data = pest)
summary(pest.m1)

# 4. Transformed Model (Square-Root)
pest.m2 <- aov(sqrt(PI) ~ Animal, data = pest)
summary(pest.m2)

par(mfrow = c(2, 2))
plot(pest.m2)

# 5. Post-Hoc Analysis
summary.lm(pest.m2)
pest.mT <- TukeyHSD(pest.m2)
print(pest.mT)

par(mar = c(5, 10, 3, 2), mfrow = c(1, 1))
plot(pest.mT, las = 2, cex.axis = 0.6)
