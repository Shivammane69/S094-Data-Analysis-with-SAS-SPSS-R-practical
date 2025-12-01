# ==============================================================================
# R Script: Handling Missing Values (Data Cleaning)
# Dataset: Retail Product Dataset with Missing Values
# ==============================================================================

# install.packages("dplyr")
# install.packages("tidyr")
library(dplyr)
library(tidyr)   # replace_na()

# ==============================================================================
# 1. IMPORT DATASET
# ==============================================================================

retail_df <- read.csv(
  "Retail Product.csv",
  na.strings = c("", "NA")
)

cat("--- 1. Original Data (First 6 Rows) ---\n")
print(head(retail_df))

cat("\n--- Column Names ---\n")
print(names(retail_df))

cat("\n--- Count of Missing Values per Column ---\n")
print(colSums(is.na(retail_df)))

# ==============================================================================
# 1A. ENSURE CORRECT DATA TYPES (IMPORTANT FOR Price ERROR)
# ==============================================================================

# Price integer/double mix ki wajah se error aa raha tha, isliye numeric bana rahe:
retail_df$Price   <- as.numeric(retail_df$Price)
retail_df$Discount <- as.numeric(retail_df$Discount)

# (Optional) Rating bhi numeric chahiye ho to:
# retail_df$Rating <- as.numeric(retail_df$Rating)

# ==============================================================================
# 2. METHOD A: REMOVE MISSING VALUES (na.omit)
# ==============================================================================

clean_omit <- na.omit(retail_df)

cat("\n--- 2. Data after na.omit() ---\n")
cat("Original rows: ", nrow(retail_df), "\n")
cat("Rows remaining:", nrow(clean_omit), "\n")
print(head(clean_omit))

# ==============================================================================
# 3. METHOD B: REPLACE MISSING VALUES (replace_na)
# ==============================================================================

# Average Price (ignore NAs) – ab double hai, safe hai
avg_price <- mean(retail_df$Price, na.rm = TRUE)

clean_replace <- retail_df %>%
  replace_na(list(
    Category = "Unknown",          # missing Category
    Discount = 0,                  # missing Discount
    Stock    = "Check Warehouse",  # missing Stock
    Price    = avg_price           # missing Price
    # Rating ko yahin NA rehne de rahe hain (agar chahiye to alag handle kar)
  ))

cat("\n--- 3. Data after replace_na() ---\n")
if (nrow(clean_replace) >= 3) {
  print(clean_replace[3, ])       # row 3 check
}
print(head(clean_replace))

cat("\n--- Remaining NAs after replacement ---\n")
print(colSums(is.na(clean_replace)))

