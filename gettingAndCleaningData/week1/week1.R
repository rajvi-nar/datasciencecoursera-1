setwd("/Users/jesseadametz/Development/datasciencecoursera/gettingAndCleaningData/")

#check to see if there is a data directory and create one if not
if (!file.exists("data")) {
  dir.create("data")
}

#download the data that we're going to be working with (CSV)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")
dateDownloaded <- date()

cameraDataCSV <- read.csv("./data/cameras.csv")

#download Excel .xlsx
download.file("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD", "./data/cameras.xlsx", method = "curl")
xlsxDateDownloaded <- date()

library(xlsx)
cameraDataXLSX <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, header = TRUE)

#reading XML example
library(XML)
xmlUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(xmlUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode, xmlValue)

#working with XML sample data
#get the items on the menu and their prices
xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)

#XML sample data - Baltimore Ravens
websiteUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(websiteUrl, useInternal = TRUE)

scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)

scores #empty list while watching the lecture
teams

#reading JSON example
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jadametz/repos")
names(jsonData)

names(jsonData$owner)

#can turn data into JSON
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

#and then read it again
iris2 <- fromJSON(myjson)
head(iris2)