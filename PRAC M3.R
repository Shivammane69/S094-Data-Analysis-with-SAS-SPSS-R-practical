# ==============================================================================
# R Script: One-Sample t-Test using t.test()
# Dataset: Heart_Disease_Prediction.csv
# ==============================================================================

# -----------------------------
# 1. Clear Environment
# -----------------------------
rm(list = ls())

# -----------------------------
# 2. Set Working Directory (OPTIONAL)
# setwd("C:/Your/Folder/Path")
# -----------------------------

# -----------------------------
# 3. Read Dataset
# -----------------------------
data <- read.csv("C:/Users/vibro/Downloads/Heart_Disease_Prediction.csv")

# -----------------------------
# 4. View Dataset Structure
# -----------------------------
str(data)
head(data)

# -----------------------------
# 5. Select Numeric Variable
# Example: Age
# -----------------------------
age <- data$Age

# -----------------------------
# 6. Remove Missing Values
# -----------------------------
age <- na.omit(age)

# -----------------------------
# 7. One-Sample t-Test
# H0: Mean Age = 50
# H1: Mean Age ≠ 50
# -----------------------------
one_sample_ttest <- t.test(age, mu = 50)

# -----------------------------
# 8. Display Result
# -----------------------------
print(one_sample_ttest)

# -----------------------------
# 9. One-Tailed Tests (Optional)
# -----------------------------

# Mean Age > 50
t.test(age, mu = 50, alternative = "greater")

# Mean Age < 50
t.test(age, mu = 50, alternative = "less")

# -----------------------------
# 10. 99% Confidence Interval
# -----------------------------
t.test(age, mu = 50, conf.level = 0.99)
