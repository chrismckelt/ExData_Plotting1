# Title: plot3.R
# Author: Chris McKelt

# setup references, download files and read via sqldf into variable 'hpc'
source("include.R")

# prepare Date & Times by merging date and time and casting to as.POSIXct
timespan <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S") %>% as.POSIXct

#draw
plot(timespan, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(timespan, hpc$Sub_metering_2, col = "red", type = "l", ylab = "", xlab = "")
lines(timespan, hpc$Sub_metering_3, col = "blue", type = "l", ylab = "", xlab = "")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), cex = .75, box.lty = 0)

# send to png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
