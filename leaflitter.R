# ==============================================================================
# Project: Environmental Monitoring (Forestry & Canopy Density)
# Description: This dataset contains data describing the depth of leaf litter at
#              two different altitudes
# ==============================================================================

# 1. Setup and Data Import -----------------------------------------------------
# getwd()
# list.files()
options(scipen=999)
ll <- read.csv("LeafLitter.csv", stringsAsFactors = T)
View(ll)
str(ll)
summary(ll)

# 2. Exploratory Data Analysis -------------------------------------------------
par(mfrow = c(1, 1))
plot(ll$depth~ll$location, col = rainbow(2), xlab = "Location", ylab = "Leaf Depth")

# 3. Initial ANOVA Modelling & Diagnostics -------------------------------------
# Evaluate if litter depth varies significantly by location
ll.mod1 <- aov(ll$depth~ll$location)
summary(ll.mod1)
# Check residuals for normality and constant variance
par(mfrow=c(2,2))
plot(ll.mod1)
# Insight: Residuals show non-constant variance (breaching ANOVA assumptions).

# 4. Data Transformation & Model Correction ------------------------------------
# Attempt 1: Square-root transformation
ll.mod2 <- aov(sqrt(ll$depth)~ll$location)
summary(ll.mod2)
# Check improved residuals
plot(ll.mod2)

# Attempt 2: Logarithmic transformation (often best for environmental skew)
ll.mod3 <- aov(log(ll$depth)~ll$location)
summary(ll.mod3)
# Check final residuals
plot(ll.mod3)

# 5. Post-Hoc Analysis ---------------------------------------------------------
# Once the optimal transformed model is selected, identify pairwise differences,
# between each models
TukeyHSD(ll.mod1)
TukeyHSD(ll.mod2)
TukeyHSD(ll.mod3)