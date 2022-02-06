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

