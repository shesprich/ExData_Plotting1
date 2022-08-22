# Load script for downloading and loading data
source("getData.R")

# Use load_data function sourced from getData.R to load data
energyData <- load_data()

xlab <- "Global Active Power (kilowatts)"
title <- "Global Active Power"
col <- "red"

png(file = "plot1.png")
hist(energyData$Global_active_power, xlab = xlab, main = title, col = col)
dev.off()