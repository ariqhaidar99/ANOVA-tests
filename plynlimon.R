# ==============================================================================
# Project: ESG & Water Quality Analysis (Plynlimon Catchment)
# Description: Two-way ANOVA, model selection (identifying the MSM), residual 
#              diagnostics, and data transformation on instream nitrate levels.
# ==============================================================================

options(scipen = 999)

# 1. Setup and Data Import -----------------------------------------------------
plyn <- read.csv("Plynlimon.csv", stringsAsFactors = TRUE)
View(plyn)
# Convert 'Season' from a nominal factor to an ordered ordinal factor
plyn$Season <- ordered(plyn$Season, levels = c("Spring", "Summer", "Autumn", "Winter"))

# 2. Exploratory Data Analysis -------------------------------------------------
# Visualise nitrate concentrations by Site and by Season
par(mfrow = c(1, 2))
boxplot(NO3.N ~ Site, data = plyn, col = "lightblue", main = "Nitrate by Site", las = 2)
boxplot(NO3.N ~ Season, data = plyn, col = "lightgreen", main = "Nitrate by Season")
# Combine both Expected Values (EVs) into a single exploratory plot
par(mfrow = c(1, 1))
boxplot(NO3.N ~ Site + Season, data = plyn, col = rainbow(4), 
        main = "Nitrate by Site and Season", las = 2, cex.axis = 0.7)

# 3. Maximal Model & Minimum Sufficient Model (MSM) ----------------------------
# Fit the Maximal Model (includes interaction between Site and Season)
plyn.max <- aov(NO3.N ~ Site * Season, data = plyn)
summary(plyn.max)
# Insight: The interaction term (Site:Season) is NOT significant (p = 0.163).
# We must update the model by removing the non-significant term to find the MSM.
plyn.msm <- update(plyn.max, . ~ . - Site:Season)
summary(plyn.msm)

# 4. Model Diagnostics & Transformation ----------------------------------------
# Check residuals for the MSM
par(mfrow = c(2, 2))
plot(plyn.msm)
# Insight: Residuals show non-constant variance (heteroscedasticity). 
# We apply a logarithmic transformation to the response variable (Nitrate).
plyn.msm.log <- aov(log(NO3.N) ~ Site + Season, data = plyn)
summary(plyn.msm.log)

# Re-check improved residuals
plot(plyn.msm.log)

# 5. Explanatory Power & Post-Hoc Analysis -------------------------------------
# Determine the explanatory power (Adjusted R-squared) of the final model
summary.lm(plyn.msm.log)

# Run Tukey Honest Significant Difference to identify specific pairwise variations
plyn.tukey <- TukeyHSD(plyn.msm.log)
print(plyn.tukey)

# Visualise the significant differences
par(mar = c(5, 12, 3, 2), mfrow = c(1, 1))
plot(plyn.tukey, las = 2, cex.axis = 0.6)
