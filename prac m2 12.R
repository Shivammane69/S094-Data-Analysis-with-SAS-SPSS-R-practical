# =========================================
# Correlation Matrix using cor() in R
# =========================================

# Install packages (run once)
install.packages("dplyr")
install.packages("ggplot2")
install.packages("reshape2")

# Load libraries (run every time)
library(dplyr)
library(ggplot2)
library(reshape2)

# Read dataset
walmart <- read.csv("C:/Users/hp/Downloads/Walmart_Sales.csv")

# View structure
str(walmart)

# -----------------------------------------
# Select only numeric columns
# -----------------------------------------
numeric_data <- walmart %>%
  select_if(is.numeric)

# View selected data
head(numeric_data)

# -----------------------------------------
# Create Correlation Matrix
# -----------------------------------------
cor_matrix <- cor(numeric_data, use = "complete.obs")

# Print correlation matrix
print(cor_matrix)

# -----------------------------------------
# Optional: Visualize Correlation Matrix
# -----------------------------------------
cor_melt <- melt(cor_matrix)

ggplot(cor_melt, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = round(value, 2)), color = "black", size = 3) +
  labs(title = "Correlation Matrix Heatmap",
       x = "",
       y = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
