  ##Read data from directory
  RawData <- read.table(file = "./data/exdata_data_household_power_consumption/household_power_consumption.txt", 
                        sep = ";", na.strings = "?", header = TRUE)
  
  ##Convert "Date" field to date and subset data to the date range between 2/1/2007 and 2/2/2007.
  RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")
  Data <- RawData[RawData$Date >= '2007-02-01' & RawData$Date <= '2007-02-02',]
  
  ##Coalesce date and time so line graph will show time series.
  Data$DateTime <- as.POSIXct(paste(Data$Date, Data$Time), format="%Y-%m-%d %H:%M:%S")
  
  ##Create line graph for plot2
  
  #First, set margins so labels can be seen
  par(mar = c(2,4,4,2))
  
  #Create .png file of plot
  png("plot2.png")
  plot(Data$DateTime, Data$Global_active_power, type = "l",
       xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
