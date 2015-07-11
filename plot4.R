## Coursera Exploratory Data Analysis
## Course Project 1 - Electric Power Consumption
## Author:  K. Kelly
## Due:     Sunday, 12 July 2015

## Plot4
## Call Required Libraries
library(dplyr)
library(ggplot2)

## Read in Household Power Consumption File
poweruse <- tbl_df(read.csv2("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, na.strings = "?"))
## Format Date Field
poweruse$Date <- as.Date(poweruse$Date, format = "%d/%m/%Y") 
## Filter dataset timeframe dowm to two (2) days
poweruseDT <- filter(poweruse, Date >= "2007-02-01" & Date <= "2007-02-02")
## Create & Format Timestamp
poweruseDT <- transform(poweruseDT, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## Format Power Fields as Numeric
poweruseDT$Global_active_power <- as.numeric(poweruseDT$Global_active_power)
poweruseDT$Sub_metering_1 <- as.numeric(poweruseDT$Sub_metering_1)
poweruseDT$Sub_metering_2 <- as.numeric(poweruseDT$Sub_metering_2)
poweruseDT$Sub_metering_3 <- as.numeric(poweruseDT$Sub_metering_3)
## Fields converted to include in Plot 4
poweruseDT$Global_reactive_power <- as.numeric(poweruseDT$Global_reactive_power)
poweruseDT$Voltage <- as.numeric(poweruseDT$Voltage)

## Create Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
## 1. Add Plot: Global Acitve Power by Datetime 
plot(poweruseDT$timestamp, poweruseDT$Global_active_power, type = "l",  
     ylab="Global Active Power", xlab="")
title(main="Plot 4", adj=0)
## 2. Add Plot: Voltage by Datetime
plot(poweruseDT$timestamp, poweruseDT$Voltage, type = "l",  
     ylab="Voltage", xlab="datetime")
## 3. Add Plot: Energy Sub Metering - Three (3) Variable by Datetime 
energySub <- function() {
  plot(poweruseDT$timestamp,poweruseDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(poweruseDT$timestamp,poweruseDT$Sub_metering_2,col="red")
  lines(poweruseDT$timestamp,poweruseDT$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
         lwd=c(2.5,2.5), bty="n")
}
energySub()
## 4. Add Plot: Global Reactive Power by Datetime
plot(poweruseDT$timestamp, poweruseDT$Global_reactive_power, type = "l",  
     ylab="Global_reactive_power", xlab="datetime")

dev.off()
