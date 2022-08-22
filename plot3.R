# Load script for downloading and loading data
source("getData.R")

# Use load_data function sourced from getData.R to load data
energyData <- load_data()

ylab <- "Energy sub metering"

png(file = "plot3.png")
plot(energyData$DateTime, energyData$Sub_metering_1, ylab = ylab, xlab = "", type = "l")
points(energyData$DateTime, energyData$Sub_metering_2, type = "l", col = "red")
points(energyData$DateTime, energyData$Sub_metering_3, type = "l", col = "blue")
cols <- c("black", "red", "blue")
legend <- c("sub_metering_1", "sub_metering_2", "sub_metering_3")
legend("topright", lty = 1, col = cols, legend = legend)
dev.off()