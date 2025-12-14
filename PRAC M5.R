# ---------------------------------------------
# INDEPENDENT TWO SAMPLE T-TEST USING t.test()
# ---------------------------------------------

# 1. Create / Load Data
# Example dataset
data <- data.frame(
  Score = c(45, 50, 48, 52, 47, 60, 62, 58, 65, 61),
  Group = c("A", "A", "A", "A", "A", "B", "B", "B", "B", "B")
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
aggregate(Score ~ Group, data = data,
          FUN = function(x) c(
            Mean = mean(x),
            SD = sd(x),
            N = length(x)
          ))

# ---------------------------------------------
# 4. Normality Test (Shapiro-Wilk)
# ---------------------------------------------
shapiro.test(data$Score[data$Group == "A"])
shapiro.test(data$Score[data$Group == "B"])

# ---------------------------------------------
# 5. Equality of Variance Test (F-test)
# ---------------------------------------------
var.test(Score ~ Group, data = data)

# ---------------------------------------------
# 6. Independent Two Sample t-test
# ---------------------------------------------

# 6a. Welch t-test (Unequal variance) - DEFAULT
t_test_result <- t.test(Score ~ Group, data = data)

# Print result
print(t_test_result)

# ---------------------------------------------
# 6b. Equal variance assumed
# ---------------------------------------------
t_test_equal_var <- t.test(Score ~ Group, data = data, var.equal = TRUE)

print(t_test_equal_var)

# ---------------------------------------------
# 7. Manual Method (Subsetting)
# ---------------------------------------------
group_A <- data$Score[data$Group == "A"]
group_B <- data$Score[data$Group == "B"]

t.test(group_A, group_B)

# ---------------------------------------------
# END OF CODE
# ---------------------------------------------
