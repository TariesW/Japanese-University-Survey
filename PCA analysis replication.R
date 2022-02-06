# load data from url
dat <- read.csv("https://waseda.box.com/shared/static/krfyihps2mlgztxdduloz8ttaeyxoxk1.csv", header=T, row.names=1, na.strings=".")

# export dat as xlsx file
write.csv(dat,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\dataset.csv")

# extract answer from question #7 
library(dplyr)
data_07 <- select(dat, c('q7a','q7b','q7c','q7d','q7e','q7f','q7g','q7h','q7i','q7j','q7k'))
View(data_07)

# export
write.csv(data_07,"/Users/ouyangsiyan/Documents/Accunique/R studio/10-Text Mining\\data.csv")

# PCA analysis
princomp(data_07)
result <- princomp(data_07)
summary(result)

# plot
screeplot(result)
screeplot(result, type ="l")

# load
result$loadings
print(result$loadings, cutoff = 0)

# score
result$scores
round(result$scores, digits = 2)

# calculation
result$loadings["q7a", "Comp.1"]*(data_07$q7a - mean(data_07$q7a))+
  result$loadings["q7b", "Comp.1"]*(data_07$q7a - mean(data_07$q7b))+
  result$loadings["q7c", "Comp.1"]*(data_07$q7a - mean(data_07$q7c))+
  result$loadings["q7d", "Comp.1"]*(data_07$q7a - mean(data_07$q7d))+
  result$loadings["q7e", "Comp.1"]*(data_07$q7a - mean(data_07$q7e))+
  result$loadings["q7f", "Comp.1"]*(data_07$q7a - mean(data_07$q7f))+
  result$loadings["q7g", "Comp.1"]*(data_07$q7a - mean(data_07$q7g))+
  result$loadings["q7h", "Comp.1"]*(data_07$q7a - mean(data_07$q7h))+
  result$loadings["q7i", "Comp.1"]*(data_07$q7a - mean(data_07$q7i))+
  result$loadings["q7j", "Comp.1"]*(data_07$q7a - mean(data_07$q7j))+
  result$loadings["q7k", "Comp.1"]*(data_07$q7a - mean(data_07$q7k))

# table
t(t(result$loadings)%*%t(scale(data_07, scale = F)))

# install package
install.packages("psych")
library("psych")

# correlation test for pairwise data matrix
data_07.ex <- cbind(data_07, result$scores)
corr.test(data_07.ex)
print(corr.test(data_07.ex), digits = 3)
  
# PCA
data_07.std <- data.frame(scale(data_07))
result.std <- princomp(data_07.std)  
data_07.std.ex <- cbind(data_07.std, result.std$scores)  
print(corr.test(data_07.std.ex), digits = 3)
