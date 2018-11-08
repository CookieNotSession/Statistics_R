##### 第1題 ########
one<-read.csv("wastewater.csv",header=TRUE)
DataFrame <- data.frame(response_data = c("AF","FS","FCC")) 
AF = one$AF
FS = one$FS
FCC = one$FCC
all = c(AF,FS,FCC)
Site = as.factor(rep(c("AF","FS","FCC"),each=10) )
fm1 <- aov(all~Site , data = DataFrame) # response data 
anova(fm1)


