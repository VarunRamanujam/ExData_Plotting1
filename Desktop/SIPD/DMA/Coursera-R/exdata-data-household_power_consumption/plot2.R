

a <- read.table("household_power_consumption.txt", header = TRUE ,sep =";", na.strings= "?", fill= TRUE )

start_date <- c("1/2/2007")
end_date <- c("2/2/2007")


a1 <- subset(a, Date == start_date)
a2 <- subset(a, Date == end_date)
b  <- rbind(a1, a2)


datetime <- paste(b$Date, b$Time, sep=" ")
b$Datetime <- strptime(datetime, format= "%d/%m/%Y %H:%M:%S")
b$Global_active_power <- as.numeric(b$Global_active_power)

## Plot 2


plot(b$Datetime, b$Global_active_power, type = "l",  xlab = "",  ylab = "Global Active Power (kilowatts)")

dev.copy(png, 'plot2.png', width = 480, height = 480,   units = "px", bg = "transparent")
dev.off()
