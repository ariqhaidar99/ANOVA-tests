# ==============================================================================
# Project: Environmental Monitoring & Biodiversity Assessment
# Description: Two-way ANOVA modelling evaluating the variance in avian 
#              biomass across distinct coastal habitats and species groups. 
#              Includes interaction testing and stepwise reduction to a 
#              Minimum Sufficient Model.
# ==============================================================================

options(scipen = 999)

# 1. Setup and Data Import -----------------------------------------------------
bb <- read.csv("coastal_avian_biodiversity_monitoring.csv", stringsAsFactors = TRUE)
View(bb)
str(bb)

# 2. Exploratory Data Analysis -------------------------------------------------
par(mfrow = c(1, 2))
plot(bb$weight ~ bb$species, col = rainbow(6), main = "Weight by Species", 
     xlab="Bird Species", ylab="Weight", las = 2)
plot(bb$weight ~ bb$coast, col = rainbow(2), main = "Weight by Coast",
     xlab="Coast", ylab="Weight")

# 3. Two-Way ANOVA & Minimum Sufficient Model ----------------------------------
# Evaluate independent variables
bb.m1 <- aov(bb$weight ~ bb$species)
summary(bb.m1)
bb.m2 <- aov(bb$weight ~ bb$coast)
summary(bb.m2)
# Maximal Model (includes interaction between species and coastal region)
bb.m3 <- aov(bb$weight ~ bb$species * bb$coast)
summary(bb.m3)
# Insight: Interaction is not significant. Update to Minimum Sufficient Model.
bb.m4 <- aov(bb$weight ~ bb$species + bb$coast)
summary(bb.m4)

# 4. Model Diagnostics & Transformation ----------------------------------------
par(mfrow = c(2, 2))
plot(bb.m4)

# Apply square-root transformation to normalize residual variance
bb.m5 <- aov(sqrt(bb$weight) ~ bb$species + bb$coast)
summary(bb.m5)
plot(bb.m5)

# 5. Post-Hoc Analysis ---------------------------------------------------------
summary.lm(bb.m5)
TukeyHSD(bb.m5)
