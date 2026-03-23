# Install packages (run once)
install.packages("randomForest")
install.packages("caret")
install.packages("ggplot2")

# Load libraries
library(randomForest)
library(caret)
library(ggplot2)

# Load dataset (CSV - CORRECT)
data <- read.csv("C:\Users\hp\OneDrive\Desktopfraud_dataset(S094).csv")

# Convert Class to factor
data$Class <- as.factor(data$Class)

# Split data
set.seed(42)
trainIndex <- createDataPartition(data$Class, p = 0.7, list = FALSE)
train <- data[trainIndex, ]
test <- data[-trainIndex, ]

# Train Random Forest model
model <- randomForest(Class ~ ., data = train, ntree = 100)

# Prediction
pred <- predict(model, test)

# Create dataframe for graphs
df_plot <- data.frame(
  Actual = test$Class,
  Predicted = pred,
  Time = test$Time,
  Amount = test$Amount
)

# -------------------------------
# ✅ 1. BAR GRAPH
# -------------------------------
ggplot(df_plot, aes(x = Actual, fill = Predicted)) +
  geom_bar(position = "dodge") +
  labs(title = "Bar Graph: Actual vs Predicted",
       x = "Actual Class",
       y = "Count")

# -------------------------------
# ✅ 2. SCATTER PLOT
# -------------------------------
ggplot(df_plot, aes(x = Time, y = Amount, color = Predicted)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot: Random Forest Prediction",
       x = "Time",
       y = "Amount")