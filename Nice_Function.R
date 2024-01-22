# Nice functions in R
# 

A <- rnorm(10, mean = 4, sd = 4) # create random number

# cut(vectors, breaks=quantile(vector))
C <- cut(A, breaks = quantile(A, probs = seq(0, 1, by=0.25)))
table(C)
library(Hmisc) # to use cut2 :)
D <- cut2(A, g=4)
table(D)

# Melt function
install.packages("data.table")

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear","cyl"), measure.vars = c("mpg","hp"))
head(carMelt, n=3)

# Dcast
cylData <- dcast(carMelt, cyl ~ variable)
cylData
cylData <- dcast(carMelt, cyl ~ variable, mean)

# Tapply
tapply(InsectSprays$count, InsectSprays$spray, sum) #  apply a function (sum) to a vector (InsectSprays$count), grouped by another vector (InsectSprays$spray). Let's break down what this code is doing:

# Sapply
spIns = split(InsectSprays$count, InsectSprays$spray)
sprCount = lapply(spIns, sum)
