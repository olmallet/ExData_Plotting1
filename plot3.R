## This script build plot3 for coursera project Exploratory Data Analysis
Sys.setlocale("LC_TIME", "US")
data <- read.table ("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", 
                    colClasses = c(rep ("character", 2), rep ("numeric",7)))

## Converts date and time to useful formats
data$Time <- strptime (paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date (data$Date, "%d/%m/%Y")

## Extract relevant 2-day sample
sub <- data[data$Date == as.Date("01/02/2007", "%d/%m/%Y") | data$Date == as.Date("02/02/2007", "%d/%m/%Y"),]

## Draw plot into png file
png ("plot3.png", width = 480, height = 480)
plot (sub$Time, sub$Sub_metering_1, type='l', xlab = '', ylab='Energy sub metering')
points (sub$Time, sub$Sub_metering_2, type='l', col = 'red')
points (sub$Time, sub$Sub_metering_3, type='l', col = 'blue')
legend ('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),lty=c(1,1,1), col = c ('black', 'red', 'blue'))
dev.off()
message ("Plot saved as plot3.png")

## end of script