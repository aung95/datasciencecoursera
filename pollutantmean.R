directory <- "specdata"
pollutant <- "sulfate"
subgroups <- 5:10

pollutantmean <- function(directory, pollutant, id = subgroups) {
  # get list of files in directory
  path <- file.path(getwd(),directory)
  files <- list.files(path, full.names = TRUE)
  
  # read data from files with ids in the given range
  data <- lapply(files[id], read.csv)
  
  # subset the data to include only the given pollutant
  pollutant_data <- lapply(data, function(x) x[, pollutant])
  
  # calculate the mean of the pollutant across all files
  mean_pollutant <- mean(unlist(pollutant_data), na.rm = TRUE)
  
  # return the mean value
  return(mean_pollutant)
}



