# ---------------------------------------------
# PAIRED T-TEST USING t.test(paired = TRUE)
# ---------------------------------------------

# 1. Create Own Dataset (Before–After Example)
data <- data.frame(
  Subject = 1:10,
  Before = c(65, 70, 68, 72, 66, 75, 78, 74, 80, 77),
  After  = c(70, 75, 72, 78, 71, 80, 82, 79, 85, 83)
)

# View data
print(data)

# ---------------------------------------------
# 2. Check structure
# ---------------------------------------------
str(data)

# ---------------------------------------------
# 3. Descriptive statistics
# ---------------------------------------------
mean(data$Before)
mean(data$After)

sd(data$Before)
sd(data$After)

# ---------------------------------------------
# 4. Normality Test on Differences
# ---------------------------------------------
difference <- data$After - data$Before
shapiro.test(difference)

# ---------------------------------------------
# 5. Paired t-test
# ---------------------------------------------
paired_t_test <- t.test(
  data$Before,
  data$After,
  paired = TRUE
)

# Print result
print(paired_t_test)

# ---------------------------------------------
# 6. Alternative way (Formula method)
# ---------------------------------------------
# Convert to long format
long_data <- data.frame(
  Score = c(data$Before, data$After),
  Time = rep(c("Before", "After"), each = nrow(data))
)

t.test(Score ~ Time, data = long_data, paired = TRUE)

# ---------------------------------------------
# END OF CODE
# ---------------------------------------------
