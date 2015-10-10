## This script build plot1 for coursera project Exploratory Data Analysis
data <- read.table ("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", 
                    colClasses = c(rep ("character", 2), rep ("numeric",7)))

## Converts date to useful format
data$Date <- as.Date (data$Date, "%d/%m/%Y")

## Extract relevant 2-day sample
sub <- data[data$Date == as.Date("01/02/2007", "%d/%m/%Y") | data$Date == as.Date("02/02/2007", "%d/%m/%Y"),]

## Draw histogram of one variable into png file
png ("plot1.png", width = 480, height = 480)
hist (sub$Global_active_power, col='red', main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
message ("Plot saved as plot1.png")

## end of script