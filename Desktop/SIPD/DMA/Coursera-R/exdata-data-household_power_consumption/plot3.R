

a <- read.table("household_power_consumption.txt", header = TRUE ,sep =";", na.strings= "?", fill= TRUE )

start_date <- c("1/2/2007")
end_date <- c("2/2/2007")


a1 <- subset(a, Date == start_date)
a2 <- subset(a, Date == end_date)
b  <- rbind(a1, a2)


datetime <- paste(b$Date, b$Time, sep=" ")
b$Datetime <- strptime(datetime, format= "%d/%m/%Y %H:%M:%S")
b$Sub_metering_1 <- as.numeric(b$Sub_metering_1)
b$Sub_metering_2 <- as.numeric(b$Sub_metering_2)
b$Sub_metering_3 <- as.numeric(b$Sub_metering_3)

## Plot 3

with (b, {
  plot(b$Datetime, b$Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering")
  lines(b$Datetime,b$Sub_metering_2, col = "Red")
  lines(b$Datetime,b$Sub_metering_3, col = "Blue")

})


dev.copy(png, 'plot3.png', width = 480, height = 480,   units = "px", bg = "transparent")
dev.off()
