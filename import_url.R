# R Script basics

if(!file.exists("./data")){dir.create("./data")}
file.Url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType-DOWNLOAD" # bug ça !
download.file(file.Url, destfile = "./data/restaurants.csv", method = "curl")
restData <- read.csv("./data/restaurants.csv")
