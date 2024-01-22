#  The function should return a data frame where 
# the first column is the name of the file and the second 
# column is the number of complete cases

corr <- function(directory, threshold = 0) {
  # get list of files in directory
  path <- file.path(getwd(), directory)
  files <- list.files(path, full.names = TRUE)
  
  # initialize an empty vector to store the correlations
  correlations <- numeric()
  
  # iterate over the files
  for (file in files) {
    # read in the data
    data <- read.csv(file)
    
    # count complete cases
    n_complete <- sum(complete.cases(data))
    
    # calculate correlation if number of complete cases meets threshold
    if (n_complete > threshold) {
      corr <- cor(data$sulfate, data$nitrate, use = "complete.obs")
      correlations <- c(correlations, corr)
    }
  }
  
  # return vector of correlations
  if (length(correlations) > 0) {
    return(correlations)
  } else {
    return(numeric())
  }
}

  