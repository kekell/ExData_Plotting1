## Coursera Exploratory Data Analysis
## Course Project 1 - Electric Power Consumption
## Author:  K. Kelly
## Due:     Sunday, 12 July 2015

## Plot1
## Call Required Libraries
library(dplyr)
library(ggplot2)

## Read in Household Power Consumption File
poweruse <- tbl_df(read.csv2("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, na.strings = "?"))

## Format Date Field and Power Field as Numeric
poweruse$Date <- as.Date(poweruse$Date, format = "%d/%m/%Y")
poweruse$Global_active_power <- as.numeric(poweruse$Global_active_power)

## Filter dataset timeframe dowm to two (2) days
poweruseDT <- filter(poweruse, Date >= "2007-02-01" & Date <= "2007-02-02")

## Create Historgram
hist(poweruseDT$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
