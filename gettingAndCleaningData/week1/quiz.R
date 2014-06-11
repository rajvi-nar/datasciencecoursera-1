setwd("~/Development/datasciencecoursera/gettingAndCleaningData/week1/")

#question 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, "./data/us_communities.csv", method = "curl")
dateDownloaded <- date()

usCommunities <- read.csv("./data/us_communities.csv")
usCommunities_sub <- subset(usCommunities, VAL == 24)

nrow(usCommunities_sub) #53


#question 3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "./data/ngap.xlsx", method = "curl")

library(xlsx)
dat <- read.xlsx("./data/ngap.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)

sum(dat$Zip*dat$Ext,na.rm=T)


#question 4
library(XML)
doc <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zipcodes == 21231)

#question 5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "./data/question5.csv", method = "curl")

library(data.table)
DT = fread("./data/question5.csv")