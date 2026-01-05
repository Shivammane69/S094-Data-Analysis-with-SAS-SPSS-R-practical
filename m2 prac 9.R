# Make sure both are factors
df$Category  <- as.factor(df$Category)
df$DiscGroup <- as.factor(df$DiscGroup)

# Contingency table
tab <- table(df$Category, df$DiscGroup)
tab

# Chi-square test
chi_out <- chisq.test(tab)
chi_out

# Expected counts (optional)
chi_out$expected
