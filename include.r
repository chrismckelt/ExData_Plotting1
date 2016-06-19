# Title: includes.R
# Version: 1.0
# Author: Chris McKelt

####packages and setup
rm(list = ls()) # clear vars
setwd("C:/dev/ExData_Plotting1")

# references
list.of.packages <- c("dplyr", "tidyr", "sqldf", "data.table")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]
if (length(new.packages))
    install.packages(new.packages)
sapply(list.of.packages, library, character.only = TRUE, quietly = FALSE)

# download zip from url and unpack
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path <- getwd()
filename <- "household_power_consumption.zip"
zip_file <- file.path(path, filename)

if (!file.exists(zip_file)) {
    download.file(url, zip_file)
    unzip(zip_file, exdir = path)
}

# import dates of interest (by using the "sqldf" library)
hpc <- read.csv.sql(
    file = "household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    stringsAsFactors = FALSE,
    sql = "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'") # note SQL BETWEEN not returning the correct results (US DATES?)