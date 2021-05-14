  ##Read data from directory
  RawData <- read.table(file = "./data/exdata_data_household_power_consumption/household_power_consumption.txt", 
                        sep = ";", na.strings = "?", header = TRUE)
  
  ##Convert "Date" field to date and subset data to the date range between 2/1/2007 and 2/2/2007
  RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")
  Data <- RawData[RawData$Date >= '2007-02-01' & RawData$Date <= '2007-02-02',]
  
  ##Create historgram for plot1
  
  #First, set margins so labels can be seen
  par(mar = c(4,4,4,2))
  
  #Create .png file of historgram
  png("plot1.png")
  hist(Data$Global_active_power, col = "red", 
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
