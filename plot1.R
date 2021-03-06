## 
##	Name: 	plot1.R
##	Date: 	13/07/2014
##	Author: 	Jamie Harwood
##	Description: Create a plot using the data provided for Coursera Course
##			"Exploratory Data Analyisis" project 1.  This data provides
##			details of household power consumption for one home over
##			a period of around 4 years.  The plots aim to match the
##			reference plots provided as samples in the course project
##			instructions
##

data <- read.table("household_power_consumption.txt", 
	header=TRUE, sep=";", na.strings=c("?"))
data$datetime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
data.feb <- subset(data, datetime >= strptime('01/02/2007 00:00:00',
				format="%d/%m/%Y %H:%M:%S") & 
				datetime <= strptime('02/02/2007 23:59:59', 
				format="%d/%m/%Y %H:%M:%S"))
data.feb$global_active_power <- as.numeric(data.feb$Global_active_power)
data.feb$global_active_power_kw <- data.feb$global_active_power
png("plot1.png", width = 480, height = 480)
par(mfrow = c(1,1), mar=c(5,5,2,2))
hist(data.feb$global_active_power_kw, xlab="Global Active Power (kilowatts)", 
	main="Global Active Power", col="Red")
dev.off()
