library(dplyr)

# Filter for high temperature days (Temp > 85), then sort by Solar.R ascending
high_temp_solar_sorted <- airquality %>%
  filter(Temp > 85) %>%
  arrange(Solar.R)

cat("Top 5 hottest days with lowest Solar.R:\n")
print(high_temp_solar_sorted %>% select(Temp, Solar.R, Ozone) %>% head(5))

