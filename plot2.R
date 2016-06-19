# Title: plot2.R
# Author: Chris McKelt

# setup references, download files and read via sqldf into variable 'hpc'
source("include.R")

# prepare Date & Times by merging date and time and casting to as.POSIXct
day_times <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S") %>% as.POSIXct

# plot histogram for "Global Active Power"
plot(day_times, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# send to png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
