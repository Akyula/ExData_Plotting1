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
#Plot 2
png("plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, 
     main="", 
     xlab="", 
     ylab="Global Active Power (kilowatts)",
     type="l")
dev.off()
##############################################