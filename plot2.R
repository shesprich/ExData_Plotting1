# Load script for downloading and loading data
source("getData.R")

# Use load_data function sourced from getData.R to load data
energyData <- load_data()

ylab <- "Global Active Power (kilowatts)"


png(file = "plot2.png")
plot(energyData$DateTime, energyData$Global_active_power, ylab = ylab, xlab = "", type = "l")
dev.off()