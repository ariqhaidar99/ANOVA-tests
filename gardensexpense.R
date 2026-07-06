# ==============================================================================
# Project: Socio-Economic Modeling (Household Expenditure)
# Description: This dataset describe annual expenditure on gardening according to 
#              various responders
# ==============================================================================

# 1. Setup and Data Import -----------------------------------------------------
# getwd()
# list.files()
options(scipen=0)
gg <- read.csv("Gardens.csv", stringsAsFactors = T)
View(gg)
str(gg)
summary(gg)

# 2. Exploratory Data Analysis -------------------------------------------------
par(mfrow = c(1, 1))
plot(gg$expenditure~gg$gender, col=2, xlab="Gender", ylab="Expenditure")
plot(gg$expenditure~gg$location, col=rainbow(4), xlab="Location", ylab="Expenditure")

# 3. Expenditure x Location ANOVA Modelling & Diagnostics ----------------------
# Baseline One-Way ANOVA 
gg.loc.mod1 <- aov(gg$expenditure~gg$location) 
summary(gg.loc.mod1)
par(mfrow=c(2,2))
plot(gg.loc.mod1)
# Correcting the variance with a Square-Root transformation
gg.loc.mod2 <- aov(sqrt(gg$expenditure)~gg$location)
summary(gg.loc.mod2)
par(mfrow=c(2,2))
plot(gg.loc.mod2)
# Comparative check with a Logarithmic transformation
gg.loc.mod3 <- aov(log(gg$expenditure)~gg$location)
summary(gg.loc.mod3)
par(mfrow=c(2,2))
plot(gg.loc.mod3)
# Takeway: log transformation was the best model out of the 3

# 4. Expenditure x Gender ANOVA Modelling & Diagnostics ------------------------
# Baseline One-Way ANOVA 
gg.gen.mod1 <- aov(gg$expenditure~gg$gender) 
summary(gg.gen.mod1)
par(mfrow=c(2,2))
plot(gg.gen.mod1)
# Correcting the variance with a Square-Root transformation
gg.gen.mod2 <- aov(sqrt(gg$expenditure)~gg$gender)
summary(gg.gen.mod2)
par(mfrow=c(2,2))
plot(gg.gen.mod2)
# Comparative check with a Logarithmic transformation
gg.gen.mod3 <- aov(log(gg$expenditure)~gg$gender)
summary(gg.gen.mod3)
par(mfrow=c(2,2))
plot(gg.gen.mod3)
# Takeway: square root model is the best model out of the 3, log model shows an 
#          overcorrection shown in the bottom left of Q-Q residuals plot

# 5. Final model, Combining all 3 ----------------------------------------------
# Square root transformation
gg.combined1 <- aov(sqrt(gg$expenditure)~gg$location+gg$gender)
par(mfrow=c(2,2))
plot(gg.combined1)
summary(gg.combined1)
summary.lm(gg.combined1)
# Log transformation
gg.combined2 <- aov(log(gg$expenditure)~gg$location+gg$gender)
par(mfrow=c(2,2))
plot(gg.combined2)
summary(gg.combined2)
summary.lm(gg.combined2)
# Takeway: square root model is the best model out of the 2, log model shows an 
#          overcorrection shown in the bottom left of Q-Q residuals plot