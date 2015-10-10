## This script build plot2 for coursera project Exploratory Data Analysis
Sys.setlocale("LC_TIME", "US")
data <- read.table ("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", 
                    colClasses = c(rep ("character", 2), rep ("numeric",7)))

## Converts date and time to useful formats
data$Time <- strptime (paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date (data$Date, "%d/%m/%Y")

## Extract relevant 2-day sample
sub <- data[data$Date == as.Date("01/02/2007", "%d/%m/%Y") | data$Date == as.Date("02/02/2007", "%d/%m/%Y"),]

## Draw histogram of one variable into png file
png ("plot2.png", width = 480, height = 480)
plot (sub$Time, sub$Global_active_power, type='l', xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
message ("Plot saved as plot2.png")

## end of script