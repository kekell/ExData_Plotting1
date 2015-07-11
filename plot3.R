## Coursera Exploratory Data Analysis
## Course Project 1 - Electric Power Consumption
## Author:  K. Kelly
## Due:     Sunday, 12 July 2015

## Plot3
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

## Create Plot

plot3 <- function() {
  png(file="plot3.png", width=480, height=480)    
  plot(poweruseDT$timestamp,poweruseDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
           lines(poweruseDT$timestamp,poweruseDT$Sub_metering_2,col="red")
           lines(poweruseDT$timestamp,poweruseDT$Sub_metering_3,col="blue")
           legend("topright", col=c("black","red","blue"), 
                  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
                  lwd=c(2.5,2.5))
           title(main="Plot 3", adj=0)
      dev.off()
}

## Execute Function Plot3
plot3()

