# Load script for downloading and loading data
source("getData.R")

# Use load_data function sourced from getData.R to load data
energyData <- load_data()

png(file = "plot4.png")
# Set up par
par(mfrow = c(2,2))

# upper left hand plot
ylab <- "Global Active Power"

plot(energyData$DateTime, energyData$Global_active_power, ylab = ylab, xlab = "", type = "l")

# Upper right hand plot
ylab <- "Voltage"

plot(energyData$DateTime, energyData$Voltage, ylab = ylab, xlab = "", type = "l")

# Lower left hand plot
ylab <- "Energy sub metering"

plot(energyData$DateTime, energyData$Sub_metering_1, ylab = ylab, xlab = "", type = "l")
points(energyData$DateTime, energyData$Sub_metering_2, type = "l", col = "red")
points(energyData$DateTime, energyData$Sub_metering_3, type = "l", col = "blue")
cols <- c("black", "red", "blue")
legend <- c("sub_metering_1", "sub_metering_2", "sub_metering_3")
legend("topright", box.lty = 0, inset = 0.02, lty = 1, col = cols, legend = legend)

# Lower right hand plot
ylab <- "Global_reactive_power"
xlab <- "datetime"

plot(energyData$DateTime, energyData$Global_reactive_power, ylab = ylab, xlab = xlab, type = "l")
dev.off()