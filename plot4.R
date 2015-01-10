plot4 <- function () {
    library(datasets)
    library(lubridate)
    
    ## Read data file
    datafile<-paste(getwd(), "/R/4 - Exploratory Data Analysis/Project1/exdata_data_household_power_consumption/household_power_consumption.txt", sep="")
    plotfile<-paste(getwd(), "/R/4 - Exploratory Data Analysis/Project1/ExData_Plotting1/plot4.png", sep="")
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
    
        ## Set up frame for plots
        par(mar = c(4, 4, 1, 2), mfrow = c(2,2))
    
        ## Draw plot1
        with(powerdatasub, plot(powerdatasub$DateTime, powerdatasub$Global_active_power, type = "l", col="black", xlab = "",
                            ylab = "Global Active Power"))
        
        ## Draw plot2
        with(powerdatasub, plot(powerdatasub$DateTime, powerdatasub$Voltage, type = "l", col="black", xlab = "datetime",
                            ylab = "Voltage"))
        
        
        ## Draw plot3
        with(powerdatasub, plot(powerdatasub$DateTime, powerdatasub$Sub_metering_1, type = "l", 
                                col="black", xlab = "", ylab = "Energy sub metering"))
        with(powerdatasub, lines(powerdatasub$DateTime, powerdatasub$Sub_metering_2, type = "l", col="red"))
        with(powerdatasub, lines(powerdatasub$DateTime, powerdatasub$Sub_metering_3, type = "l", col="blue"))
        
        ## Add legend for plot 3
        with(powerdatasub, legend("topright", pch = "", lwd = 1, col = c("black", "red", "blue"), 
                                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
        
        
        ## Draw plot4
        with(powerdatasub, plot(powerdatasub$DateTime, powerdatasub$Global_reactive_power, type = "l", col="black", xlab = "datetime",
                            ylab = "Global_reactive_power"))
    
    
    ## Close file
    dev.off()
    
}