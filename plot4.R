#load the helper function to read the data
source('loadData.R')

# It is assumed that the data file is available in a directory one level up where this scricpt is
data <- load.data("../household_power_consumption.txt")

# Create the device
png(file = "plot4.png", width = 480, height = 480, bg = "transparent")


# Create the plot
par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(data$DateTime, data$Sub_metering_2, col="red")

lines(data$DateTime, data$Sub_metering_3, col="blue")

leg = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=leg, col=c("black","red","blue"), lwd=1,lty=1)

plot(data$DateTime, data$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")

# Close the device
dev.off()