df <- read.csv("getdata_data_ss06hid.csv")

#Create a logical vector that identifies the households on greater than 10 acres 
# who sold more than $10,000 worth of agriculture products. Assign that logical 
# vector to the variable agricultureLogical. Apply the which() function like this 
# to identify the rows of the data frame where the logical vector is TRUE. 

df <- df %>% 
  mutate(
  agricultureLogical = AGS == "6" &  ACR == "3"
  )

df$agricultureLogical

which(df$agricultureLogical)

#### JPG
image_data <- (readJPEG("getdata_jeff.jpg", native = TRUE))


# Convert image data to a vector
image_data <- as.vector(image_data)

# Calculate the 30th and 80th quantiles
quantile_30 <- quantile(image_data, probs = 0.30)
quantile_80 <- quantile(image_data, probs = 0.80)


#### URL
url_GDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
GDP <- read.csv(url_GDP, stringsAsFactors = FALSE)
GDP <- GDP[GDP$X != "",]
GDP <- GDP %>% mutate(
  CountryCode = X,
  GDP_product = as.numeric(Gross.domestic.product.2012)
)
GDP$CountryCode

url_ED <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
ED <- read.csv(url_ED, stringsAsFactors = FALSE)
ED$CountryCode

BIG <- merge(ED, GDP, by.x ="CountryCode", by.y = "CountryCode")

BIG_arrange_desc <- BIG %>%
  arrange(desc(GDP_product))

BIG_arrange_desc$Long.Name[13]

BIG_arrange_asc <- BIG %>%
  arrange(GDP_product) %>%
  mutate(rank_GDP = row_number()) 
  
BIG_arrange_asc[1:38,]

table(BIG_arrange_asc[1:38,]$Income.Group)

BIG %>% 
  group_by(Income.Group) %>%
  summarise(mean(GDP_product, na.rm=TRUE)) 

BIG <- BIG[!is.na(BIG$GDP_product)]

library(dplyr)


# Calculate quantiles
quantiles <- quantile(BIG_arrange_asc$GDP_product, seq(0, 1, 0.2), na.rm = TRUE)

quantiles[5]

# Categorize each row into quantiles
BIG_modified <- BIG %>% 
  filter(GDP_product > quantiles[5])
  

  
            