library(dplyr)
library(stringr)

retail_df <- read.csv("TRAIN.1.csv", na.strings = c("", "NA"))

cat("--- Retail Data (first 5 rows) ---\n")
print(head(retail_df, 5))
cat("\n--- Column Names ---\n")
print(names(retail_df))

# Category se first 3 chars (Cat_Code banao)
retail_df$Cat_Code <- str_sub(retail_df$Category, 1, 3)

# Product.Name ke last 5 chars (Name_Last banao)  
retail_df$Name_Last <- str_sub(retail_df$Product.Name, -5, -1)

cat("\n--- After str_sub() ---\n")
print(retail_df %>%
        select(Category, Cat_Code, Product.Name, Name_Last) %>%
        head(5))

# Product.Name ko space se split (first word Name_First, dusra word Name_Rest)
name_split2 <- str_split(retail_df$Product.Name, " ", simplify = TRUE)
retail_df$Name_First <- name_split2[, 1]
retail_df$Name_Rest <- ifelse(ncol(name_split2) > 1, name_split2[, 2], NA)

cat("\n--- After str_split() on Product.Name ---\n")
print(retail_df %>%
        select(Product.Name, Name_First, Name_Rest) %>%
        head(5))
