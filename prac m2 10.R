# =====================================
# Complete R Code for ggplot2 Reports
# =====================================

# Install packages (run only once)
install.packages("ggplot2")
install.packages("dplyr")

# Load libraries (run every time you start R)
library(ggplot2)
library(dplyr)

# Read the dataset (keep CSV in your working directory)
walmart <- read.csv("C:/Users/hp/Downloads/Walmart_Sales.csv")

# View data
head(walmart)
str(walmart)

# ------------------------------------
# 1. Bar Chart – Total Sales by Store
# ------------------------------------
sales_by_store <- walmart %>%
  group_by(Store) %>%
  summarise(Total_Sales = sum(Weekly_Sales))

ggplot(sales_by_store, aes(x = factor(Store), y = Total_Sales)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Total Sales by Store",
       x = "Store",
       y = "Total Sales") +
  theme_minimal()

# ------------------------------------
# 2. Line Chart – Weekly Sales Trend
# ------------------------------------
ggplot(walmart, aes(x = as.Date(Date, format = "%d-%m-%Y"),
                    y = Weekly_Sales)) +
  geom_line(color = "darkgreen") +
  labs(title = "Weekly Sales Trend",
       x = "Date",
       y = "Weekly Sales") +
  theme_minimal()

# ------------------------------------
# 3. Boxplot – Holiday vs Non-Holiday
# ------------------------------------
ggplot(walmart, aes(x = factor(Holiday_Flag),
                    y = Weekly_Sales,
                    fill = factor(Holiday_Flag))) +
  geom_boxplot() +
  labs(title = "Weekly Sales: Holiday vs Non-Holiday",
       x = "Holiday Flag (0 = No, 1 = Yes)",
       y = "Weekly Sales") +
  theme_minimal()

# ------------------------------------
# 4. Scatter Plot – Temperature vs Sales
# ------------------------------------
ggplot(walmart, aes(x = Temperature, y = Weekly_Sales)) +
  geom_point(alpha = 0.6) +
  labs(title = "Temperature vs Weekly Sales",
       x = "Temperature",
       y = "Weekly Sales") +
  theme_minimal()
