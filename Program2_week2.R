# COURSE WEEK 2

x <- list(a = matrix(1:4, 2,2), b = matrix(1:6,3,2))

# show the concept of anonymous function
# here by retrieving first col value
x
lapply(x, function(elt) elt[,1])

# apply to a matrix
x <- matrix(rnorm(200),20,10)
apply(x,2,mean) # apply mean on column and giving back a vector of 10 (since there was 10 columns)
apply(x,1,mean) # same on row

# apply to a array
a <- array(rnorm(2*2*10),c(2,2,10)) # create a 3 dimension matrix
apply(a,c(1,2),mean) # apply on row and column and colapsed the third dimension (wich was 10) (visualize that in your head alex)

# apply to vector (tapply)
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10) # generate factors by specifying the pattern of their levels
tapply(x,f,mean) # This line of code uses the tapply() function to calculate the 
# mean of the numeric vector x for each level of the factor f. Here's what each argument does

# split : divide with the level --> return a list (faire un lapply direct après)
split(x,f)
lapply(split(x,f),mean)
