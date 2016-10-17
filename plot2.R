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
     data$Global_active_power, 
     type="l",
     xlab = "",
     ylab ="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
