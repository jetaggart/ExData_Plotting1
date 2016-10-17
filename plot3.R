baseData <- read.table(
  "~/Downloads/household_power_consumption.txt", 
  sep=";", 
  header=TRUE,
  colClasses = c("character", "character", rep("numeric", 7)),
  na.strings = "?")

baseData$Time <- strptime(paste(baseData$Date, baseData$Time), "%d/%m/%Y %H:%M:%S")
baseData$Date <- as.Date(baseData$Date, format="%d/%m/%Y")


data <- subset(
  baseData, 
  Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")
)

plot(data$Time,
     data$Sub_metering_1, 
     type="l",
     xlab = "",
     ylab ="Energy sub metering")

lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

legend("topright",
       col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
