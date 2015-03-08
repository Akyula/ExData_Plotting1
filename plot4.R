# read data
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, na.strings="?", sep=";", as.is = c(1,2))

# add/convert date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# subset dates 
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
data <- data[data$Date >= as.Date("2007-02-01") 
             & data$Date <= as.Date("2007-02-02"),]

#############################################
#Plot 4
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))
with(data, {
      plot(datetime, Global_active_power, main="", 
           xlab="", ylab="Global Active Power",
           type="l")
      plot(datetime, Sub_metering_1, main="", 
           xlab="", ylab="Energy sub metering",
           type="l")
      lines(datetime, Sub_metering_2,col="red")
      lines(datetime, Sub_metering_3,col="blue")
      legend("topright", col = c("black","red","blue"), 
             legend=names(data[7:9]),lty=c(1,1,1), bty="n", cex=.9)
      plot(datetime, Voltage, main="", type="n")
      lines(datetime, Voltage, lty=1, lwd=0.5) 
      plot(datetime, Global_reactive_power, main="", type="n")
      lines(datetime, Global_reactive_power, lty=1, lwd=0.5) 
})
dev.off()
##############################################
