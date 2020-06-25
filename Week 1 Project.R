##Week 1 Exploratory data Project 

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Select for the days Feb 1-2 2007
library(lubridate)
data$Date <- dmy(data$Date)

energy21 <- filter(data, Date == "2007-02-01")
energy22 <- filter(data, Date == "2007-02-02")
energy <- rbind(energy21, energy22)


##Plot1
png("Plot1.png")
        hist(energy$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()

##Plot2
png("Plot2.png")
datetime <- as.POSIXct(paste(energy$Date, energy$Time), format="%Y-%m-%d %H:%M:%S")
plot(datetime, energy$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

##Plot3
png("Plot3.png")
energy2 <- cbind(datetime, energy)
plot(energy2$datetime, energy2$Sub_metering_1, type = "l", col = "black", 
     xlab = "",
     ylab = "Energy sub metering")
points(energy2$datetime, energy2$Sub_metering_2, type = "l", col = "red")
points(energy2$datetime, energy2$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)
dev.off()

##Plot4
png("Plot4.png")
par(mfrow = c(2,2))
##Plot2
plot(datetime, energy$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")
        ##NewPlot in the Upper Right
plot(datetime, energy$Voltage,
     type = "l", 
     ylab = "Voltage")
        ##Plot3
energy2 <- cbind(datetime, energy)
plot(energy2$datetime, energy2$Sub_metering_1, type = "l", col = "black", 
     xlab = "",
     ylab = "Energy sub metering")
points(energy2$datetime, energy2$Sub_metering_2, type = "l", col = "red")
points(energy2$datetime, energy2$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)
        ##NewPlot in the Lower Right
plot(datetime, energy$Global_reactive_power,
     type = "l", 
     ylab = "Global_reactive_power")
dev.off()