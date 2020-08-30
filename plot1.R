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

##Plotting Histogram of Global Active Power 
hist(subset_PowerData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
