# package to install for classes
library(swirl)
install_from_swirl("R Programming")
# to start test type swirl() - to exit press bye()
# | When you are at the R prompt (>):
#   | -- Typing skip() allows you to skip the current question.
# | -- Typing play() lets you experiment with R on your own; swirl will ignore what you do...
# | -- UNTIL you type nxt() which will regain swirl's attention.
# | -- Typing bye() causes swirl to exit. Your progress will be saved.
# | -- Typing main() returns you to swirl's main menu.
# | -- Typing info() displays these options again.

df <- read.csv("hw1_data.csv")
colnames(df)
df_select <- df[df$Ozone >31 & df$Temp >90, ]
good <- complete.cases(df_select)
good
df_select_good <- df_select[good,]
mean(df_select_good$Solar.R, na.rm = TRUE)


over_10 <- function(x){
  value <- x >10
  x[value]
}

# create a function that iterates over a dataframe 
colummeans <- function(y){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i])
  }
  means
}
colummeans(airquality)
