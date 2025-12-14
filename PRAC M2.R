data <- read.csv("C:/Users/vibro/Downloads/real_drug_dataset.csv")
head(data)


# Frequency table for a column (example: Drug_Type)
freq_table <- table(data$Drug_Type)

# View result
freq_table
