# Assignment 06 Again
# Carl Saba

library(readr)
yellow_tripdata_2018_07 <- read_csv("yellow_tripdata_2018-07.csv")
library(readr)
taxi_zone_lookup <- read_csv("taxi+_zone_lookup.csv")

merge1 <- merge(taxi_zone_lookup,yellow_tripdata_2018_07,by.x="LocationID",by.y="PULocationID")
names(merge1)[3] <- "PUZone"
merge2 <- merge(taxi_zone_lookup,merge1,by.x="LocationID",by.y="DOLocationID")
names(merge2)[3] <- "DOZone"

finalDF <- merge2[which(merge2$DOZone=="Newark Airport" & merge2$PUZone=="Times Sq/Theatre District"),]
TipAmount = finalDF$total_amount
mean(TipAmount)