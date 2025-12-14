# --------------------------------------------------
# ONE SAMPLE T-TEST USING t.test()
# DATASET: top_rated_2000webseries.csv
# --------------------------------------------------

# Clear workspace
rm(list = ls())

# --------------------------------------------------
# Step 1: Load dataset
# --------------------------------------------------
data <- read.csv("C:/Users/vibro/Downloads/top_rated_2000webseries.csv")

# View structure and column names
str(data)
colnames(data)
summary(data)

# --------------------------------------------------
# Step 2: Select numerical variable for testing
# --------------------------------------------------
# Example: assume 'Rating' is the column name
# (Change 'Rating' if your dataset uses a different name)

x <- data$Rating

# Remove missing values
x <- na.omit(x)

# --------------------------------------------------
# Step 3: Descriptive statistics
# --------------------------------------------------
mean(x)
sd(x)
length(x)

# --------------------------------------------------
# Step 4: Check normality assumption
# --------------------------------------------------
shapiro.test(x)

hist(x,
     main = "Histogram of Web Series Ratings",
     xlab = "Rating",
     col = "lightblue",
     border = "black")

# --------------------------------------------------
# Step 5: Define hypothesis
# --------------------------------------------------
# H0: Mean rating = 8
# H1: Mean rating ≠ 8

mu_value <- 8

# --------------------------------------------------
# Step 6: Perform One-Sample t-Test
# --------------------------------------------------
t_test_result <- t.test(
  x,
  mu = mu_value,
  alternative = "two.sided",  # use "greater" or "less" if needed
  conf.level = 0.95
)

# --------------------------------------------------
# Step 7: Display result
# --------------------------------------------------
print(t_test_result)

# --------------------------------------------------
# Step 8: Extract important values
# --------------------------------------------------
t_test_result$statistic   # t-value
t_test_result$p.value     # p-value
t_test_result$estimate    # sample mean
t_test_result$conf.int    # confidence interval

# --------------------------------------------------
# Step 9: Conclusion
# --------------------------------------------------
if (t_test_result$p.value < 0.05) {
  cat("Reject H0: Mean rating is significantly different from hypothesized mean.\n")
} else {
  cat("Fail to reject H0: Mean rating is not significantly different.\n")
}
