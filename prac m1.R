# ==============================================================================
# R Script: Descriptive Statistics
# Functions Used: summary(), describe()
# Dataset: wine_quality_merged.csv
# ==============================================================================

# ---------------------------
# 1. Install Required Packages
# ---------------------------
install.packages("psych")
install.packages("dplyr")

# ---------------------------
# 2. Load Libraries
# ---------------------------
library(psych)
library(dplyr)

# ---------------------------
# 3. Import Dataset
# ---------------------------
wine <- read.csv("C:/Users/vibro/Downloads/wine_quality_merged.csv")

# ---------------------------
# 4. View Dataset Structure
# ---------------------------
str(wine)

# ---------------------------
# 5. Descriptive Statistics using summary()
# ---------------------------
summary(wine)

# ---------------------------
# 6. Select Only Numeric Columns
# ---------------------------
wine_numeric <- wine %>% select(where(is.numeric))

# ---------------------------
# 7. Descriptive Statistics using summary() on Numeric Data
# ---------------------------
summary(wine_numeric)

# ---------------------------
# 8. Descriptive Statistics using describe()
# ---------------------------
describe(wine_numeric)

# ---------------------------
# 9. Descriptive Statistics for a Specific Variable (quality)
# ---------------------------
summary(wine$quality)
describe(wine$quality)
