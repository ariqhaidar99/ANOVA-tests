# ESG Data Analysis: ANOVA & Hypothesis Testing

## 🌍 Overview
This repository contains a collection of R scripts demonstrating advanced hypothesis testing and Analysis of Variance (ANOVA). The projects highlight the ability to handle categorical explanatory variables, test for significant differences across multiple groups, manage interaction terms, and correct residual variance issues using mathematical transformations.

## 📂 Case Studies & Scripts

### 1. Environmental Monitoring: Air Pollution
* **Context:** Comparing atmospheric sulphur dioxide ($SO_2$) concentrations across global cities.
* **Key Statistical Methods:** Data stacking, One-way ANOVA, Square-root transformation to correct heteroscedasticity, and Tukey HSD post-hoc testing.

### 2. Environmental Toxicology: Pesticide Poisoning
* **Context:** Assessing the variance in pesticide poisoning incidents across different animal groups in Scotland[cite: 39].
* **Key Statistical Methods:** One-way ANOVA, Residual Diagnostics, Square-root transformation, and visualising Tukey HSD confidence intervals[cite: 39].

### 3. Anthropological Data: Human Skull Shape
* **Context:** Analysing skull width variance based on population demographics and gender.
* **Key Statistical Methods:** Two-way ANOVA, interaction terms (`*` operator), and complex post-hoc pairwise comparisons.

### 4. Biological Indicators: Ground Squirrels
* **Context:** Evaluating average birth weights across different genders.
* **Key Statistical Methods:** Simple One-way ANOVA and base R visualisations (boxplots).
