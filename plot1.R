baseData <- read.table(
  "~/Downloads/household_power_consumption.txt", 
  sep=";", 
  header=TRUE,
  colClasses = c("character", "character", rep("numeric", 7)),
  na.strings = "?")
baseData$Date <- as.Date(baseData$Date, format="%d/%m/%Y")

data <- subset(
  baseData, 
  Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")
)

hist(data$Global_active_power, 
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
