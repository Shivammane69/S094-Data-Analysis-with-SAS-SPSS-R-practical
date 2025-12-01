library(dplyr)

TRAIN.1 <- read.csv("TRAIN.1.csv")

# Check columns
names(TRAIN.1)
head(TRAIN.1, 3)

# Method A: Select specific columns
# Example: keep Customer, Product and Sales
selected_cols <- TRAIN.1 %>%
  select(Customer.Name, Product.Name, Sales)

head(selected_cols, 3)

# Method B: Select a range of adjacent columns
# Example: from Order.ID to City
range_cols <- TRAIN.1 %>%
  select(Order.ID:City)

head(range_cols, 3)

# Method C: Select using helper (starts_with)
# Example: columns starting with 'C' (Customer.ID, Customer.Name, Country, City, Category)
starts_with_c <- TRAIN.1 %>%
  select(starts_with("C"))

head(starts_with_c, 3)





# Method A: Drop a single column (e.g. Row.ID)
dropped_one <- TRAIN.1 %>%
  select(-Row.ID)

names(dropped_one)

# Method B: Drop multiple columns (e.g. Postal.Code and Region)
dropped_multiple <- TRAIN.1 %>%
  select(-Postal.Code, -Region)

names(dropped_multiple)

# Method C: Drop a range of columns
# Example: drop everything from Order.Date to Ship.Date
dropped_range <- TRAIN.1 %>%
  select(-(Order.Date:Ship.Date))

names(dropped_range)




