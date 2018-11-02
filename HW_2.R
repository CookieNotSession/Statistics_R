install.packages("ggplot2")
library(ggplot2)
data <- read.table(file = "age_distance.txt" , header = T)
Age <- data[,1]
Distance <- data[,2]
# a. Please draw stem-leaf plots for “Age” and “Distance” respectively. Comments on the two plots
stem(Age)
stem(Distance)
# b. Please draw a scatterplot of “Age” (X 軸) and “Distance” (Y 軸). Comments on the plot. Are there any outliers or influential observations? 
plot(Age,Distance,type="p",col="yellowgreen",main="Age-Distance Relationship",xlab="Age",ylab="Distance",pch=10)
cor(Distance,Age)
abline(coef(Reg),col = "red")
# c. For each variable, compute the mean and standard deviation. Then compute the Pearson correlation coefficient. 
mean(Age)
mean(Distance)
sd(Age)
sd(Distance)
cor(Age,Distance,method="pearson")
# d. 

# e. Draw the residual plot and comment on the plot. 
Reg <- lm(Distance~Age)  #Create a linear model
resid(Reg) #List of residuals
residPlot <- ggplot(aes(x = .fitted, y = .resid),data = Reg) + geom_point() + geom_hline(yintercept = 0) + labs (x = "fitted value", y = "Residual") #A density plot
residPlot
# f. Draw the normal probability plot. Commet on the plot. 
qqnorm(resid(Reg)) # A quantile normal plot - good for checking normality
qqline(resid(Reg))

# g. what is the value of ? What does this value mean?    
summary(Reg)
(summary(Reg)$sigma)**2







