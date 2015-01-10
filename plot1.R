plot1 <- function () {
    library(datasets)
    library(lubridate)
    
    ## Read data file
    datafile<-paste(getwd(), "/R/4 - Exploratory Data Analysis/Project1/exdata_data_household_power_consumption/household_power_consumption.txt", sep="")
    plotfile<-paste(getwd(), "/R/4 - Exploratory Data Analysis/Project1/ExData_Plotting1/plot1.png", sep="")
    powerdata<-read.table(datafile, sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
    
        
    ## Add datetime column
    powerdata$DateTime <- paste(powerdata$Date, powerdata$Time, sep = " ")
    
    ## Convert date and time data
    powerdata$Date <- as.POSIXct(powerdata$Date, format="%d/%m/%Y")
    powerdata$DateTime <- as.POSIXct(powerdata$DateTime, format="%d/%m/%Y %H:%M:%S")
    
         
    ##Subset for obseravtions from 2007-02-01 and 2007-02-02 only
    powerdatasub <- subset(powerdata, powerdata$Date > "2007-01-31" & powerdata$Date < "2007-02-03")
    
    ## Open png file
    png(file = plotfile, width = 480, height = 480)
    
    ##Draw plot 1
    par(mar = c(4, 4, 1, 2))
    with(powerdatasub, hist(powerdatasub$Global_active_power, col="red", main = "Global Active Power", 
                            xlab = "Global Active Power (kilowatts)"))
    
    ## Close file
    dev.off()
    
}