rm(list = ls())  # Removes all variables  
cat("\014")

df <- read.csv("children anemia.csv", header = TRUE)
df$Anemia.level[df$Anemia.level == ""] <- NA
cleaned_df <- df[which(!is.na(df$Age.in.5.year.groups) & !is.na(df$Anemia.level)), ]
table_data <- table(cleaned_df$Age.in.5.year.groups, cleaned_df$Anemia.level)            
chis_test <- chisq.test(table_data)
