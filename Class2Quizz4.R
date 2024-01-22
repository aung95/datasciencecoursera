# Quizz 4 cours 2

# 1°
# Define the URL for the data file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# Define the file name where you want to save the data
file_name <- "ss06hid.csv"

# Download the data file to your local directory
download.file(url, destfile = file_name)

# Load the data into R as a data frame
data <- read.csv(file_name)

# Check the first few rows of the data to verify it has been loaded
head(data)

# Split the names of the data frame on "wgtp"
split_names <- strsplit(names(data), "wgtp")

# Access the 123rd element of the resulting list
element_123 <- split_names[[123]]

# 2°
# Define the URL for the data file
url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

# Define the file name where you want to save the data
file_name <- "FGDP.csv"

# Download the data file to your local directory
download.file(url, destfile = file_name)

# Load the data into R as a data frame
data <- read.csv(file_name)

# Check the first few rows of the data to verify it has been loaded
colnames(data)[4] <- "Country"
colnames(data)[5] <- "GDP"
data <- data[c(5:nrow(data)),]
head(data)

data <- data[ c("Country", "GDP")]

data$GDP <- as.numeric(gsub(",", "", data$GDP))

head(data)

data <- data[c(1:190),]




summary(as.numeric(data$GDP), na.rm = TRUE)

# Remove the coma from the GDP number

# Question 4
# Load the GDP data
gdp_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
gdp_data <- read.csv(gdp_url, skip = 5, nrows = 190, header = FALSE)
colnames(gdp_data) <- c("CountryCode", "Rank", "?", "CountryName", "GDP")
head(gdp_data)

# Load the educational data
edu_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
edu_data <- read.csv(edu_url)
head(edu_data)
library(dplyr)
edu_data <- edu_data %>% 
  select(CountryCode, Special.Notes)


# Merge the GDP and educational data based on the country shortcode
merged_data <- merge(edu_data, gdp_data, by.x = "CountryCode", by.y = "CountryCode")

# Filter for countries with available fiscal year end dates
filtered_data <- merged_data[!is.na(merged_data$Special.Notes), ]

# Count how many of them end in June
june_count <- sum(grepl("June", filtered_data$Special.Notes))

# Print the count
cat("Number of countries with fiscal year end in June:", june_count)

# Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
library(lubridate)
sampleTimes <- ymd(sampleTimes)
class(sampleTimes)
year(sampleTimes)
sum(year(sampleTimes)==2012)
sum(year(sampleTimes)==2012 & wday(sampleTimes) == 2)
