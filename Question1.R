rm(list = ls())  # Removes all variables  
cat("\014")
# Clears the console  
df <- data.frame(
       Diameter = c(4.2, 4.4, 4.6, 4.8, 5.0, 5.2, 5.4, 5.6, 5.8, 6.0),
       Strength = c(51, 54, 69, 81, 75, 79, 89, 101, 98, 102)
   )
View(df)
lm_Strength <- lm(df$Diameter~df$Strength)
print(lm_Strength)
plot(df$Diameter~df$Strength, main= "Strength vs Diameter", xlab = "Diameter", ylab = "Strength")
abline(lm(df$Diameter~df$Strength), col = "red")
################END OF 1)
#2)
summary(lm_Strength)
coef(lm_Strength)[1]#y-intercept
#############

#3
data_residual <- data.frame(
                            Diameter = df$Diameter,
                            residual = resid(lm_Strength),
                            Std_residual = rstandard(lm_Strength)
)
##########################
#4
hist(data_residual$residual,
     main = "Histogram of Residuals", 
     xlab = "Residuals", 
     )
qqnorm(data_residual$residual)
qqline(data_residual$residual)

plot(df$Diameter, data_residual$Std_residual,
     main = "Standard Residuals for Each Diameter",
     xlab = "Diameter",
     ylab = "Standard Residual"
     )
outliers <- which(abs(data_residual$Std_residual) > 2)

###################################################
#6
predicted <- predict(lm_Strength)
plot(predicted, data_residual$residual,
     main = "Residuals vs. Predicted",
     xlab = "Predicted Values",
     ylab = "Residuals",
     )

