# One-way ANOVA: Price ~ Category

# 1) Basic checks
str(df)
summary(df$Price)
table(df$Category)

# 2) Ensure factor
df$Category <- as.factor(df$Category)

# 3) Boxplot
boxplot(Price ~ Category, data = df,
        xlab = "Category",
        ylab = "Price",
        main = "Price by Category")

# 4) Fit model
model1 <- aov(Price ~ Category, data = df)

# 5) ANOVA table
summary(model1)

# 6) Diagnostics
par(mfrow = c(2, 2))
plot(model1)

# 7) Post-hoc (if p-value < 0.05)
TukeyHSD(model1)
