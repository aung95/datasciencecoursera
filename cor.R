corr <- function(directory, treshold = 0){
  # get list of files in directory
  path <- file.path(getwd(),directory)
  files <- list.files(path, full.names = TRUE) # list des path pour chaque dossier
  
  # read data from files with ids in the given range
  List_data <- lapply(files, read.csv)
  
  # count complete cases for each file
  complete(directory, )
  
  results <- lapply(List_data, function(data){
    complete()
    sumcompl <- sum(complete.cases(data)==T)
    corrresults <- ifelse(sumcompl == treshold, "0", cor(data[2],data[3], method = c("pearson")))
  })}