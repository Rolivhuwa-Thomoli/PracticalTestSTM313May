df <- data.frame(
       Diameter = c(4.2, 4.4, 4.6, 4.8, 5.0, 5.2, 5.4, 5.6, 5.8, 6.0),
       Strength = c(51, 54, 69, 81, 75, 79, 89, 101, 98, 102)
   )
View(df)
lm_Strength <- lm(df$Diameter~df$Strength)
print(lm_Strength)
plot(df$Diameter~df$Strength, xlab = "Diameter", ylab = "Strength")
abline(lm(df$Diameter~df$Strength), col = "red")