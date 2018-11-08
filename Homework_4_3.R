cotinine <- read.csv(file = "Cotinine.csv" , header = T)

r = c(cotinine[,"cotinine"]) # response data
Gender = factor(cotinine[,"Gender"]) # 1st factor levels 
Race = factor(cotinine[,"Race"])            # 2nd factor levels 

av = aov(r ~ Gender * Race)  # include interaction
summary(av) 
# H0: no interaction
# p-value = 0.01132 < 0.05 => interaction exists

interaction.plot(x.factor=cotinine$Gender, trace.factor=cotinine$Race, response=cotinine$cotinine, type='b', col= c("red","blue") , xlab = "Gender" , ylab = "Cotinine") 

Female = cotinine[cotinine[,"Gender"]=="Female",]
Male = cotinine[cotinine[,"Gender"]=="Male",]

av_Female = aov(cotinine~Race,data=Female)
summary(av_Female)
av_Male = aov(cotinine~Race,data=Male)
summary(av_Male)
###
cotinine$new <- paste(cotinine$Gender,cotinine$Race,sep='-')
tapply(cotinine$cotinine, cotinine$new, mean)
