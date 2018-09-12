files <- file('E:/R operating environment/Test/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
# convert data and time to specific format
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
# open device
png(filename = 'E:/R operating environment/Test/plot2.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
attach(data)
plot(DateTime, Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
detach(data)
# close device
dev.off()