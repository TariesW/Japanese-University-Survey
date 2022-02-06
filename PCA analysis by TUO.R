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

# obtain packages
install.packages("FactoMineR")
install.packages("factoextra")

library("FactoMineR")
library("factoextra")

# computation
res.pca <- PCA(data_07, graph = FALSE)
print(res.pca)

# obtain eigenvalue and variances
eig.val <- get_eigenvalue(res.pca)
eig.val

# scree plot
fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 50))

# result
var <- get_pca_var(res.pca)
var

# coordinates
var$coord
# Cos2: quality on the factore map
var$cos2
# contribution to the principal components
var$contrib

# plotting
fviz_pca_ind(res.pca, pointsize = "cos2", 
               pointshape = 21, fill = "#E7B800", 
               repel = TRUE)
