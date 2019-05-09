#setwd("F:/R/cogxio")
#setwd("F:/R/cogxio/Zomato")
#setwd("E:/cogxio")
#install.packages("rvest")
library(rvest)

source("url_extraction.R")
data <- extract_data(1)  #150 is the total page number for which restro url is collected.
write.csv(data,"restro_name_url.csv", row.names=T)
rm(data)

url_data <- read.csv("restro_name_url.csv",header=T, sep=",", stringsAsFactors=F)

source("details.R")
source("filter.R")

#data1 <- data_wo_na[1:100,]
datawithrating1 <- details(url_data)
datafinal1 <- filter(datawithrating1)
write.csv(datafinal1,"zomato.csv",row.names=F)
# 
# # data2 <- data_wo_na[501:1000,]
# # datawithrating2 <- details(data2)
# 
# data3 <- data_wo_na[1001:1500,]
# datawithrating3 <- details(data3)
# datafinal3 <- filter(datawithrating3)
# write.csv(datafinal3,"zomato3.csv",row.names=T)

data4 <- data_wo_na[1501:2000,]
datawithrating4 <- details(data4)
datafinal4 <- filter(datawithrating4)
write.csv(datafinal4,"zomato4.csv",row.names=T)

data5 <- data_wo_na[2001:2500,]
datawithrating5 <- details(data5)
datafinal5 <- filter(datawithrating5)
write.csv(datafinal5,"zomato5.csv",row.names=T)

