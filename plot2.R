#load the helper function to read the data
source('loadData.R')

# It is assumed that the data file is available in a directory one level up where this scricpt is
data <- load.data("../household_power_consumption.txt")

# Create the device
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

# Create the plot
plot(data$DateTime, data$Global_active_power, 
                        type="l", 
                        xlab="", 
                        ylab="Global Active Power (kilowatts)")

# Close the device
dev.off()