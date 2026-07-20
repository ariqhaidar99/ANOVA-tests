# ==============================================================================
# Project: Biological Indicators (Ground Squirrels)
# Description: Simple One-way ANOVA evaluating birth weights by gender.
# ==============================================================================

options(scipen = 999)

# 1. Setup and Data Import
gs <- read.csv("GroundSquirrels.csv", stringsAsFactors = TRUE)
names(gs) <- c("Sex", "Weight")

# 2. Exploratory Data Analysis
par(mfrow = c(1, 1))
boxplot(Weight ~ Sex, data = gs, col = c("lightblue", "lightpink"), main = "Birth Weight by Sex")
tapply(gs$Weight, gs$Sex, mean)

# 3. ANOVA Modelling
gs_m1 <- aov(Weight ~ Sex, data = gs)
summary(gs_m1)

# 4. Model Diagnostics
par(mfrow = c(2, 2))
plot(gs_m1)
