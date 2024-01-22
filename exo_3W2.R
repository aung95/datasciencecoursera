# quiz first week
r <- read.csv("getdata_data_ss06hid.csv", header = T)

library(dplyr)
r_n <- r %>%
  select(VAL) %>%
  filter(VAL==24) %>%
  count()
r_n

library(readxl)
getdata_data_DATA_gov_NGAP <- as.data.frame(read_excel("getdata_data_DATA.gov_NGAP.xlsx"))

dat <- getdata_data_DATA_gov_NGAP[18:23,7:15]
colnames(dat) <- getdata_data_DATA_gov_NGAP[17, 7:15] 
as.numeric(dat$Zip)
sum(as.numeric(dat$Zip)*as.numeric(dat$Ext),na.rm=T)

library(XML)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileurl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xpathSApply(rootNode,"//zipcode", xmlValue)
