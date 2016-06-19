# Title: plot4.R
# Author: Chris McKelt

# setup references, download files and read via sqldf into variable 'hpc'
source("include.R")

# prepare Date & Times by merging date and time and casting to as.POSIXct
timespan <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S") %>% as.POSIXct

# 2 x 2 matrix
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))

# 1
plot(timespan, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# 2 
plot(timespan, hpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# 3 - cut and paste from plot3 with cex = .50, box.lty = 0 to resize legend
plot(timespan, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(timespan, hpc$Sub_metering_2, col = "red", type = "l", ylab = "", xlab = "")
lines(timespan, hpc$Sub_metering_3, col = "blue", type = "l", ylab = "", xlab = "")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), cex = .50, box.lty = 0)

# 4 
plot(timespan, hpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# send to png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
