## Coursera Exploratory Data Analysis
## Course Project 1 - Electric Power Consumption
## Author:  K. Kelly
## Due:     Sunday, 12 July 2015

## Plot2
## Call Required Libraries
library(dplyr)
library(ggplot2)

## Read in Household Power Consumption File
poweruse <- tbl_df(read.csv2("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, na.strings = "?"))

## Format Date Field and Power Field as Numeric
poweruse$Date <- as.Date(poweruse$Date, format = "%d/%m/%Y") 

## Filter dataset timeframe dowm to two (2) days
poweruseDT <- filter(poweruse, Date >= "2007-02-01" & Date <= "2007-02-02")
poweruseDT <- transform(poweruseDT, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
poweruseDT$Global_active_power <- as.numeric(poweruseDT$Global_active_power)

## Create Plot
plot(poweruseDT$timestamp, poweruseDT$Global_active_power, type = "l",  
        ylab="Global Active Power (kilowatts)", xlab="")
title(main="Plot 2", adj=0)
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
