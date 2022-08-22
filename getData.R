get_data <- function() {
  
  library(dplyr)

  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  fileName <- "exdata_data_household_power_consumption.zip"
  
  # Download Data if needed
  if (!file.exists(fileName)) {
    download.file(fileUrl, destfile = fileName)
    unzip(fileName)
  }
  
}

load_data <- function() {
  library(dplyr)
  
  fileName <- "household_power_consumption.txt"
  
  # Download Data if needed
  if (!file.exists(fileName)) {
    get_data()
  }
  
  # Load data if not already loaded
  if (!exists('energyData')) {
    energyData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                             colClasses = c("character", "character", rep("numeric", 7)))
    energyData %>% 
      # Convert date and time into single DateTime
      mutate(DateTime = strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")) %>%
      # Remove Date and Time columns as they are no loger needed
      select(Global_active_power:DateTime) %>% 
      # Filter out only dates necessary for plots
      filter(DateTime > '2007-02-01') %>% 
      filter(DateTime < '2007-02-03')
  } else {
    energyData
  }
  
}