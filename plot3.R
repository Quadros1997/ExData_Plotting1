## Reading the data in 
PowerData <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        na.strings = "?",
                        stringsAsFactors = FALSE, 
                        dec = ".")



##Subsetting the data from the required dates 
subset_PowerData <- PowerData[PowerData$Date %in% c("1/2/2007", "2/2/2007"),]

## Combining Date and Time Column and creating a datetime column 
datetime <- as.POSIXct(paste(subset_PowerData$Date, subset_PowerData$Time),
                       format = "%d/%m/%Y %H:%M:%S")

## Add the datetime column to the subset_PowerData 
subset_PowerData <- cbind(datetime, subset_PowerData)

## Remove individual date and time columns
subset_PowerData <- subset_PowerData[,!(names(subset_PowerData) %in% c("Date", "Time"))]


## Plotting the graph between Sub_metering 1,2 & 3, and datetime 
plot(subset_PowerData$Sub_metering_1 ~ subset_PowerData$datetime, type = "l",
     col = "black", xlab = "", ylab = "Energy sub metering")
lines(subset_PowerData$Sub_metering_2 ~ subset_PowerData$datetime, col = "red")
lines(subset_PowerData$Sub_metering_3 ~ subset_PowerData$datetime, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = 1:1:1)

## Copy the plot 
dev.copy(png, "plot3.png", width =480, height =480)
dev.off()




