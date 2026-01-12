# =========================================
# Histograms and Box Plots using ggplot2
# =========================================

# Install packages (run once)
install.packages("ggplot2")
install.packages("dplyr")

# Load libraries (run every time)
library(ggplot2)
library(dplyr)

# Read dataset (CSV should be in working directory)
walmart <- read.csv("C:/Users/hp/Downloads/Walmart_Sales.csv")

# View data
head(walmart)
str(walmart)

# -----------------------------------------
# 1. Histogram – Distribution of Weekly Sales
# -----------------------------------------
ggplot(walmart, aes(x = Weekly_Sales)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Weekly Sales",
       x = "Weekly Sales",
       y = "Frequency") +
  theme_minimal()

# -----------------------------------------
# 2. Histogram – Distribution of Temperature
# -----------------------------------------
ggplot(walmart, aes(x = Temperature)) +
  geom_histogram(bins = 25, fill = "orange", color = "black") +
  labs(title = "Histogram of Temperature",
       x = "Temperature",
       y = "Frequency") +
  theme_minimal()

# -----------------------------------------
# 3. Box Plot – Weekly Sales by Store
# -----------------------------------------
ggplot(walmart, aes(x = factor(Store), y = Weekly_Sales)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Weekly Sales by Store",
       x = "Store",
       y = "Weekly Sales") +
  theme_minimal()

# -----------------------------------------
# 4. Box Plot – Holiday vs Non-Holiday Sales
# -----------------------------------------
ggplot(walmart, aes(x = factor(Holiday_Flag), y = Weekly_Sales)) +
  geom_boxplot(fill = "violet") +
  labs(title = "Weekly Sales: Holiday vs Non-Holiday",
       x = "Holiday Flag (0 = No, 1 = Yes)",
       y = "Weekly Sales") +
  theme_minimal()
