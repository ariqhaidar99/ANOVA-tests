# ESG Data Analysis: ANOVA & Hypothesis Testing

## 🌍 Overview
This repository contains a collection of R scripts demonstrating advanced hypothesis testing and Analysis of Variance (ANOVA). The projects highlight the ability to handle categorical explanatory variables, test for significant differences across multiple groups, manage interaction terms, and correct residual variance issues using mathematical transformations.

## 📂 Case Studies & Scripts

### Section 1: Environmental & Ecological Analytics

#### 1.1. Environmental Monitoring: Air Pollution
* **Context:** Comparing atmospheric sulphur dioxide ($SO_2$) concentrations across global cities.
* **Key Statistical Methods:** Data stacking, One-way ANOVA, Square-root transformation to correct heteroscedasticity, and Tukey HSD post-hoc testing.
#### 1.2. Environmental Toxicology: Pesticide Poisoning
* **Context:** Assessing the variance in pesticide poisoning incidents across different animal groups in Scotland.
* **Key Statistical Methods:** One-way ANOVA, Residual Diagnostics, Square-root transformation, and visualising Tukey HSD confidence intervals.
#### 1.3. Environmental Ecology: Carbon Sequestration Indicators
* **Context**: Establishing environmental baselines by evaluating leaf litter depth. A critical proxy for nutrient cycling, forest health, and carbon storage across distinct altitudinal zones (alpine vs. subalpine).
* **Key Statistical Methods**: One-Way ANOVA, rigorous residual diagnostics (homoscedasticity checks), variance stabilization via comparative Square-root and Logarithmic data transformations, and Tukey HSD post-hoc analysis.
#### 1.4. Environmental Monitoring: Avian Biodiversity
* **Context:** Evaluating the variance in avian biomass across distinct coastal habitats and species groups.
* **Key Statistical Methods:** Two-way ANOVA, interaction testing, stepwise reduction to isolate the Minimum Sufficient Model (MSM), Square-root transformation to correct heteroscedasticity, and Tukey HSD.
#### 1.5. Water Quality Monitoring: Plynlimon Catchment
* **Context:** Analysing instream nitrate ($NO_3$) concentrations across different monitoring sites and seasons in mid-Wales.
* **Key Statistical Methods:** Ordinal factor transformation, Two-way ANOVA, identifying the Minimum Sufficient Model (MSM) by removing non-significant interaction terms, Logarithmic transformations to correct heteroscedasticity, and Tukey HSD.
#### 1.6. Biological Indicators: Ground Squirrels
* **Context:** Evaluating average birth weights across different genders of squirrels.
* **Key Statistical Methods:** Simple One-way ANOVA and base R visualisations (boxplots).

### Section 2: Public Health & Biological Demographics
#### 2.1. Anthropological Data: Human Skull Shape
* **Context:** Analysing skull width variance based on population demographics and gender.
* **Key Statistical Methods:** Two-way ANOVA, interaction terms (`*` operator), and complex post-hoc pairwise comparisons.
#### 2.2. Public Health: Drug-Related Deaths
* **Context:** Evaluating class A drug-related mortality rates in England and Wales based on age demographics and gender.
* **Key Statistical Methods:** Ordinal data sorting, Two-way ANOVA with interaction terms (`*` operator), Log transformation, and extensive post-hoc pairwise comparisons.
#### 2.3. Corporate Social Responsibility (CSR): Public Health Metrics
* **Context:** Assessing physical health and wellness metrics (exercise hours) across distinct demographic groups (male, female, non-binary).
* **Key Statistical Methods:** One-way ANOVA, residual variance checks, comparative data transformations (Logarithmic and Square-root) to normalise distributions, and Tukey HSD post-hoc analysis.

### Section 3: Socio-Economic & Political Modelling 

#### 3.1. Socio-Economic Consumer Behavior: Green Space Investment
* **Context**: Profiling household financial investment in green spaces by evaluating gardening expenditure across geographic regions and demographic segments (gender) to inform community economic assessments.
* **Key Statistical Methods**: Iterative One-Way and Additive Two-Way ANOVA modelling, variance stabilization for highly skewed financial data via comparative transformations (identifying Square-root as the Minimum Sufficient correction), and multi-layered demographic coefficient extraction.
#### 3.2. Socio-Political Demographics: Voter & Income Intersectionality
* **Context**: Analyzing the complex intersection of civic engagement (voting habits), education level, and gender to determine the primary demographic drivers of household income and economic disparity.
* **Key Statistical Methods**: Maximal Three-Way ANOVA modelling featuring complex interaction matrices (vote * education * gender), multi-dimensional variance stabilization using Logarithmic transformations to normalize right-skewed economic data, and micro-demographic coefficient evaluation.
