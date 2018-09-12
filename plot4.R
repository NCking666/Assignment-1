files <- file('E:/R operating environment/Test/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
# convert data and time to specific format
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
# open device
png(filename = 'E:/R operating environment/Test/plot4.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfrow=c(2,2))
attach(data)
plot(DateTime, Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(DateTime, Voltage, xlab='datetime', ylab='Voltage', type='l')
plot(DateTime,Sub_metering_1,col="black",xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(DateTime,Sub_metering_2,col="red")
lines(DateTime,Sub_metering_3,col="blue")
legend('topright',col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1)
plot(DateTime,Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type= 'l')
detach(data)
# close device
dev.off()