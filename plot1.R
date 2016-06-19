# Title: plot1.R
# Author: Chris McKelt

# setup references, download files and read via sqldf into variable 'hpc'
source("include.R")

# create histogram
hist(hpc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = 'Frequency', col = "red", cex.lab = 1.4, cex.main = 1.7, cex.axis = 1.4)

# copy plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()



