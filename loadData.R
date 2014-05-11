#
# Helper function to load the required range of data from the given file
# 
load.data <- function(filename){
        require(sqldf)
        
        # Form the sql query for our search
        sqlstr <- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
        data <- read.csv.sql(filename, sqlstr, sep=";")
        # Close the connection
        sqldf()
        
        # Combine Date and Time into a single variable
        data$DateTime <- paste(data$Date,data$Time)
        
        # convert DateTime into a POSIXct type
        data$DateTime <- as.POSIXct(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"))
        
        # Now that we have a new DateTime feature, we can get rid of the original Date and Time columns
        data <- data[,c(-1,-2)]
        data
}