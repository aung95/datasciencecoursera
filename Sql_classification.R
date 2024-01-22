# Course 3 on cleaning and managing data - Week 2

install.packages("RMySQL")
library(RMySQL)
ucsdb <- dbConnect(MySQL(), user ="genome", host="genome-mysql.cse.usc.edu") ; dbDisconnect(ucsdb) # ex qui ne fonctionne pas
# toujours bien close la connexion !
# https://www.r-bloggers.com/2011/08/mysql-and-r/

# reading data from the web -> webscrapping

library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "56b637a5baffac62cad9",
                   secret = "8e107541ae1791259e9987d544ca568633da2ebf"
)
# Load necessary library
library(utils)

# URL of the data set
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

# Download the data set to a local file
download.file(url, destfile = "wksst8110.for")

# Define column widths
col_widths <- c(12, 7, 4, 9, 4, 9, 4, 9, 4)

# Read the data set into R
data <- read.fwf("wksst8110.for", widths = col_widths, skip = 4, header = FALSE)

# Calculate the sum of the numbers in the fourth column
sum_column_four <- sum(data$V4)

# Print the result
print(sum_column_four)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)
