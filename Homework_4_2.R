fern_data <- read.csv(file = "Fern.csv" , header = T)
r = fern_data$Response_area
treatlevel = c("420","460","600","720")
k = 4
n = 2
tr = gl(k, 1, n*k, factor(treatlevel) )

blk = gl(n, k, k*n)             # blocking factor 
blk
aov_model_block = aov(r ~ tr + blk)
summary(aov_model_block)
