#10. Creating new variables using transformations and calculations in R. #==============================================================================
# R Script: Creating New Variables (Transformations & Calculations)
# Dataset: Retail Product Data
#==============================================================================

library(dplyr)
library(tidyr) # Used to clean the data first


# Import data
df <- read.csv("Retail Product.csv", na.strings = c("", "NA"))

# PRE-CLEANING:
# Transformations fail if numbers are missing (NA). 
# We will fill missing Price/Discount with 0 for this calculation demo.
df_clean <- df %>%
  mutate(
    Price = replace_na(Price, 0),
    Discount = replace_na(Discount, 0),
    Rating = replace_na(Rating, 0)
  )

print("--- Cleaned Baseline Data ---")
print(head(df_clean))

#==============================================================================
# 2. METHOD A: ARITHMETIC CALCULATIONS
#==============================================================================
# Scenario: Calculate the 'Final_Price' after applying the discount percentage.
# Formula: Price - (Price * Discount / 100)

df_calc <- df_clean %>%
  mutate(
    Discount_Amount = Price * (Discount / 100),  # Step 1: Calc amount off
    Final_Price = Price - Discount_Amount        # Step 2: Subtract from total
  )

print("--- Method A: Arithmetic Results (Final Price) ---")
print(df_calc %>% select(Price, Discount, Final_Price))

#==============================================================================
# 3. METHOD B: CONDITIONAL LOGIC (ifelse)
#==============================================================================
# Scenario: Create a 'Quality_Label' based on the Rating.
# Logic: If Rating > 4, it's "Top Rated", otherwise "Average".

df_logic <- df_clean %>%
  mutate(
    Quality_Label = ifelse(Rating > 4.0, "Top Rated", "Average"),
    # Let's add a second logic: Is it expensive?
    Price_Category = ifelse(Price > 4000, "Premium", "Budget")
  )

print("--- Method B: Logic Results (Labels) ---")
print(df_logic %>% select(Rating, Quality_Label, Price, Price_Category))

#==============================================================================
# 4. METHOD C: TEXT TRANSFORMATION (paste)
#==============================================================================
# Scenario: Create a 'Product_Summary' that combines Price and Stock status.
# Function: paste() or paste0()

df_text <- df_clean %>%
  mutate(
    # paste0 connects strings with no separator by default
    # paste connects strings with a space by default
    Product_Summary = paste(Category, "item is", Stock, "at $", Price)
  )
print("--- Method C: Text Transformation ---")
print(head(df_text$Product_Summary))

#==============================================================================
# 5. ALL TOGETHER (The Standard Workflow)
#==============================================================================

final_dataset <- df_clean %>%
  mutate(
    Final_Price = Price - (Price * Discount / 100),
    Is_High_Value = ifelse(Final_Price > 2000, TRUE, FALSE),
    Status_Report = paste0("Rating: ", round(Rating, 1), " / Dis: ", Discount, "%")
  )

print("--- Final Combined Dataset ---")
print(head(final_dataset))






