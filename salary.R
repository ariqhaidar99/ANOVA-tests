# ==============================================================================
# Project: Socio-Political Demographics (Voter Profiling)
# Description: This dataset provides information on people's annual salary (GBP)
#             in relation to whether they voted in the last general election, 
#             their gender, and level of education
# ==============================================================================

# 1. Setup and Data Import -----------------------------------------------------
# getwd()
# list.files()
options(scipen=999)
ss <- read.csv("Salary.csv", stringsAsFactors = T)
View(ss)
str(ss)
summary(ss)

# 2. Exploratory Data Analysis -------------------------------------------------
par(mfrow = c(1, 3))
plot(ss$salary~ss$vote, col=2, xlab="Voting", ylab="Salary (K_GBP)")
plot(ss$salary~ss$gender, col=2, xlab="Gender", ylab="Salary (K_GBP)")
plot(ss$salary~ss$education, col=2, xlab="Education Level", ylab="Salary (K_GBP)")

# 3. Salary x Voting ANOVA Modelling & Diagnostics ----------------------
# Baseline One-Way ANOVA 
ss.vote.mod1 <- aov(ss$salary~ss$vote)
summary(ss.vote.mod1)
par(mfrow=c(2,2))
plot(ss.vote.mod1)
# Applying Square root transformation
ss.vote.mod2 <- aov(sqrt(ss$salary)~ss$vote)
summary(ss.vote.mod2)
plot(ss.vote.mod2)
# Applying Logarithmic transformation
ss.vote.mod3 <- aov(log(ss$salary)~ss$vote)
summary(ss.vote.mod3)
plot(ss.vote.mod3)
# Takeway: the logarithmic model proved to be the most robust, perfectly stabilizing 
#          the variance and allowing for highly accurate demographic coefficient extraction.

# 4. Salary x Gender ANOVA Modelling & Diagnostics ----------------------
# Baseline One-Way ANOVA 
ss.gen.mod1 <- aov(ss$salary~ss$gender)
summary(ss.gen.mod1)
plot(ss.gen.mod1)
# Applying Square root transformation
ss.gen.mod2 <- aov(sqrt(ss$salary)~ss$gender)
summary(ss.gen.mod2)
plot(ss.gen.mod2)
# Applying Logarithmic transformation
ss.gen.mod3 <- aov(log(ss$salary)~ss$gender)
summary(ss.gen.mod3)
plot(ss.gen.mod3)
# Takeway: once again, logarithmic model is the most robust

# 5. Combining more than one variable
# Salary x Vote x Gender
ss.votexgen1 <- aov(ss$salary~ss$vote*ss$gender)
summary(ss.votexgen1)
plot(ss.votexgen1)
# Applying square root transformation
ss.votexgen2 <- aov(sqrt(ss$salary)~ss$vote*ss$gender)
summary(ss.votexgen2)
plot(ss.votexgen2)
# Applying log transformation
ss.votexgen3 <- aov(log(ss$salary)~ss$vote*ss$gender)
summary(ss.votexgen3)
plot(ss.votexgen3)
# Takeaway: log transformation is the most robust

# Salary x Vote x Education
ss.votexedu1 <- aov(ss$salary~ss$vote*ss$education)
summary(ss.votexedu1)
plot(ss.votexedu1)
# Applying square root transformation
ss.votexedu2 <- aov(sqrt(ss$salary)~ss$vote*ss$education)
summary(ss.votexedu2)
plot(ss.votexedu2)
# Applying log transformation
ss.votexedu3 <- aov(log(ss$salary)~ss$vote*ss$education)
summary(ss.votexedu3)
plot(ss.votexedu3)
# Takeaway: once again, log transformation is the most robust

# 6. Combining all 3 variables
ss.all1 <- aov(ss$salary~ss$vote*ss$education*ss$gender)
summary(ss.all1)
plot(ss.all1)
# Applying square root transformation to model
ss.all2 <- aov(sqrt(ss$salary)~ss$vote*ss$education*ss$gender)
summary(ss.all2)
plot(ss.all2)
# Applying log transformation
ss.all3 <- aov(log(ss$salary)~ss$vote*ss$education*ss$gender)
summary(ss.all3)
plot(ss.all3)

summary.lm(ss.all1)
summary.lm(ss.all2)
summary.lm(ss.all3)
