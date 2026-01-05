# Two-way ANOVA: Price ~ Category + Discount

# 1) Make factors
df$Category <- as.factor(df$Category)


# df$DiscGroup <- cut(df$Discount,
#                     breaks = 3,
#                     labels = c("Low","Medium","High"))


# 2) Fit two-way ANOVA with interaction
model2 <- aov(Price ~ Category * Discount, data = df)

# 3) ANOVA table
summary(model2)

# 4) Diagnostics
par(mfrow = c(2, 2))
plot(model2)

# 5) Interaction plot (Discount ko numeric maan ke, thoda rough hai)
interaction.plot(x.factor     = df$Category,
                 trace.factor = cut(df$Discount, 3),
                 response     = df$Price,
                 fun          = mean,
                 type         = "b",
                 legend       = TRUE,
                 xlab         = "Category",
                 ylab         = "Mean Price",
                 main         = "Interaction: Category x Discount")
